# portfile.cmake for libmp4

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Apra-Labs/libmp4
    REF a745e148af258d5ab3d6cb65fb2e420bba7e9526
    SHA512 4438feed01b35ae37da768f0841a0af7a5fff0dbd09dd22d49d1182b500941643597de399cab253f93bbb635d07beb143f4823acb60089b02cc83f4e15e3c1a4
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

