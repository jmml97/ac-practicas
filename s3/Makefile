
# VARIABLES
BIN 	= bin
SRC 	= src

# Definición de compiladores
CC = gcc -O2 -fopenmp

# Colección de objetos a compilar
OBJECTS = schedule-clause pmtv-secuencial scheduled-clauseModificado5 if-clauseModificado  pmm-secuencial scheduled-clauseModificado scheduled-clause scheduleg-clause pmm-OpenMP pmtv-OpenMP scheduled-clauseModificado4

# TODO (sin empaquetado)
all: clean $(OBJECTS)


# COMPILACION
$(OBJECTS):
	$(CC) -o $(BIN)/$@ $(SRC)/$@.c

# EMPAQUETADO
# Genera el archivo .tgz de la práctica mediante la linea de comandos
# Omite los archivos propios de MacOSX y coge el nombre del directorio como nombre
.PHONY: package
package: clean
	@echo "Empaquetando..."
	tar --exclude "*.tgz" --exclude "*.DS_Store" --exclude "*.pdf" --exclude "__MACOSX" --exclude datos -czvf ../$(shell basename "$(CURDIR)").tgz .

# LIMPEZA
# Limpia los archivos compilados, así como los archivos objeto y los paquetes zip
.PHONY: clean
clean:
	@echo "Limpiando..."
	@rm -f $(BIN)/*
