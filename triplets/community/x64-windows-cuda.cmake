# Custom triplet for CUDA builds on Windows with VS 2019 (v142) toolset
# CUDA 11.8 is only compatible with VS 2019 (v142), not VS 2022 (v143)
# This triplet ensures OpenCV CUDA builds succeed with the correct compiler version

set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_PLATFORM_TOOLSET "v142")
set(VCPKG_DEP_INFO_OVERRIDE_VARS "v142")
