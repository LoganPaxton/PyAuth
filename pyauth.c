#include <Python.h>
#include <stdio.h>
#include "cJSON/cJSON.h"
#include <string.h>
#include "tiny-AES-c/aes.h"
#include <stdlib.h> // For rand()

#define AES_KEY_SIZE 16 // AES-128
#define AES_BLOCK_SIZE 16

// Function prototype for write_json
int write_json(const char *filename, const char *key, const char *value);

const char *json_path;

void pad_input(const char *input, unsigned char *output, int *output_len) {
    int input_len = strlen(input);
    *output_len = ((input_len / AES_BLOCK_SIZE) + 1) * AES_BLOCK_SIZE;
    memset(output, 0, *output_len);
    memcpy(output, input, input_len);

    int pad = *output_len - input_len;
    for (int i = input_len; i < *output_len; i++) {
        output[i] = pad;
    }
}

int encrypt(const char *input, const unsigned char *key, unsigned char *output, unsigned char *iv) {
    struct AES_ctx ctx;
    AES_init_ctx(&ctx, key);

    int iv_allocated = 0;
    if (!iv) {
        iv = (unsigned char *)malloc(AES_BLOCK_SIZE);
        iv_allocated = 1;
        for (int i = 0; i < AES_BLOCK_SIZE; i++) {
            iv[i] = rand() % 256;
        }
    }
    AES_ctx_set_iv(&ctx, iv);

    unsigned char padded_input[AES_BLOCK_SIZE * ((strlen(input) / AES_BLOCK_SIZE) + 1)];
    int padded_len;
    pad_input(input, padded_input, &padded_len);

    AES_CBC_encrypt_buffer(&ctx, padded_input, padded_len);

    memcpy(output, iv, AES_BLOCK_SIZE);
    memcpy(output + AES_BLOCK_SIZE, padded_input, padded_len);

    if (iv_allocated) {
        free(iv);
    }

    return 0;
}

int decrypt(const unsigned char *input, const unsigned char *key, unsigned char *output, unsigned char *iv) {
    struct AES_ctx ctx;
    AES_init_ctx(&ctx, key);

    const unsigned char *iv_ptr = input;
    AES_ctx_set_iv(&ctx, iv_ptr);

    int input_total_len = strlen((char *)input);
    if (input_total_len < AES_BLOCK_SIZE) {
        return 1; // Invalid input length
    }
    int ciphertext_len = input_total_len - AES_BLOCK_SIZE;

    memcpy(output, input + AES_BLOCK_SIZE, ciphertext_len);
    AES_CBC_decrypt_buffer(&ctx, output, ciphertext_len);

    int pad_len = output[ciphertext_len - 1];
    if (pad_len < 1 || pad_len > AES_BLOCK_SIZE) {
        return 1;
    }
    for (int i = ciphertext_len - pad_len; i < ciphertext_len; i++) {
        if (output[i] != pad_len) {
            return 1;
        }
    }

    output[ciphertext_len - pad_len] = '\0';

    return 0;
}

// Function to write data to JSON
int write_json(const char *filename, const char *key, const char *value) {
    // Create a new JSON object
    cJSON *json = cJSON_CreateObject();
    if (!json) {
        fprintf(stderr, "Failed to create JSON object\n");
        return 1;
    }

    // Add key-value pair
    cJSON_AddStringToObject(json, key, value);

    // Convert JSON to string
    char *json_string = cJSON_Print(json);
    if (!json_string) {
        fprintf(stderr, "Failed to print JSON\n");
        cJSON_Delete(json);
        return 1;
    }

    // Open file for writing
    FILE *file = fopen(filename, "w");
    if (!file) {
        fprintf(stderr, "Failed to open file: %s\n", filename);
        free(json_string);
        cJSON_Delete(json);
        return 1;
    }

    // Write JSON string to file
    fprintf(file, "%s\n", json_string);

    // Cleanup
    fclose(file);
    free(json_string);
    cJSON_Delete(json);

    return 0; // Success
}

// Function to initialize JSON file path
PyObject* initialize(PyObject* self, PyObject *args) {
    if (!PyArg_ParseTuple(args, "s", &json_path)) {
        return NULL;
    }

    if (strcmp(json_path, "") == 0) {
        printf("You need to provide a JSON file!\n");
        PyErr_SetString(PyExc_ValueError, "JSON file path is empty.");
        return NULL;
    }

    Py_RETURN_NONE;
}

// Function to register account (encrypts password and saves to JSON)
PyObject* register_account(PyObject* self, PyObject *args) {
    const char *username;
    const char *password;
    const char *hash_password;

    if (!PyArg_ParseTuple(args, "sss", &username, &password, &hash_password)) {
        return NULL;
    }

    if (strcmp(json_path, "") == 0) {
        PyErr_BadInternalCall();
        return NULL;
    }

    if (strcmp(username, "") == 0 || strcmp(password, "") == 0) {
        printf("Username or password cannot be empty!\n");
        PyErr_SetString(PyExc_ValueError, "Username or password cannot be empty.");
        return NULL;
    }

    // Prepare the encryption key from the provided hash_password
    unsigned char key[AES_KEY_SIZE];
    memcpy((char *)key, hash_password, AES_KEY_SIZE);  // Use the provided password as the AES key

    unsigned char encrypted_password[128];  // Buffer to hold the encrypted password
    unsigned char iv[AES_BLOCK_SIZE];      // Buffer for IV

    // Encrypt the password using AES
    if (encrypt(password, key, encrypted_password, iv) != 0) {
        PyErr_SetString(PyExc_RuntimeError, "Error encrypting password.");
        return NULL;
    }

    // Convert the encrypted password to hexadecimal format for storage in JSON
    char hex_encrypted_password[256];
    for (int i = 0; i < 128; i++) {
        sprintf(&hex_encrypted_password[i * 2], "%02x", encrypted_password[i]);
    }

    // Store the encrypted password in JSON
    if (write_json(json_path, username, hex_encrypted_password) != 0) {
        PyErr_SetString(PyExc_RuntimeError, "Error saving to JSON file.");
        return NULL;
    }

    Py_RETURN_NONE;
}

// Define methods for the module
static PyMethodDef PyLockrMethods[] = {
    {"initialize", initialize, METH_VARARGS, "Initialize a new PyLockr object."},
    {"register_account", register_account, METH_VARARGS, "Create a new user account."},
    {NULL, NULL, 0, NULL}
};

// Define the module
static struct PyModuleDef PyLockrModule = {
    PyModuleDef_HEAD_INIT,
    "PyLockr",
    "A Python authentication system.",
    -1,
    PyLockrMethods
};

// Module initialization function
PyMODINIT_FUNC PyInit_PyLockr(void) {
    return PyModule_Create(&PyLockrModule);
}