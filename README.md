# Template_CPP  FIXME

## requirements

Testing

```sh
# catch2 (Linux/macOS/Windows)
git clone https://github.com/catchorg/Catch2.git
cd Catch2
cmake -B ./build -S .
cmake --build ./build --parallel
(sudo) cmake --build ./build --target install

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
