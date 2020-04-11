
if(__libtcc_extension_compile_definitions)
    return()
endif()
set(__libtcc_extension_compile_definitions INCLUDED)

function(libtcc_extension_compile_definitions __LIBTCC_COMPILE_DEFINITIONS__)
    if(DEFINED ${__LIBTCC_COMPILE_DEFINITIONS__})
        list(APPEND __COMPILE_DEFINITIONS__ "${${__LIBTCC_COMPILE_DEFINITIONS__}}")
    endif()

    include(extension/cmake/libtcc1_sources.cmake)
    get_libtcc1_sources(LIBTCC_TARGET_ARCHITECTURE CMAKE_SYSTEM_NAME LIBTCC1_SOURCES TRUE)
    string(REPLACE ";" ":" LIBTCC1_SOURCES "${LIBTCC1_SOURCES}")
    list(APPEND __COMPILE_DEFINITIONS__ ALIBTCC_ENABLE_EXTENSION ALIBTCC1_SOURCES=\"${LIBTCC1_SOURCES}\")

    list(APPEND __COMPILE_DEFINITIONS__ ALIBTCC_INCLUDE_PATH=\"${LIBTCC_INCLUDE_PATH}\")

    list(APPEND __COMPILE_DEFINITIONS__ ALIBTCC1_SRC_PATH=\"${LIBTCC1_SRC_PATH}\")
    list(APPEND __COMPILE_DEFINITIONS__ ALIBTCC1_OBJ_PATH=\"${LIBTCC1_OBJ_PATH}\")
    list(APPEND __COMPILE_DEFINITIONS__ ALIBTCC1_DEST_PATH=\"${LIBTCC1_DEST_PATH}\")

    set(${__LIBTCC_COMPILE_DEFINITIONS__} "${__COMPILE_DEFINITIONS__}" PARENT_SCOPE)
endfunction()