@echo OFF
rem VLMaw startup script

set command=
if "%1" == "start" goto env
if "%1" == "stop" goto env
goto usage

:env
set command=%1

cd /d %~dp0%
call vlma-env.cmd

call bin\build_cp.cmd "%VLMA_LIBS%\web"
set VLMA_CLASSPATH=%VLMA_CLASSPATH%;"%JAVA_HOME%\lib\tools.jar"

set VLMA_OPTS=-Dvlma.home="%VLMA_HOME%" -Dvlma.conf="%VLMA_CONF%" -Dvlma.logs="%VLMA_LOGS%" -Djetty.lib="%VLMA_LIBS%\web" -Dvlma.webapps="%VLMA_WEBAPPS%" -DSTOP.PORT=8079 -DSTOP.KEY=vlmaw -classpath %VLMA_CLASSPATH%

set OPTS=%VLMA_OPTS% %JAVA_OPTS%  org.mortbay.start.Main

if "%command%" == "start" goto start
if "%command%" == "stop" goto stop

:start
set OPTS=%OPTS% "%VLMA_CONF%\jetty.xml"
goto run

:stop
set OPTS=%OPTS% --stop

:run
echo [INFO] Launching %JAVA% %OPTS%

rem Run VLMaw
"%JAVA%" %OPTS%

goto end

:usage
echo usage: vlmaw.bat (start^|stop^|help)

:end
