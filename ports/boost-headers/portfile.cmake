# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/headers
    REF boost-${VERSION}
    SHA512 26c133cdba56454077dd405c1daca53317e5a7bd2f7be2ed7978f089f90eae0c8ac0ccf33e4da4cb63d6e5423b645ceea0c4fd9fca78957fdbf64296ee5cdaee
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
