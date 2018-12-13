# `cortex-m-toolchain`

Conan package with CMake toolchain file for Arm Cortex-M processors and [GNU Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm).

# Requirements
* CMake >= 3.6 (required for [testing compiler without linking phase](https://cmake.org/cmake/help/latest/variable/CMAKE_TRY_COMPILE_TARGET_TYPE.html#variable:CMAKE_TRY_COMPILE_TARGET_TYPE))

# Supported cores
* Cortex-M0
* Cortex-M0+
* Cortex-M3
* Cortex-M4
* Cortex-M7

>**NOTE** Options for FPU on M4 and M7 are currently not supported.

# Usage
Modify *settings.yml* (*$HOME/.conan/settings.yml*):
* Add *Generic* os:
    ```
    os:
        ...
        Generic:
    ```
* Add new architectures:
    ```
    arch: [..., cortex-m0, cortex-m0plus, cortex-m3, cortex-m4, cortex-m7]
    ```

Export package:
```
$ conan export . USER/CHANNEL
```

Add package to *build requirements* of your project conanfile:
```
class MyProject(ConanFile):
   build_requires = "cortex-m-toolchain"
```

Build project with desired settings, e.g.:
```
$ conan install . -s os=Generic -s arch=cortex-m0plus
$ conan build .
```

# License
Content of this repository is licensed under the [MIT License](https://github.com/adigie/cortex-m-toolchain/blob/master/LICENSE).