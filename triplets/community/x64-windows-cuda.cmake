# Custom triplet for CUDA builds on Windows with VS 2019 (v142) toolset
# CUDA 11.8 is only compatible with VS 2019 (v142), not VS 2022 (v143)
# This triplet ensures OpenCV CUDA builds succeed with the correct compiler version

set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_PLATFORM_TOOLSET "v142")
set(VCPKG_DEP_INFO_OVERRIDE_VARS "v142")

# Build only Release configuration to save ~2-3 hours of build time
# Debug builds are not needed for CI testing
set(VCPKG_BUILD_TYPE release)

# Limit CUDA architectures to reduce OpenCV CUDA compilation time
# Default builds for 8+ architectures which takes hours
# GitHub runners use older GPUs or no GPU at all, so we target common architectures:
# - 7.5: Turing (T4, commonly used in cloud)
# - 8.6: Ampere (A10, A30)
set(VCPKG_CMAKE_CONFIGURE_OPTIONS
    "-DCUDA_ARCH_BIN=7.5;8.6"
    "-DCUDA_ARCH_PTX="
)
