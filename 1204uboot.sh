#!/bin/bash

UBOOT=$PWD
#generate the cscope.files 
find $UBOOT \
	-path "$UBOOT/include/configs*"  								-prune -o 	\
	-path "$UBOOT/board/*" 											-prune -o	\
	-path "$UBOOT/nand_spl/*" 										-prune -o	\
	-path "$UBOOT/onenand_ipl/*" 									-prune -o	\
	-path "$UBOOT/doc/*" 											-prune -o	\
	-path "$UBOOT/arch/arm/cpu*" ! -path "$UBOOT/arch/arm/cpu/arm920t*"	-prune -o	\
	-path "$UBOOT/arch/arm/include/asm*" ! -path "$UBOOT/arch/arm/include/asm/arch-s3c24x0*"	-prune -o	\
	-path "$UBOOT/arch/*" ! -path "$UBOOT/arch/arm*"	-prune -o	\
	-path "$UBOOT/examples/*" 										-prune -o	\
	-path "$UBOOT/tools/*" 											-prune -o	\
	-name "*.[chsS]" -print > $UBOOT/cscope.files

find $UBOOT/include/configs/ -name smdk2440.h >>  $UBOOT/cscope.files	
find $UBOOT/board/samsung/smdk2440/ -name "*.[chsS]" >>  $UBOOT/cscope.files	
#find $UBOOT/board/samsung/smdk2440/ -name lowlevel_init.S >>  $UBOOT/cscope.files	
find $UBOOT/arch/arm/cpu/arm920t/ -name "*.[chsS]" >>  $UBOOT/cscope.files	
#find $UBOOT/arch/arm/cpu/arm920t/s3c24x0 -name "*.[chsS]" >>  $UBOOT/cscope.files	
#find $UBOOT/arch/arm/cpu/arm920t/ -name cpu.c >>  $UBOOT/cscope.files	
#find $UBOOT/arch/arm/cpu/arm920t/ -name interrupts.c >>  $UBOOT/cscope.files	
cscope -bkq -i $UBOOT/cscope.files

#generate the cppcomplete 
ctags -n -f cppcomplete.tags --fields=+ai --C++-types=+p * -L $UBOOT/cscope.files
#Try setting the $CSCOPE_DB environment variable to point to a Cscope database you create, so you won't al#ways need to launch Vim in the same directory as the database.
export CSCOPE_DB=$UBOOT/cscope.out
#export CSCOPE_DB 
#usage:
#cp cppcomplete.tags tags
