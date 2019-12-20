MD C:\work\Senla\Grades\BatchFolderName
@echo Folder was created
@echo .>C:\work\Senla\Grades\BatchFolderName\TestFile.txt
@echo test>C:\work\Senla\Grades\BatchFolderName\TestFile.txt
@echo File was created
MD C:\work\Senla\Grades\BatchFolderName2
copy C:\work\Senla\Grades\BatchFolderName\TestFile.txt C:\work\Senla\Grades\BatchFolderName2
RD /S /Q C:\work\Senla\Grades\BatchFolderName
@pause