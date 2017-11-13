# summation

sum=0

for x in $* 
do
   sum=`expr $sum + $x`

done

echo "Summation of "$#" integers are: "$sum 


