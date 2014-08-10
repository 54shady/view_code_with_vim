#!/bin/sh

set -x 

KERNEL=$PWD

find $KERNEL/arch/arm/boot/ -name "*.[chsS]" -print > $KERNEL/cscope.files
find $KERNEL/arch/arm/common/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/arch/arm/kernel/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/arch/arm/lib/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/arch/arm/mach-s3c2410/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/arch/arm/mach-s3c2440/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/arch/arm/mm/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/arch/arm/nwfpe/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/arch/arm/plat-s3c24xx/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/arch/arm/vfp/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/block -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/crypto -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/drivers -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/fs -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/include/acpi/ -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/include/asm-arm/ -maxdepth 1 -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/include/asm-arm/arch-s3c2410/  -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/include/asm-arm/mach/  -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/include/asm-arm/plat-s3c24xx/  -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/include/asm-arm/hardware/  -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/include/linux/  -name "*.[chsS]" -print >> $KERNEL/cscope.files
find $KERNEL/init/  -name "*.[chsS]" -print >> $KERNEL/cscope.files

cscope -bkq -i $KERNEL/cscope.files

ctags -n -f tags --fields=+aiS  * -L $KERNEL/cscope.files

export CSCOPE_DB=$KERNEL/cscope.out

