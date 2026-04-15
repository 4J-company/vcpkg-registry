vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO 4J-company/mr-manager
    REF "v${VERSION}"
    SHA512 8c9b5ff5ec2ab1a08ed88a391f365545d91aa9459f890fbdea0be41aaf7feb73ee8603b9dae81805bed38708ce2f7ade0e9fe1f34977380ce7dcb89ebb78b914
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME mr-manager CONFIG_PATH lib/cmake/mr-manager)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
