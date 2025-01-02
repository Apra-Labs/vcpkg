vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Apra-Labs/tritonclient
    REF 1e4c45194ebac8b567f24244b9dfd67a9e36228f
    SHA512 9342c0a7ed15dfe7ba9114b674a1f9de3e5ff173a3e4e545ba21797d4f435ea228280cdc1e570612866f320cbf6a92936ef860b747b800b9a13225b60988d7b6
    HEAD_REF vcpkgPort
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}" 
)

vcpkg_build_cmake()

vcpkg_install_cmake()


# Install headers and libraries
file(INSTALL ${SOURCE_PATH}/include/ DESTINATION ${CURRENT_PACKAGES_DIR}/include)

# Install all .so files
file(INSTALL ${CURRENT_BUILDTREES_DIR}/x64-linux-dbg/*.so DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(INSTALL ${CURRENT_BUILDTREES_DIR}/x64-linux-rel/*.so DESTINATION ${CURRENT_PACKAGES_DIR}/lib)

