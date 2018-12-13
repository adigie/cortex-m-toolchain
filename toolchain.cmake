cmake_minimum_required(VERSION 3.6 FATAL_ERROR)

set(TARGET_CPU TARGET_CPU_VALUE)

set(CONAN_CMAKE_SYSTEM_NAME Generic)
set(CONAN_CMAKE_SYSTEM_PROCESSOR ${TARGET_CPU})

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

set(COMMON_FLAGS "-mthumb -mcpu=${TARGET_CPU}")
set(C_CXX_FLAGS "--specs=nano.specs -ffunction-sections -fdata-sections -ffreestanding")

set(CMAKE_C_FLAGS_INIT "${COMMON_FLAGS} ${C_CXX_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_INIT "${COMMON_FLAGS} ${C_CXX_FLAGS} -fno-exceptions -fno-rtti -fno-threadsafe-statics" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_INIT "${COMMON_FLAGS} -x assembler-with-cpp" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_INIT "--specs=nano.specs -Wl,--gc-sections" CACHE STRING "" FORCE)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)