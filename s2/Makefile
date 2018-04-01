# file Makefile
CC= gcc
RM= rm -vf
CFLAGS= -fopenmp
CPPFLAGS= -I.

OBJDIR=obj
BINDIR=bin

SRCFILES= $(wildcard src/*.c)
OBJFILES= $(patsubst %.c, %.o, $(SRCFILES))
OBJFILES= $(addprefix $(OBJDIR)/, $(OBJFILES))
PROGFILES= $(patsubst %.c, %, $(SRCFILES))
PROGLIST=$(addprefix ../$(BINDIR)/, $(PROGFILES))

.PHONY: all

all: $(PROGFILES)
clean:
	$(RM) $(OBJFILES) $(PROGFILES) *~
## eof Makefile

###########################################
# BIN=./bin/				  #
# SOURCE=./source/			  #
# 					  #
# LIST=$(BIN)/program1 $(BIN)/program2... #
# 					  #
# all: $(LIST)				  #
# 					  #
# $(BIN)/%:  $(SOURCE)%.cpp		  #
# $(CC) $(INC) $< $(CFLAGS) -o $@ $(LIBS) #
# 					  #
# PROG=program1 program2		  #
# LIST=$(addprefix $(BIN)/, $(PROG))	  #
###########################################
