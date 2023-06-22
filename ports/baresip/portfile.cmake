# Replace the placeholders with the appropriate values for your library

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Apra-Labs/baresip
  REF 7dc4bf58ec58924e57963f4ca77b56379fa7d307
  SHA512 7006be03ca74d1e78db9bfc5e9bf7e8fdaaa05c13cc0b3f0d79aaf82fa87d7e712a6eabaf295569aa6c5e0c64492e24f0e7319d9b6f1f2f973266f5266a5dba4
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  CMAKE_BUILD_TYPE "Debug"
)


vcpkg_build_cmake(
)

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share")


file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/debug/share/${PORT}"
  RENAME license
)

