TEMPLATE = lib

CONFIG += dll

QRENCODE_VERSION_MAJOR    = 3
QRENCODE_VERSION_MINOR    = 4
QRENCODE_VERSION_REVISION = 4
DEFINES                += "QRENCODE_VERSION_MAJOR=$$QRENCODE_VERSION_MAJOR"
DEFINES                += "QRENCODE_VERSION_MINOR=$$QRENCODE_VERSION_MINOR"
DEFINES                += "QRENCODE_VERSION_REVISION=$$QRENCODE_VERSION_REVISION"
QRENCODE_FILE_VER      = -$${QRENCODE_VERSION_MAJOR}.$${QRENCODE_VERSION_MINOR}.$${QRENCODE_VERSION_REVISION}

win32 {
    CONFIG(debug, debug|release) {
        TARGET = $$join(TARGET,,,d)
    } else {
    }
}
unix {
    QRENCODE_LIB_POSTFIX = $${QRENCODE_FILE_VER}
    TARGET = $$join(TARGET,,,$${QRENCODE_LIB_POSTFIX})
}


DESTDIR = $$PWD/lib/

SOURCES += \
    split.c \
    rsecc.c \
    qrspec.c \
    qrinput.c \
    qrencode.c \
    mqrspec.c \
    mmask.c \
    mask.c \
    bitstream.c

HEADERS += \
    split.h \
    rsecc.h \
    qrspec.h \
    qrinput.h \
    qrencode_inner.h \
    qrencode.h \
    mqrspec.h \
    mmask.h \
    mask.h \
    bitstream.h \
    config.h

DEFINES += \
    HAVE_CONFIG_H \
    MAKE_QRENCODE_LIB
