# portfile.cmake for libmp4

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Apra-Labs/libmp4
    REF 1dbad6b6690f7b4a9d8cbfafa91a5e305c58331a
    SHA512 d290ee15b9df189f081b980eceb2deb1687de159580ceacda23def5f3f7f938e014c2e9935e3a82f643d566e985bca0cc3ea22fd1558aecc50aa33794061ba2a
    HEAD_REF forApraPipes
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

