################################################################################
# STM32F429IGTx_FIRE GCC compiler Makefile
################################################################################
# ------------------------------------------------
# Generic Makefile (based on gcc)
# ------------------------------------------------

################################################################################
# target
################################################################################
TARGET = Huawei_LiteOS
################################################################################
# building variables
################################################################################
# debug build?
DEBUG = 1
# optimization
OPT = -O0 -g

USE_OTA := no
OTA_IS_NEED_DTLS := no

################################################################################
# binaries
################################################################################
PREFIX    = arm-none-eabi-
CC        = $(PREFIX)gcc
AS        = $(PREFIX)gcc -x assembler-with-cpp
OBJCOPY   = $(PREFIX)objcopy
OBJDUMP   = $(PREFIX)objdump
AR        = $(PREFIX)ar
SZ        = $(PREFIX)size
LD        = $(PREFIX)ld
HEX       = $(OBJCOPY) -O ihex
BIN       = $(OBJCOPY) -O binary -S


PROJECTBASE = $(abspath $(CURDIR))
TOP_DIR     = $(abspath $(PROJECTBASE)/../../../../../..)

#this is for IoT Studio automatic generating kconfig compatibility
ifndef SDK_DIR
    SDK_DIR=$(TOP_DIR)
endif


################################################################################
#common variables for other module or components
C_SOURCES =
C_DEFS =
C_INCLUDES =
LDFLAGS =
ASM_SOURCES_S =
AS_DEFS =
AS_INCLUDES =
PERIFLIB_SOURCES =
LIBS =
LIBDIR =
LDFLAGS =
ASFLAGS =
CFLAGS =


##########################LOAD THE SOURCES INCLUDES AND DEFINES#################
include $(PROJECTBASE)/kconfig.mk
include $(PROJECTBASE)/config.mk
include $(PROJECTBASE)/project.mk
################################################################################
# paths
################################################################################

BUILD_DIR = appbuild

################################################################################
# LDFLAGS
################################################################################
LD_FILE = os.ld
LDSCRIPT := $(PROJECTBASE)/$(LD_FILE)

LDFLAGS    += -Wl,--defsym,RAM_START=$(CONFIG_RAM_START)
LDFLAGS    += -Wl,--defsym,RAM_SIZE=$(CONFIG_RAM_SIZE)
LDFLAGS    += -Wl,--defsym,ROM_START=$(CONFIG_ROM_START)
LDFLAGS    += -Wl,--defsym,ROM_SIZE=$(CONFIG_ROM_SIZE)

################################################################################
# firmware library
################################################################################


################################################################################
# CFLAGS
################################################################################
# cpu
CPU = -mcpu=cortex-m4
# fpu
FPU = -mfpu=fpv4-sp-d16
# float-abi
FLOAT-ABI = -mfloat-abi=hard
# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# compile gcc flags
ASFLAGS += $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS += $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif

# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$@"

# excluded unnecessary warnings
CFLAGS += -Wno-missing-braces


# libraries
LIBS += -lc -lm -lnosys
ifeq ($(USE_OTA), yes)
LIBS += -lhwpatch
endif
LIBDIR  += -L$(PROJECTBASE)/../Lib
LDFLAGS += $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections



# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin
#all:
#	@echo $(C_SOURCES)

################################################################################
# build the application
################################################################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES_S:.S=.o)))
vpath %.S $(sort $(dir $(ASM_SOURCES_S)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR)
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@
#	$(CC) -E $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< > $@.i

$(BUILD_DIR)/%.o: %.S Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@

$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@

$(BUILD_DIR):
	mkdir $@

################################################################################
# clean up
################################################################################
clean:
	-rm -fR .dep $(BUILD_DIR)

################################################################################
# dependencies
################################################################################
#-include $(shell mkdir .dep 2>/dev/null) $(wildcard .dep/*)
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
