# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/accumulators
    REF boost-${VERSION}
    SHA512 7eb409a8e62de8d525c56ef247542fe9bbb61738cc463fcf0023cbb56ab153253898b3decd109f132851facd35f5b76f0ad4a2f4441fd4fd9ba840ff4c805ffd
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
