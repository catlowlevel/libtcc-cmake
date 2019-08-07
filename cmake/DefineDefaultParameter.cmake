set(LIBTCC_CONFIG_PATH "${CMAKE_CURRENT_SOURCE_DIR}/include/tcc/config.h")

set(LIBTCC_RUNTIME_TARGET_DIR_DEFAULT ${CMAKE_BINARY_DIR})
set(LIBTCC_SHARED_TARGET_DIR_DEFAULT ${CMAKE_BINARY_DIR})
set(LIBTCC_BUILD_TYPE_DEFAULT STATIC)
set(LIBTCC_TARGET_SPECIFIC_NAME_DEFAULT FALSE)
set(LIBTCC_INSTALL_RUNTIME_DEFAULT TRUE)
set(LIBTCC_INSTALL_SHARED_TO_BINARY_DEFAULT TRUE)
set(LIBTCC_ENABLE_EXTENSION TRUE)

if(NOT DEFINED LIBTCC_RUNTIME_TARGET_DIR)
    set(LIBTCC_RUNTIME_TARGET_DIR ${LIBTCC_RUNTIME_TARGET_DIR_DEFAULT})
endif()
if(NOT DEFINED LIBTCC_SHARED_TARGET_DIR)
    set(LIBTCC_SHARED_TARGET_DIR ${LIBTCC_SHARED_TARGET_DIR_DEFAULT})
endif()
if(NOT DEFINED LIBTCC_BUILD_TYPE)
    set(LIBTCC_BUILD_TYPE ${LIBTCC_BUILD_TYPE_DEFAULT})
endif()
if(NOT DEFINED LIBTCC_TARGET_SPECIFIC_NAME)
    set(LIBTCC_TARGET_SPECIFIC_NAME ${LIBTCC_TARGET_SPECIFIC_NAME_DEFAULT})
endif()
if(NOT DEFINED LIBTCC_INSTALL_RUNTIME)
    set(LIBTCC_INSTALL_RUNTIME ${LIBTCC_INSTALL_RUNTIME_DEFAULT})
endif()
if(${LIBTCC_BUILD_TYPE} MATCHES "SHARED" AND ((NOT DEFINED LIBTCC_INSTALL_SHARED_TO_BINARY AND LIBTCC_INSTALL_SHARED_TO_BINARY_DEFAULT) OR (DEFINED LIBTCC_INSTALL_SHARED_TO_BINARY AND LIBTCC_INSTALL_SHARED_TO_BINARY)))
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${LIBTCC_SHARED_TARGET_DIR})
endif()