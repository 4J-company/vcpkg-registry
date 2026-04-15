vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO 4J-company/mr-utils
    REF "v${VERSION}"
    SHA512 b96767669badeda647c74a69d71efce1800eea77eebe67b31d9b2da102b1b3c04d2b9868b62761a208cf2d9781681d8a45dce710a8452862d3a6ee7d129ba6c7
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME mr-utils CONFIG_PATH lib/cmake/mr-utils)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
