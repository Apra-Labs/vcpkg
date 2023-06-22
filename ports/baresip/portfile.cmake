# Replace the placeholders with the appropriate values for your library

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Apra-Labs/baresip
  REF 334dc223d57b32f6f31a704cedaf0b5128c0fa1f
  SHA512 1fd194dea9fab01d30eb9769a0c85b17f974e91424eae0cabc1127ddd20a9d9b0ed2f84ec767cb1226d0227f1ed0c08efe84e1709c64437c8e41e5aa13489998
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

