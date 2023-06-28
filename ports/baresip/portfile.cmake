# portfile.cmake for Baresip

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Apra-Labs/baresip
  REF c4614cfb66ae2e5aa4f4a66fef0d12e191ea515b
  SHA512 f0e137bd2f313fa7b1eacd58fdc13c26daa7b212d29afaab4c5641ede5d707eb96fa0f6f38d877d36d6fcaffac81fcae47bad842ce86b6b18546c3431a8d5274
  HEAD_REF forApraPipes
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_build_cmake()

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME license
)

