#!/bin/bash
heads=0
tails=0
declare -A singlet
for((i=1; i<=10; i++))
do
coin=$(( RANDOM%2))
if [ $coin -eq 0 ]
then
singlet[c”$i”]=”head”
((heads++))
else
singlet[c”$i”]=”tail”
((tails++))
fi
done
for key in ${!singlet[@]}
do
echo “$key : ${singlet[$key]}”
done
H=$(($heads/10))
T=$(($tails/10))
heads_percent=$(($H*100))
tails_percent=$(($T*100))
echo $heads_percent %of heads
echo $tails_percent % of tails
