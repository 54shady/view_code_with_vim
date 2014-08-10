dir  /s /b /c *.c *.h > cscope.files
cscope -b
ctags -R
