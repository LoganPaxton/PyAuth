from setuptools import setup, Extension

module = Extension(
    'pyauth',
    sources=['pyauth.c', 'tiny-AES-c/aes.c', 'cJSON/cJSON.c'],  # Include your module, AES, and cJSON sources
    include_dirs=[
        '/usr/local/include',  # Standard include path
        '/workspaces/PyAuth/cJSON',  # Path to cJSON headers
        'tiny-AES-c',  # Path to tiny-AES-c headers
    ],
    libraries=['ssl', 'crypto'],  # Link OpenSSL libraries
    library_dirs=['/opt/conda/lib', '/usr/lib/x86_64-linux-gnu'],  # Add OpenSSL library paths
    extra_compile_args=['-fPIC'],  # Position-independent code for shared libraries
    extra_link_args=['-L/opt/conda/lib', '-L/usr/lib/x86_64-linux-gnu', '-lssl', '-lcrypto'],  # Explicitly link OpenSSL libraries
)

setup(
    name='pyauth',
    version='1.0',
    description='Authentication module using AES',
    ext_modules=[module],
)