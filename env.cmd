@echo off

setlocal
set "path=%cd%\"
endlocal && (
  call :processFolder %path%
)

goto :eof

:processFolder
setlocal
for %%p in ("%1..\") do SET "path=%%~fp"
endlocal && (
  if %1 NEQ %path% call :processFolder %path%
)
IF EXIST "%1.env" (
  FOR /F "usebackq delims=" %%a in (`"findstr ^^ %1.env"`) do (
    @REM echo %%a
    set %%a
  )
)
goto :eof

:eof