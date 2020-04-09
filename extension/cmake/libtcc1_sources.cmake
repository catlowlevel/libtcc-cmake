
if(__get_libtcc1_sources)
    return()
endif()
set(__get_libtcc1_sources INCLUDED)

function(get_libtcc1_sources __TARGET_ARCHITECTURE__ __TARGET_PLATFORM__ __LIBTCC1_SOURCES__ __STATUS_MESSAGE__)
    string(TOLOWER ${${__TARGET_PLATFORM__}} __LIBTCC1_TARGET_PLATFORM__)
    if(DEFINED ${__LIBTCC1_SOURCES__})
        list(APPEND __SOURCES__ "${${__LIBTCC1_SOURCES__}}")
    endif()

    set(__SOURCES_BCHECK__ bcheck.c)
    set(__SOURCES_BT__ bt-log.c)
    set(__SOURCES_B__ bcheck.c bt-dll.c)

    set(__SOURCES_DSO__ dsohandle.c)

    set(__SOURCES_WIN__ crt1.c crt1w.c wincrt1.c wincrt1w.c dllcrt1.c dllmain.c)

    set(__SOURCES_I386__ libtcc1.c alloca86.S alloca86-bt.S ${__SOURCES_BT__})
    set(__SOURCES_X86_64__ libtcc1.c alloca86_64.S alloca86_64-bt.S ${__SOURCES_BT__})
    set(__SOURCES_ARM__ libtcc1.c armeabi.c alloca-arm.S armflush.c ${__SOURCES_BT__})
    set(__SOURCES_ARM64__ lib-arm64.c ${__SOURCES_BT__})
    set(__SOURCES_RISCV64__ lib-arm64.c ${__SOURCES_BT__})

    list(APPEND __SOURCES__ ${__SOURCES_${${__TARGET_ARCHITECTURE__}}__})
    if(__LIBTCC1_TARGET_PLATFORM__ STREQUAL "windows")
        list(APPEND __SOURCES__ ${__SOURCES_WIN__})
        if(${${__TARGET_ARCHITECTURE__}} STREQUAL I386 OR ${${__TARGET_ARCHITECTURE__}} STREQUAL X86_64)
            list(APPEND __SOURCES__ chkstk.S ${__SOURCES_B__})
        endif()
    elseif(__LIBTCC1_TARGET_PLATFORM__ STREQUAL "darwin")
        if(${${__TARGET_ARCHITECTURE__}} STREQUAL X86_64)
            list(APPEND __SOURCES__ va_list.c)
        endif()
    else()
        if(${${__TARGET_ARCHITECTURE__}} STREQUAL I386)
            list(APPEND __SOURCES__ ${__SOURCES_BCHECK__})
        elseif(${${__TARGET_ARCHITECTURE__}} STREQUAL X86_64)
            list(APPEND __SOURCES__ va_list.c ${__SOURCES_BCHECK__})
        endif()
        list(APPEND __SOURCES__ ${__SOURCES_DSO__})
    endif()

    if(${__STATUS_MESSAGE__})
        message(STATUS "Libtcc1 source files: ${__SOURCES__}")
    endif()

    set(${__LIBTCC1_SOURCES__} ${__SOURCES__} PARENT_SCOPE)
endfunction()