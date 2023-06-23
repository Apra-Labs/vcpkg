# Replace the placeholders with the appropriate values for your library

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Apra-Labs/libmp4
  REF ae73a3b07a8b6d8015276a2d7a87158b67f4b334
  SHA512 f9b2e0de0d6b64b111364c29b28b4ee0a4dfef3b5f9d83ee50dc832536d3106908ac63c34862695e187c9fa97ef6c103a7fa2cf076fd32f2e75c7d39c8151e19
  HEAD_REF forApraPipes2
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
    CMAKE_BUILD_TYPE "Debug"
)

vcpkg_build_cmake()

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")


