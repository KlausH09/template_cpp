# Template_CPP  FIXME

## requirements

Testing

```sh
# clone submodule catch2
git submodule update --init --recursive

# for memcheck (only Linux+GNU)
sudo apt-get install valgrind

# for code coverage (only Linux+GNU)
sudo apt-get install lcov

# for linting (only Linux+GNU)
sudo apt install clang-tidy
```

## c_cpp_properties.json

```json
{
    "configurations": [
        {
            "name": "Windows",
            "includePath": [
                "${workspaceFolder}/**",
                "${workspaceFolder}/include",
                "C:/Program Files (x86)/Catch2/include"
            ],
            "cppStandard": "c++20",
            "intelliSenseMode": "gcc-x64"
        }
    ],
    "version": 4
}
```
