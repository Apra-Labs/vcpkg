# portfile.cmake for libmp4

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Apra-Labs/libmp4
    REF 9dc8932466a6e06e06363b4e33a1bfde171cc518
    SHA512 9a22d10b750229b75265edf25e460876853f54d590ac23575889abaa4ea68a05e9402c28a4f93f2c9218799ef99046cecdb2e40d1f5ec6e6a08bbdc4ea80f2a3
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

