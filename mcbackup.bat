@echo off
setlocal

rem Script created for Data
rem Install 7-zip and make sure to create an environment variable to allow for shortcuts
rem https://www.7-zip.org/download.html
rem set PATH=%PATH%;C:\Program Files\7-Zip\
rem echo %PATH%
rem 7z

rem 7ZIP ENVIRONMENT VARIABLE PATH
set "PATH=%PATH%;C:\Program Files\7-Zip"

rem SET SOURCE, DESTINATION AND REVISION AMOUNT VARIABLES
set "source=C:\Users\User\Desktop\BedRock Server\worlds"
set "destination=Y:\BedrockBackups"
set "revisions=3"

rem GET TIME and DATE VARIABLES AND BUILD FILENAME STRUCTURE
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set DateTime=%%a

set Yr=%DateTime:~0,4%
set Mon=%DateTime:~4,2%
set Day=%DateTime:~6,2%
set Hr=%DateTime:~8,2%
set Min=%DateTime:~10,2%
set Sec=%DateTime:~12,2%
set BackupName=%Hr%-%Min%-%Sec%_%Yr%-%Mon%-%Day%

rem CHANGE DIRECTORY TO THE SOURCE DATA FOLDER
pushd "%source%" && (

rem RUN THE COMMAND TO COMPRESS THE DIRECTORY in 4GB FILES, GATHER THE DATE STAMP AND INSERT COMPRESSED FILE INTO DESTINATION FOLDER
    7z a -r -v4g "%destination%\%BackupName% mcbackup.7z"
    popd
)

rem CHECK FOR REVISIONS
pushd "%destination%" && (
    
rem DELETE BY LOGGED DATE.  REQUIRES DATESTAMP YYYY-MM-DD FOR CORRECT SORTING

if exist Backup.log (
    findstr /c:"%BackupName%" Backup.log || >> Backup.log echo %BackupName%
    ) else (
		> Backup.log %BackupName%
)

for /f "skip=%revisions% delims=" %%A in ('type Backup.log ^| sort /r') do (
		del "%%A mcbackup.7z.*"
    )
    popd
)
