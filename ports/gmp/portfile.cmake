if(EXISTS "${CURRENT_INSTALLED_DIR}/include/gmp.h" OR "${CURRENT_INSTALLED_DIR}/include/gmpxx.h")
    message(FATAL_ERROR "Can't build ${PORT} if mpir is installed. Please remove mpir, and try install ${PORT} again if you need it.")
endif()

if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO ShiftMediaProject/gmp
        REF 0018c44e8dfcc3b64b43e0aea4b3f419f0b65fd0 #v6.2.1-2
        SHA512 2405e2536ca9fe0b890f44f54c936ac0e4b5a9ebe6a19e1c48a9c21b7211d2a1b45865852e3c65a98a6735216a4e27bea75c0fd6e52efeed4baecd95da9895a5
        HEAD_REF master
        PATCHES
            vs.build.patch
            runtime.patch
            adddef.patch
    )

    yasm_tool_helper(OUT_VAR YASM)
    file(TO_NATIVE_PATH "${YASM}" YASM)

    if(VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
        set(CONFIGURATION_RELEASE ReleaseDLL)
        set(CONFIGURATION_DEBUG DebugDLL)
    else()
        set(CONFIGURATION_RELEASE Release)
        set(CONFIGURATION_DEBUG Debug)
    endif()

    if(VCPKG_TARGET_IS_UWP)
        string(APPEND CONFIGURATION_RELEASE WinRT)
        string(APPEND CONFIGURATION_DEBUG WinRT)
    endif()

    #Setup YASM integration
    set(_porjectfile)
    if(VCPKG_TARGET_IS_UWP)
        set(_porjectfile "${SOURCE_PATH}/SMP/libgmp_winrt.vcxproj")
    else()
        set(_porjectfile "${SOURCE_PATH}/SMP/libgmp.vcxproj")
    endif()
    set(_file "${_porjectfile}")
    file(READ "${_file}" _contents)
    string(REPLACE  [[<Import Project="$(VCTargetsPath)\BuildCustomizations\yasm.props" />]]
                     "<Import Project=\"${CURRENT_HOST_INSTALLED_DIR}/share/vs-yasm/yasm.props\" />"
                    _contents "${_contents}")
    string(REPLACE  [[<Import Project="$(VCTargetsPath)\BuildCustomizations\yasm.targets" />]]
                     "<Import Project=\"${CURRENT_HOST_INSTALLED_DIR}/share/vs-yasm/yasm.targets\" />"
                    _contents "${_contents}")
    file(WRITE "${_file}" "${_contents}")

    vcpkg_install_msbuild(
        USE_VCPKG_INTEGRATION
        SOURCE_PATH ${SOURCE_PATH}
        PROJECT_SUBPATH SMP/libgmp.sln
        PLATFORM ${TRIPLET_SYSTEM_ARCH}
        LICENSE_SUBPATH COPYING.LESSERv3
        TARGET Rebuild
        RELEASE_CONFIGURATION ${CONFIGURATION_RELEASE}
        DEBUG_CONFIGURATION ${CONFIGURATION_DEBUG}
        SKIP_CLEAN
        OPTIONS "/p:YasmPath=${YASM}"
    )
    get_filename_component(SOURCE_PATH_SUFFIX "${SOURCE_PATH}" NAME)
    file(RENAME "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/${SOURCE_PATH_SUFFIX}/msvc/include" "${CURRENT_PACKAGES_DIR}/include")
    set(PACKAGE_VERSION 6.2.1)
    set(PACKAGE_NAME gmp)
    set(prefix "${CURRENT_INSTALLED_DIR}")
    set(exec_prefix "\${prefix}")
    set(libdir "\${prefix}/lib")
    set(includedir "\${prefix}/include")
    set(LIBS -lgmp)
    configure_file("${SOURCE_PATH}/gmp.pc.in" "${CURRENT_PACKAGES_DIR}/lib/pkgconfig/gmp.pc" @ONLY)
    configure_file("${SOURCE_PATH}/gmpxx.pc.in" "${CURRENT_PACKAGES_DIR}/lib/pkgconfig/gmpxx.pc" @ONLY)
    set(prefix "${CURRENT_INSTALLED_DIR}/debug")
    set(exec_prefix "\${prefix}")
    set(libdir "\${prefix}/lib")
    set(includedir "\${prefix}/../include")
    set(LIBS -lgmpd)
    configure_file("${SOURCE_PATH}/gmp.pc.in" "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig/gmp.pc" @ONLY)
    configure_file("${SOURCE_PATH}/gmpxx.pc.in" "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig/gmpxx.pc" @ONLY)
    vcpkg_fixup_pkgconfig()
    if(VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
        vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/gmp.h"
                            "#if defined(DLL_EXPORT) && defined(NO_ASM)"
                            "#if 1")
    endif()
else()
    vcpkg_download_distfile(
        ARCHIVE
        URLS https://gmplib.org/download/gmp/gmp-6.3.0.tar.xz
        FILENAME gmp-6.3.0.tar.xz
        SHA512 e85a0dab5195889948a3462189f0e0598d331d3457612e2d3350799dba2e244316d256f8161df5219538eb003e4b5343f989aaa00f96321559063ed8c8f29fd2
    )

    vcpkg_extract_source_archive_ex(
        OUT_SOURCE_PATH SOURCE_PATH
        ARCHIVE ${ARCHIVE}
        REF gmp-6.3.0
        PATCHES
            tools.patch
    )

    vcpkg_configure_make(
        SOURCE_PATH ${SOURCE_PATH}
        AUTOCONFIG
        OPTIONS
            --enable-cxx
    )

    vcpkg_install_make()
    vcpkg_fixup_pkgconfig()
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share/")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

    # # Handle copyright
    file(INSTALL "${SOURCE_PATH}/COPYINGv3" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
endif()
