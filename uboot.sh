#!/bin/sh

#this is for uboot 2012.04
UBOOT=$PWD

find $UBOOT/arch/arm/cpu/arm920t/ -maxdepth 1 -name "*.[chsS]" -print > $UBOOT/cscope.files
find $UBOOT/board/samsung/mini2440/ -name "*.[chsS]" -print >> $UBOOT/cscope.files
find $UBOOT/arch/arm/include/asm/ -maxdepth 1 -name "*.[chsS]" -print >> $UBOOT/cscope.files
find $UBOOT/arch/arm/include/asm/arch-s3c24x0/  -name "*.[chsS]" -print >> $UBOOT/cscope.files
find $UBOOT/arch/arm/lib/ -name "*.[chsS]" -print >> $UBOOT/cscope.files
find $UBOOT/arch/arm/cpu/arm920t/s3c24x0/ -name "*.[chsS]" -print >> $UBOOT/cscope.files
find $UBOOT/drivers/ -name "*.[chsS]" -print >> $UBOOT/cscope.files
find $UBOOT/lib/ -name "*.[chsS]" -print >> $UBOOT/cscope.files
find $UBOOT/common/ -name "*.[chsS]" -print >> $UBOOT/cscope.files
find $UBOOT/include/ -maxdepth 1 -name "*.[chsS]"  -print >> $UBOOT/cscope.files
find $UBOOT/include/andestech/  -name "*.[chsS]"  -print >> $UBOOT/cscope.files
find $UBOOT/include/asm-generic/  -name "*.[chsS]"  -print >> $UBOOT/cscope.files
find $UBOOT/include/bedbug/  -name "*.[chsS]"  -print >> $UBOOT/cscope.files
find $UBOOT/include/cramfs/  -name "*.[chsS]"  -print >> $UBOOT/cscope.files
find $UBOOT/include/mtd/  -name "*.[chsS]"  -print >> $UBOOT/cscope.files
find $UBOOT/include/linux/mtd/  -name "*.[chsS]"  -print >> $UBOOT/cscope.files
find $UBOOT/include/configs/ -name mini2440.h -print >> $UBOOT/cscope.files

cscope -bkq -i $UBOOT/cscope.files

ctags -n -f uboot2012tags --fields=+aiS  * -L $UBOOT/cscope.files

export CSCOPE_DB=$UBOOT/cscope.out

