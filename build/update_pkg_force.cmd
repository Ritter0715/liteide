@echo off

setlocal

set BUILD_ROOT=%CD%
if x%LITEIDE_ROOT%==x set LITEIDE_ROOT=%CD%\..\liteidex

echo GOROOT=%GOROOT%
echo BUILD_ROOT=%BUILD_ROOT%
echo LITEIDE_ROOT=%LITEIDE_ROOT%
echo .

go version

if ERRORLEVEL 1 goto go_fail

echo update liteide tools ...

cd %LITEIDE_ROOT%
if defined %GOPATH (
	set GOPATH=%CD%;%GOPATH%
) else (
	set GOPATH=%CD%
)
echo GOPATH=%GOPATH%

echo get gocode ...
rmdir /s /q  src\github.com\nsf\gocode
go get -v -u "github.com/nsf/gocode"
echo get gotools ...
rmdir /s /q src\github.com\visualfc\gotools
go get -v -u "github.com/visualfc/gotools"
echo get gomodifytags ...
rmdir /s /q src\github.com\fatih\gomodifytags
go get -v -u github.com/fatih/gomodifytags

cd %BUILD_ROOT%

goto end

:go_fail
echo error, go fail
goto end

:end
