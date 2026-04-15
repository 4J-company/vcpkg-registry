vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO 4J-company/mr-importer
    REF "v${VERSION}"
    SHA512 4cff01b1d4b071f982d07cc0c48d5fc02022bd20f03b221fbc87ecd73e0350d4d3fad0873ff89eef62e1483b1fbc205b8bdf0088e2e24aeab4ddb019598afc90
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DMR_IMPORTER_BUILD_TESTS=OFF
        -DMR_IMPORTER_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME mr-importer CONFIG_PATH lib/cmake/mr-importer)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
