@echo off
set sourceFolder=D:\DokuWikiStick\dokuwiki\data\pages
set destinationFolder=C:\Users\Markus\Documents\DokuWikiStick\dokuwiki\data\pages
set folderToDelete=C:\Users\Markus\Documents\DokuWikiStick\dokuwiki\data\pages\wichtig\p


echo Copying files from %sourceFolder% to %destinationFolder%...
xcopy /E /Y /I "%sourceFolder%" "%destinationFolder%"
echo Copy completed.


echo Deleting folder %folderToDelete%...
rd /S /Q "%folderToDelete%"
echo Delete completed.

pause
