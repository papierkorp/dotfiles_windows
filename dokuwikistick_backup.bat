@echo off

set sourceFolder=D:/nonSchule/DokuWikiStick/dokuwiki/data/pages
if not exist "%sourceFolder%" (
    set sourceFolder=E:/nonSchule/DokuWikiStick/dokuwiki/data/pages
)
set destinationFolder=C:/Users/Markus/Documents/DokuWikiStick/dokuwiki/data/pages
set folderToDelete=C:/Users/Markus/Documents/DokuWikiStick/dokuwiki/data/pages/wichtig/p
set hostname=%COMPUTERNAME%
set dontdelete=papierkorp

echo Copying files from %sourceFolder% to %destinationFolder%...
xcopy /E /Y /I "%sourceFolder%" "%destinationFolder%"
echo Copy completed.

echo hostname: %hostname%
echo dontdelete this hostname: %dontdelete%

if /I "%hostname%" NEQ "%dontdelete%" (
    echo Deleting folder %folderToDelete%...
    rd /S /Q "%folderToDelete%"
    echo Delete completed.
) else (
    echo Skipping deletion as hostname is %dontdelete%.
)

pause
