#!/bin/bash

# Name: Muqadas Faiz    |    Student ID: 26567    |    ITC 350    |    Assignment 1

clear


# Prompting for and validating user input.

# Prompting for alphabet input and "Space Key" to make it possible to read names with spaces.
# The input is restricted to strings without numeric data.
echo "Enter Student name: "
read name
while ! [[ $name =~ ^-?[[:alpha:]]+$ || $name =~ " " ]]; do
	echo "Please enter a valid name: "
	read name
done

# Prompting for digit input only since ID numbers are always integers.
echo "Enter Student ID: "
read sid
while ! [[ $sid =~ ^-?[[:digit:]]+$ ]]; do
	echo "Please enter a valid student ID: "
	read sid
done

# Prompting for a valid gender type. The input is restricted to take only alphabet characters since no space is needed
# and user must enter either Male, Female, or Unknown.
echo "Enter Gender: "
read gender
while ! [[ $gender =~ ^-?[[:alpha:]]+$ ]]; do
	echo "Please specify a valid gender: "
	read gender
done


# Prompting for integer or float input only withing the specified range. The logic is the same for Assignment Mark,
# Lab Participation Mark, Quiz Mark, Midter Mark, and Final Mark.

echo "Enter Assignment mark: "
read assmark
while ! [[ $assmark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ || $assmark =~ ^-?[[:digit:]]+$ && $assmark -ge 0 && $assmark -le 20 ]]; do
	echo "Please enter a valid input within the range of 0-20: "
	read assmark
done

echo "Enter Lab Participation mark: "
read labpartmark
while ! [[ $labpartmark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ || $labpartmark =~ ^-?[[:digit:]]+$ && $labpartmark -ge 0 && $labpartmark -le 10 ]]; do
	echo "Please enter a valid input within the range of 0-10: "
	read labpartmark
done

echo "Enter Quiz mark: "
read quizmark
while ! [[ $quizmark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ || $quizmark =~ ^-?[[:digit:]]+$ && $quizmark -ge 0 && $quizmark -le 10 ]]; do
	echo "Please enter a valid input within the range of 0-10: "
	read quizmark
done

echo "Enter Midterm mark: "
read midtermmark
while ! [[ $midtermmark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ || $midtermmark =~ ^-?[[:digit:]]+$ && $midtermmark -ge 0 && $midtermmark -le 30 ]]; do
	echo "Please enter a valid input within the range of 0-30: "
	read midtermmark
done

echo "Enter Final mark: "
read finalmark
while ! [[ $finalmark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ || $finalmark =~ ^-?[[:digit:]]+$ && $finalmark -ge 0 && $finalmark -le 30 ]]; do
	echo "Please enter a valid input within the range of 0-30: "
	read finalmark
done


# Calculating the total marks with floating numbers summation ability using the specialized calculator program called 'bc'.
total=$(echo $assmark + $labpartmark + $quizmark + $midtermmark + $finalmark | bc)


# Rounding down the total marks from float and converting it to integer to make it possible for determining the letter grades
# since comparison conditions are only possible with integer expressions in BASH.
if [[ $total =~ ^-?[[:digit:]]*\.[[:digit:]]+$ ]]; then
	total=$(echo "scale=0;($total-0.5)/1" | bc)
fi


# Determining the letter grade from total marks
if [[ $total -gt 90 && $total -le 100 ]]; then
	grade="A"
	
elif [[ $total -eq 90 ]]; then
	grade="A-"
	
elif [[ $total -gt 80 && $total -lt 90 ]]; then
	grade="B"

elif [[ $total -eq 80 ]]; then
	grade="B-"

elif [[ $total -gt 70 && $total -lt 80 ]]; then
	grade="C"

elif [[ $total -eq 70 ]]; then
	grade="C-"

elif [[ $total -ge 60 && $total -lt 70 ]]; then
	grade="D"

elif [[ $total -lt 60 ]]; then
	grade="F"
fi


# Defining functions to for echoing the headings and individual records to avoid clutter and make the code efficient and less verbose.
# Moreover, it is effective used in the next section of the code which handles the issues associated with exporting to CSV format.
headings() {
	echo "Student Name", "Student Number", "Gender", "Assignment", "Lab Participation", "Quiz", "Midterm", "Final", "Total", "Grade" >> OSSGrades.csv
}

records() {
	echo "$name", "$sid", "$gender", "$assmark", "$labpartmark", "$quizmark", "$midtermmark", "$finalmark", "$total", "$grade" >> OSSGrades.csv
}


# The following code determines if the file OSSGrades.csv exists in the Desktop user folder and check if it contains the headings.
# If the file contains the headings, then it will only store the new record to the file and avoid duplicating the headings.
# If it finds out the headings are not contained in the file, then it will print both the headings and the new record and
# subsequently will only print the new records.
if [[ -e "$OSSGrades.csv" ]]; then
  		if egrep -w -R -l 'Student Name|Student Number|Gender|Assignment|Lab Participation|Quiz|Midterm|Final|Total|Final Grade' ~/desktop/; then
  			records
  		else
  			headings
  			records
  		fi
# However, if the OSSGrades.csv file does not exist in the Desktop user folder, it will create it and then handles the headings and records
# issues explained above.
else
	touch OSSGrades.csv
  		if egrep -w -R -l 'Student Name|Student Number|Gender|Assignment|Lab Participation|Quiz|Midterm|Final|Total|Final Grade' ~/desktop/; then
  			records
  		else
  			headings
  			records
  		fi
fi


# Name: Muqadas Faiz    |    Student ID: 26567    |    ITC 350    |    Assignment 1

