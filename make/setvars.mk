#if debug is not set, default to false
DEBUG?=0

# Query CFLAGS and LD_FLAGS from BuildIt
# BuildIt doesn't have to be built for this

ifeq ($(DEBUG), 1)
CFLAGS=-O0 -g
else 
CFLAGS=-O3
endif
LDFLAGS=

LDFLAGS+=-L$(BUILD_DIR) -l$(LIBRARY_NAME)

# These are the flags to send to BuildIt
# This is made into a variable so all three uses use consistent flags
BUILDIT_FLAGS=DEBUG=$(DEBUG)

CFLAGS+=$(shell make --no-print-directory -C $(BUILDIT_DIR)/ $(BUILDIT_FLAGS) compile-flags)
LDFLAGS+=$(shell make --no-print-directory -C $(BUILDIT_DIR)/ $(BUILDIT_FLAGS) linker-flags)

DEPS=$(BUILD_DIR)/buildit.dep
INCLUDE_FLAGS=-I $(INCLUDE_DIR)

LIBRARY=$(BUILD_DIR)/lib$(LIBRARY_NAME).a

