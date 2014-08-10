#!/bin/bash

UBOOT=$PWD
#generate the cscope.files 
find $UBOOT 	\
	-path "$UBOOT/board/*" ! -path "$UBOOT/board/firetux*" -prune -o 	\
	-path "$UBOOT/lib_*" ! \( -path "$UBOOT/lib_arm*" -o -path "$UBOOT/lib_generic*" \) -prune -o 	\
	-path "$UBOOT/cpu/*" ! -path "$UBOOT/cpu/arm926ejs*" -prune -o               \
	-path "$UBOOT/include/asm-*" ! -path "$UBOOT/include/asm-arm*" -prune -o 	\
	-path "$UBOOT/include/asm-arm/arch-*" ! -path "$UBOOT/include/asm-arm/arch-arm926*" -prune -o 	\
	-path "$UBOOT/include/configs*"  -prune -o 	\
        -name "*.[chsS]" -print > $UBOOT/cscope.files

find $UBOOT/include/configs/ -name firetux.h >>  $UBOOT/cscope.files	
cscope -bkq -i $UBOOT/cscope.files

#generate the cppcomplete 
ctags -n -f cppcomplete.tags --fields=+ai --C++-types=+p * -L $UBOOT/cscope.files
#Try setting the $CSCOPE_DB environment variable to point to a Cscope database you create, so you won't al#ways need to launch Vim in the same directory as the database.
export CSCOPE_DB=$UBOOT/cscope.out
#export CSCOPE_DB 
