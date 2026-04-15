vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO 4J-company/mr-math
    REF "v${VERSION}"
    SHA512 e27bee1781c5f8b5dcd4f87c0acf420babb6e22f68b675bd73a6ca4e0c3d919e98197fbc7a19df4f2d452685c0dfdb1464016dbec9aa1c59c89ec17fcb802000
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DMR_MATH_ENABLE_BENCHMARK=OFF
        -DMR_MATH_ENABLE_TESTING=OFF
        -DMR_MATH_ENABLE_PROFILING=OFF
        -DMR_MATH_EXTRA_OPTIMIZED=OFF
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME mr-math-lib)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
