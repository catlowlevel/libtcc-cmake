
if(__libtcc_sources)
    return()
endif()
set(__libtcc_sources INCLUDED)


function(libtcc_sources FLAG STATUS_MESSAGE)
    if(LIBTCC_ONE_SOURCE)
        list(APPEND ${FLAG} src/libtcc.c)
    else()
        list(APPEND ${FLAG} src/libtcc.c src/tccpp.c src/tccgen.c src/tccelf.c src/tccasm.c src/tccrun.c src/tccdbg.c)
        if(LIBTCC_TARGET_ARCHITECTURE STREQUAL I386)
            list(APPEND ${FLAG} src/i386-gen.c src/i386-link.c src/i386-asm.c src/i386-asm.c)
        elseif(${LIBTCC_TARGET_ARCHITECTURE} STREQUAL X86_64)
            list(APPEND ${FLAG} src/x86_64-gen.c src/x86_64-link.c src/i386-asm.c)
        elseif(${LIBTCC_TARGET_ARCHITECTURE} STREQUAL ARM)
            list(APPEND ${FLAG} src/arm-gen.c src/arm-link.c src/arm-asm.c)
        elseif(${LIBTCC_TARGET_ARCHITECTURE} STREQUAL ARM64)
            list(APPEND ${FLAG} src/arm64-gen.c src/arm64-asm.c src/arm64-link.c)
        endif()
        if(WIN32)
            list(APPEND ${FLAG} src/tccpe.c)
        endif()
    endif()

    if(LIBTCC_ENABLE_EXTENSION)
        include(extension/cmake/libtcc_extension_sources.cmake)
        libtcc_extension_sources(${FLAG})
    endif()

    if(STATUS_MESSAGE)
        message(STATUS "Libtcc source files: ${${FLAG}}")
    endif()

    set(${FLAG} ${${FLAG}} PARENT_SCOPE)
endfunction()
