rem Detect JAVA installation
if not "%JAVA_HOME%" == "" goto gotJavaHome
echo [ERROR] JAVA_HOME is not defined.
echo [ERROR] You either need to install a JDK 5.0 or later,
echo [ERROR] or to set the JAVA_HOME environment variable if a JDK is already installed.
goto end

:gotJavaHome
set JAVA=%JAVA_HOME%\bin\java.exe
if exist "%JAVA%" goto gotJava
echo [ERROR] Cannot find the JAVA executable.
echo [ERROR] Please verify that JAVA_HOME really points to a JDK installation.
goto end

:gotJava
rem Set VLMA_HOME
if not "%VLMA_HOME%" == "" goto gotHome
cd /d %~dp0%
cd ..
set VLMA_HOME=%cd%

:gotHome
echo [INFO] Using VLMA_HOME: %VLMA_HOME%
cd %VLMA_HOME%

if not "%VLMA_CONF%" == "" goto gotConf
set VLMA_CONF=%VLMA_HOME%\conf
:gotConf
echo [INFO] Using VLMA_CONF: %VLMA_CONF%

if not "%VLMA_DATA%" == "" goto gotData
set VLMA_DATA=%VLMA_HOME%\data
:gotData
echo [INFO] Using VLMA_DATA: %VLMA_DATA%

if not "%VLMA_LIBS%" == "" goto gotLibs
set VLMA_LIBS=%VLMA_HOME%\lib
:gotLibs
echo [INFO] Using VLMA_LIBS: %VLMA_LIBS%

if not "%VLMA_LOGS%" == "" goto gotLogs
set VLMA_LOGS=%VLMA_HOME%\logs
:gotLogs
echo [INFO] Using VLMA_LOGS: %VLMA_LOGS%

if not "%VLMA_WEBAPPS%" == "" goto gotWebapps
set VLMA_WEBAPPS=%VLMA_HOME%\webapps
:gotWebapps
echo [INFO] Using VLMA_WEBAPPS: %VLMA_WEBAPPS%

if not "%VLMA_WORK%" == "" goto gotWork
set VLMA_WORK=%VLMA_HOME%\work
:gotWork
echo [INFO] Using VLMA_WORK: %VLMA_WORK%

