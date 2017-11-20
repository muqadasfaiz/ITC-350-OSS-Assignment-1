# Muqadas Faiz
# ITC-350-OSS-Assignment-1

Describe how you implemented the gradingSystem.sh script. In particular, briefly discuss:

a. How you handled setting variables and the default values.

b. How your script should be executed.

c. How you handled the VERBOSE variable.

d. How you terminated the program early if the compilation command failed.

e. How you get the input from the user

f. How you handle the input of different data type (e.g., integer, string, etc)

g. How to add more records to the same file

Answers:

a) Considering the nature and requirements of gradingSystem.sh and the way Shell Script works, I did not see it necessary to initiate variables. The variables are directly defined and initiated with the values that are read from user input.

b) First and foremost, the user should change the current working directory to 'Desktop' by executing the command 'cd ./desktop'. Then, the user should be given rx or rwx permission to be able to run the gradingSystem.sh script, e.g chmod 755 gradingSystem.sh. If the provided smaple of OSSGrades.csv file is put to the desktop, then the program will add new records to the OSSGrades.csv file while preserving the already stored records if any. If the file is not put on the Desktop, the program will create a new one.

c) Since the VERBOSE variables in BASH script are unset/off by default, there was no need to worry about VERBOSE commands and variables. For a regular user, the VERBOSE commands will only add confusion. However, for a power user, it can serve well in terms of seeing what each command does along with their outputs.

d) Conditions are carried out in a way to either return true in which case the program will continue to the next phase or will return a false value in which case the program will terminate.

e) The input are received by promting the user by echoing and the then storing the user input to a varialbe by utilizing the built-in 'read' function in Shell Script.

f) The input of different data types are carefully handled by defining precise conditions to only allow the input of the desired data types. If the user enters a data type other than the allowed data types, the user will be prompted to renter a valid data type. This is handled by utilizing while loops to make sure the conditions are met no matter how many times the user inputs the wrong the data type.

g) Just run the gradingSystem.sh script and enter the required data as prompted. The newly entered data will be automatically saved to the OSSGrades.csv file while preserving the already stored data if any. If the file does not exist, it will be added created and then the data will be saved in it.
