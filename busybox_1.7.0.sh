#!/bin/sh

set -x
BUSYBOX=$PWD
echo $BUSYBOX

find $BUSYBOX/ -name *.[chsS] > $BUSYBOX/cscope.files

cscope -bkq -i $BUSYBOX/cscope.files
ctags -n -f tags --fields=+aiS  * -L $BUSYBOX/cscope.files
