# portfile.cmake for Baresip

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Apra-Labs/baresip
  REF d2c57ccd1b3aef35ef53677a7dfe73a6dc064214
  SHA512 b1b06eef3b23c3ece8905cb1156afa5440709feb24f6b575eecbf55443ecf8f6e45c9be7d7ee053e522f1efdea76a7b85a34376806d9c7857d3de1c516d2bbb4
  HEAD_REF forApraPipes
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_build_cmake()

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME license
)

