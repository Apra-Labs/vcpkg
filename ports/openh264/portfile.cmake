vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Apra-labs/openh264
    REF 48f8b7b416f73801aaf8bc972f3630a5340d3868
    SHA512 d94c0d951d1fe1f6e3875d1d5056e9432e8befaed11844f88c373bace7f865e8be0c6c0e0272ca08aa5535fb94db3939642c5355201e13fc24e39a0b541faa11
    HEAD_REF ApraPipesMaster
)

vcpkg_configure_meson(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS -Dtests=disabled
)

vcpkg_install_meson()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()

configure_file("${SOURCE_PATH}/LICENSE" "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" COPYONLY)
