set VLMA_CLASSPATH=
for %%i in ( %1\*.jar ) do call bin\cp_append.cmd %%~fsi
