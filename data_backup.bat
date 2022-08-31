@echo off
color 0a
set source_directory=C:\Users\QEL\Labber\Data\
set destination_dir=D:\LabberDataBackup\
set zipname=TestArchive.zip
set zip_flag=1==1
set copy_flag=1==1

echo %source_directory% -> %destination_dir%
if exist %destination_dir% (
    echo %destination_dir% exists
) else (
    mkdir %destination_dir%
)
if %copy_flag% (
    echo.
	call robocopy %source_directory% %destination_dir% /E
)
if %zip_flag% (
    set zippath=%destination_dir%%zipname%
	echo Add new data to archive
	echo ArchivePath: %zippath% 
	echo ArchiveDstination: %destination_dir%
        cd %destination_dir%
	if exist %zipname% (
	    echo %zipname% exists in the directory.
	) else (
	    call 7z a %zipname% %destination_dir% 
	)
)
pause
