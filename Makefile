#### Tools ####
include config.mk

TCC	  := tools/ADSv1_2/bin/tcc.exe
ACC	  := tools/ADSv1_2/bin/armcc.exe
CC1_OLD  := tools/agbcc/bin/old_agbcc.exe
CPP	  := $(DEVKITARM)/bin/arm-none-eabi-cpp
AS	   := tools/ADSv1_2/bin/armasm.exe
LD	   := tools/ADSv1_2/bin/armlink.exe
OBJCOPY  := tools/ADSv1_2/Bin/fromelf.exe

GFX := tools/gbagfx/gbagfx.exe
AIF := tools/aif2pcm/aif2pcm.exe
MID := $(abspath tools/mid2agb/mid2agb).exe
SCANINC := tools/scaninc/scaninc.exe
PREPROC := tools/preproc/preproc.exe
GBAFIX := tools/gbafix/gbafix.exe

CC1FLAGS := -Wi -Wp -Wb -O2 -Otime -S -g -apcs "/interwork"
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef -D VERSION_$(GAME_VERSION) -D REVISION=$(GAME_REVISION) -D $(GAME_REGION) -D DEBUG=$(DEBUG)
ASFLAGS  := -CPU arm7tdmi -LIttleend -fpu none -apcs "/interwork" -I asminclude -I include

#### Files ####
OBJ_DIR  := build/$(BUILD_NAME)
ROM 	 := $(BUILD_NAME).gba
MAP	  := $(ROM:%.gba=%.map)
ELF	  := $(ROM:%.gba=%.elf)
LDSCRIPT := scatter_script.txt
LDFLAGS = -noremove -libpath tools/ADSv1_2/Lib/

# Build tools when building the rom
# Disable dependency scanning for clean/tidy/tools
#ifeq (,$(filter-out all compare,$(MAKECMDGOALS)))
#$(call infoshell, $(MAKE) tools)
#else
NODEP := 0
#endif

C_SUBDIR = src
C_DATA_SUBDIR = src/data
SRC_ASM_SUBDIR = src
ASM_SUBDIR = asm
DATA_ASM_SUBDIR = data
RODATA_ASM_SUBDIR = rodata
SOUND_ASM_SUBDIR = sound
BANK_ASM_SUBDIR = sound/bank
SEQ_ASM_SUBDIR = sound/seq
WAVE_ASM_SUBDIR = sound/wave
PARTIAL_DECOMP_SUBDIR = partial
MERGED_SUBDIR = merged

C_BUILDDIR = $(OBJ_DIR)/$(C_SUBDIR)
C_DATA_BUILDDIR = $(OBJ_DIR)/$(C_DATA_SUBDIR)
SRC_ASM_BUILDDIR = $(OBJ_DIR)/$(C_SUBDIR)
ASM_BUILDDIR = $(OBJ_DIR)/$(ASM_SUBDIR)
DATA_ASM_BUILDDIR = $(OBJ_DIR)/$(DATA_ASM_SUBDIR)
RODATA_ASM_BUILDDIR = $(OBJ_DIR)/$(RODATA_ASM_SUBDIR)
SOUND_ASM_BUILDDIR = $(OBJ_DIR)/$(SOUND_ASM_SUBDIR)
BANK_ASM_BUILDDIR = $(OBJ_DIR)/$(BANK_ASM_SUBDIR)
SEQ_ASM_BUILDDIR = $(OBJ_DIR)/$(SEQ_ASM_SUBDIR)
WAVE_ASM_BUILDDIR = $(OBJ_DIR)/$(WAVE_ASM_SUBDIR)
PARTIAL_DECOMP_BUILDDIR = $(OBJ_DIR)/$(PARTIAL_DECOMP_SUBDIR)
MERGED_BUILDDIR = $(OBJ_DIR)/$(MERGED_SUBDIR)

#$(shell mkdir -p $(C_BUILDDIR) $(C_DATA_BUILDDIR) $(SRC_ASM_BUILDDIR) $(ASM_BUILDDIR) $(DATA_ASM_BUILDDIR) $(RODATA_ASM_BUILDDIR) $(SOUND_ASM_BUILDDIR) $(BANK_ASM_BUILDDIR) $(SEQ_ASM_BUILDDIR) $(WAVE_ASM_BUILDDIR))

C_SRCS_IN := $(wildcard $(C_SUBDIR)/*.c $(C_SUBDIR)/*/*.c $(C_SUBDIR)/*/*/*.c $(C_SUBDIR)/*/*/*/*.c)
C_SRCS := $(foreach src,$(C_SRCS_IN),$(if $(findstring .inc.c,$(src)),,$(src)))
#C_SRCS := $(wildcard $(C_SUBDIR)/*.c)
C_OBJS := $(patsubst $(C_SUBDIR)/%.c,$(C_BUILDDIR)/%.o,$(C_SRCS))

SRC_ASM_SRCS := $(wildcard $(C_SUBDIR)/*.s $(C_SUBDIR)/*/*.s $(C_SUBDIR)/*/*/*.s)
SRC_ASM_OBJS := $(patsubst $(C_SUBDIR)/%.s,$(SRC_ASM_BUILDDIR)/%.o,$(SRC_ASM_SRCS))

ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s $(ASM_SUBDIR)/*/*.s $(ASM_SUBDIR)/*/*/*.s)
ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

RODATA_ASM_SRCS := $(wildcard $(RODATA_ASM_SUBDIR)/*.s)
RODATA_ASM_OBJS := $(patsubst $(RODATA_ASM_SUBDIR)/%.s,$(RODATA_ASM_BUILDDIR)/%.o,$(RODATA_ASM_SRCS))

SOUND_ASM_SRCS := $(wildcard $(SOUND_ASM_SUBDIR)/*.s)
SOUND_ASM_OBJS := $(patsubst $(SOUND_ASM_SUBDIR)/%.s,$(SOUND_ASM_BUILDDIR)/%.o,$(SOUND_ASM_SRCS))

BANK_ASM_SRCS := $(wildcard $(BANK_ASM_SUBDIR)/*.s)
BANK_ASM_OBJS := $(patsubst $(BANK_ASM_SUBDIR)/%.s,$(BANK_ASM_BUILDDIR)/%.o,$(BANK_ASM_SRCS))

SEQ_ASM_SRCS := $(wildcard $(SEQ_ASM_SUBDIR)/*.s)
SEQ_ASM_OBJS := $(patsubst $(SEQ_ASM_SUBDIR)/%.s,$(SEQ_ASM_BUILDDIR)/%.o,$(SEQ_ASM_SRCS))

WAVE_ASM_SRCS := $(wildcard $(WAVE_ASM_SUBDIR)/*.s)
WAVE_ASM_OBJS := $(patsubst $(WAVE_ASM_SUBDIR)/%.s,$(WAVE_ASM_BUILDDIR)/%.o,$(WAVE_ASM_SRCS))

YML_FILES := $(wildcard $(PARTIAL_DECOMP_SUBDIR)/*.yml  $(PARTIAL_DECOMP_SUBDIR)/*/*.yml  $(PARTIAL_DECOMP_SUBDIR)/*/*/*.yml)

MERGED_ASM_SRCS := $(patsubst $(PARTIAL_DECOMP_SUBDIR)/%.yml,$(MERGED_BUILDDIR)/%.s,$(YML_FILES))
MERGED_ASM_OBJS := $(patsubst $(PARTIAL_DECOMP_SUBDIR)/%.yml,$(MERGED_BUILDDIR)/%.o,$(YML_FILES))

PYTHON := python # or just python, depending on your setup
MERGE_SCRIPT := scripts/merge_partial_c.py

OBJS := $(C_OBJS) $(C_DATA_OBJS) $(SRC_ASM_OBJS) $(ASM_OBJS) $(SOUND_ASM_OBJS) $(BANK_ASM_OBJS) $(SEQ_ASM_OBJS) $(WAVE_ASM_OBJS) $(DATA_ASM_OBJS) $(RODATA_ASM_OBJS) $(MERGED_ASM_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))

SUBDIRS  := $(sort $(dir $(OBJS)))
$(shell mkdir -p $(SUBDIRS))

#### Main Rules ####

# Available targets
.PHONY: all clean tidy tools compile-partial-c

MAKEFLAGS += --no-print-directory
# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:
# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

all: $(ROM)
	# perl calcrom.pl $(MAP)
ifeq ($(COMPARE),1)
	coreutils sha1sum -c $(BUILD_NAME).sha1
endif

compile-partial-c:
	@$(foreach yml,$(YML_FILES),\
		$(PYTHON) $(MERGE_SCRIPT) "$(yml)" "$(PARTIAL_DECOMP_SUBDIR)" "$(PARTIAL_DECOMP_BUILDDIR)" "$(MERGED_BUILDDIR)" "$(TCC)" "$(CC1FLAGS)" "include" "$(MERGE_SCRIPT)";)

compare: $(ROM)
	sha1sum -c $(BUILD_NAME).sha1

clean: mostlyclean

mostlyclean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' -o -iname '*.bcg' \) -exec rm {} +

tidy:
	$(RM) $(ROM) $(ELF) $(MAP) $(OBJS)
	rm -r build


include graphics_file_rules.mk

%.s: ;
%.png: ;
%.pal: ;
%.aif: ;

%.1bpp: %.png  ; $(GFX) $< $@
%.4bpp: %.png  ; $(GFX) $< $@
%.8bpp: %.png  ; $(GFX) $< $@
%.gbapal: %.pal ; $(GFX) $< $@
%.gbapal: %.png ; $(GFX) $< $@
%.lz: % ; $(GFX) $< $@
%.rl: % ; $(GFX) $< $@

#### Dependencies ####
ifeq ($(NODEP),1)
$(C_BUILDDIR)/%.o: c_dep :=
else
$(C_BUILDDIR)/%.o: c_dep = $(shell $(SCANINC) -I include $(C_SUBDIR)/$*.c)
endif

ifeq ($(NODEP),1)
$(ASM_BUILDDIR)/%.o: asm_dep :=
else
$(ASM_BUILDDIR)/%.o: asm_dep = $(shell $(SCANINC) -I "" $(ASM_SUBDIR)/$*.s)
endif

ifeq ($(NODEP),1)
$(DATA_ASM_BUILDDIR)/%.o: data_dep :=
else
$(DATA_ASM_BUILDDIR)/%.o: data_dep = $(shell $(SCANINC) -I include -I "" $(DATA_ASM_SUBDIR)/$*.s)
endif

ifeq ($(NODEP),1)
$(RODATA_ASM_BUILDDIR)/%.o: rodata_dep :=
else
$(RODATA_ASM_BUILDDIR)/%.o: rodata_dep = $(shell $(SCANINC) -I include -I "" $(RODATA_ASM_SUBDIR)/$*.s)
endif

#### Recipes ####

$(C_BUILDDIR)/%.o : $(C_SUBDIR)/%.c $$(c_dep)
	$(TCC) $(CC1FLAGS) -I include -o $(C_BUILDDIR)/$*.s $<
	$(AS) $(ASFLAGS) -o $@ $(C_BUILDDIR)/$*.s

$(SRC_ASM_BUILDDIR)/%.o: $(C_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(MERGED_BUILDDIR)/%.o: $(MERGED_BUILDDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s $$(asm_dep)
	$(AS) $(ASFLAGS) -o $@ $<

$(DATA_ASM_BUILDDIR)/%.o: $(DATA_ASM_SUBDIR)/%.s $$(data_dep)
	$(PREPROC) $< charmap.txt > $(DATA_ASM_BUILDDIR)/$*.p.i
	$(AS) $(ASFLAGS) -o $@ $<

$(RODATA_ASM_BUILDDIR)/%.o: $(RODATA_ASM_SUBDIR)/%.s $$(rodata_dep)
	$(AS) $(ASFLAGS) -o $@ $<

$(SOUND_ASM_BUILDDIR)/%.o: $(SOUND_ASM_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(BANK_ASM_BUILDDIR)/%.o: $(BANK_ASM_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(SEQ_ASM_BUILDDIR)/%.o: $(SEQ_ASM_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(WAVE_ASM_BUILDDIR)/%.o: $(WAVE_ASM_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<
	

$(ELF): compile-partial-c $(OBJS) scatter_script.txt
	$(LD) $(LDFLAGS) -scatter $(LDSCRIPT) -Output $@ $(OBJS)

$(ROM): %.gba: %.elf
	$(OBJCOPY) -bin -output build/objcopy $<
	cp build/objcopy/.text $@
	$(GBAFIX) $@ -p -t"$(TITLE)" -c$(GAME_CODE) -m$(MAKER_CODE) -r$(GAME_REVISION) --silent
