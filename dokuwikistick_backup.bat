@echo off
set sourceFolder=D:/nonSchule/DokuWikiStick/dokuwiki/data/pages
set destinationFolder=C:/Users/Markus/Documents/DokuWikiStick/dokuwiki/data/pages
set folderToDelete=C:/Users/Markus/Documents/DokuWikiStick/dokuwiki/data/pages/wichtig/p


echo Copying files from %sourceFolder% to %destinationFolder%...
xcopy /E /Y /I "%sourceFolder%" "%destinationFolder%"
echo Copy completed.


for /f "tokens=2 delims=: " %%a in ('hostname') do set hostname=%%a

echo %hostname%
if "%hostname%" NEQ "papierkorp" (
    echo Deleting folder %folderToDelete%...
    rd /S /Q "%folderToDelete%"
    echo Delete completed.
) else (
    echo Skipping deletion as hostname is papierkorp.
)

pause
