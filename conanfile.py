from conans import ConanFile, tools
import os


class Conan(ConanFile):
    name = "cortex-m-toolchain"
    version = "0.1.0"
    license = "MIT"
    url = "https://github.com/adigie/cortex-m-toolchain"
    description = "CMake toolchain file for Arm Cortex-M processors and GNU Arm Embedded toolchain."
    settings = {
        "os": [
            "Generic"
        ],
        "arch": [
            "cortex-m0",
            "cortex-m0plus",
            "cortex-m3",
            "cortex-m4",
            "cortex-m7",
        ]
    }
    exports = "toolchain.cmake"

    def build(self):
        tools.replace_in_file(
            "toolchain.cmake", "TARGET_CPU_VALUE", str(self.settings.arch))

    def package(self):
        self.copy("toolchain.cmake")

    def package_info(self):
        self.env_info.CONAN_CMAKE_TOOLCHAIN_FILE = os.path.join(
            self.package_folder, "toolchain.cmake")
