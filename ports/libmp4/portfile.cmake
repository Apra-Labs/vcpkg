# portfile.cmake for libmp4

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Apra-Labs/libmp4
    SHA512 79ee5d9f0ef1ceadb2d7b9807a74ed5309b017eb371f7f6a8435b24b7a7282d4d647d8ea4f6d63d7bebb344f7a736302ee1caf9ab5fe35229792c1a9a52bb377
    REF forApraPipes
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA 
)

vcpkg_build_cmake()

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share")

file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

