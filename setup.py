from setuptools import setup, Extension

module = Extension(
    'pylockr',
    sources=['pyauth.c', 'tiny-AES-c/aes.c', 'cJSON/cJSON.c'],
    include_dirs=[
        '/usr/local/include',
        '/workspaces/PyAuth/cJSON',
        'tiny-AES-c',
    ],
    extra_compile_args=['-fPIC'],
)

setup(
    name='pylockr',
    version='1.0',
    description='Authentication module using AES',
    ext_modules=[module],
)