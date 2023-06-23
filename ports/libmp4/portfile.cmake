# Replace the placeholders with the appropriate values for your library

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Apra-Labs/libmp4
  REF 36448ae0d112f2b2472ac7b058acda98e0e0a390
  SHA512 a0e0022bb0e60cf800ba9914dc34c048a6f706c536148f6cdfcae65c53016c5ea5296404cdb722a33e1569bbb1b813f1200cd4ef9e5872f8459ceb0ae71d1026
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


