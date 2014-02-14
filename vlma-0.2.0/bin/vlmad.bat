@echo OFF
rem VLMad startup script

set command=
if "%1" == "start" goto env
if "%1" == "stop" goto env
if "%1" == "reload" goto env
goto usage

:env
set command=%1

cd /d %~dp0%
call vlma-env.cmd

call bin\build_cp.cmd "%VLMA_LIBS%\daemon"

set VLMA_OPTS=-Dvlma.home="%VLMA_HOME%" -Dvlma.conf="%VLMA_CONF%" -Dvlma.data="%VLMA_DATA%" -Dvlma.logs="%VLMA_LOGS%" -Dvlma.work="%VLMA_WORK%" -Dlog4j.configuration="file:%VLMA_CONF%\log4j.properties" -classpath %VLMA_CLASSPATH%

set OPTS=%VLMA_OPTS% %JAVA_OPTS% org.videolan.vlma.daemon.VLMad %command%

echo [INFO] Launching %JAVA% %OPTS%

rem Run VLMad
"%JAVA%" %OPTS%

goto end

:usage
echo usage: vlmad.bat (start^|stop^|reload^|help)

:end
