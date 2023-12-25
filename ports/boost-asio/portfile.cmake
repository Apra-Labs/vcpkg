# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/asio
    REF boost-1.83.0
    SHA512 83e6f39a4b8e54c89e7e7d322acc9e52a83a2a37f45c834a0267f0dbc1219314ad008f4f97e4cddc0a0c15dbea1785681181cea2e903773bdb31176875e0af95
    HEAD_REF master
    PATCHES windows_alloca_header.patch
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
