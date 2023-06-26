# Replace the placeholders with the appropriate values for your library

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Apra-Labs/baresip
  REF 7dc4bf58ec58924e57963f4ca77b56379fa7d307
  SHA512 51c2fef9cdb8401b68d2759b672a3adb9ab3400482c02a832093938a257016718639cd35629c169ad16da66041bbdd399f8b8437172cf139e5d507db1d72c2ef
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
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

