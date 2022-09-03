@echo off
color 0a

set src_directory=C:\Users\QEL\Labber\Data\
set dst_directory=D:\LabberDataBackup\
set zip_installer=C:\Program Files\7-Zip
set zipname=TestArchive.zip

set zip_flag=1==1
set copy_flag=1==1
set pause_flag=1==0

echo %src_directory% -> %dst_directory%
if exist %dst_directory% (
	echo %dst_directory% exists
) else (
	mkdir %dst_directory%
)
if %copy_flag% (
	echo.
	call robocopy %src_directory% %dst_directory% /E
)
if %zip_flag% (
	set zippath=%dst_directory%%zipname%
	echo Add new data to archive
	echo ArchivePath: %zippath% 
	echo ArchiveDestination: %dst_directory%
        cd %dst_directory%
	if exist %zipname% (
		echo %zipname% exists in the directory.
	) else (
		if exist %zip_installer% (
			echo Find 7z and try to zip %dst_directory% into a zip file.
			call 7z a %zipname% %dst_directory% 
		) else (
			echo Sorry, we cannot compress this directory to a zip file due to missing 7z, please install 7z on your computer!
		)
	)
)
if %cp_flag% (
	pause
)
