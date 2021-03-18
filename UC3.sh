#!/bin/bash -x

H=0 
T=0
HH=0
TT=0 
HT=0 
TH=0 
read -p "How many times you want to flip the coin" flip 
declare -A combination 
for (( i=1; i<=$flip; i++ )) 
do
coin=$(( RANDOM%2 )) 
if [ $coin -eq 0 ] 
then 
((H++)) 
else 
((T++)) 
fi 
done 
for (( i=1; i=$flip; i++ )) 
do 
coin1=$(( RANDOM%2 )) 
coin2=$(( RANDOM%2 )) 
if [ $coin1 -eq 0 -a $coin2 -eq 0 ]
then (( HH++ )) 
elif [ $coin1 -eq 1 -a $coin2 -eq 1 ] 
then 
(( TT++ )) 
elif [ $coin1 -eq 0 -a $coin2 -eq 1 ] 
then
(( HT++ )) 
elif [ $coin1 -eq 1 -a $coin2 -eq 0 ] 
then 
(( TH++ )) 
fi
done 
H=$(( $H/$flip ))
T=$(( $T/$flip )) 
HH=$(( $HH/$flip )) 
TT=$(( $TT/$flip )) 
HT=$(( $HT/$flip )) 
TH=$(( $TH/$flip ))

H_percent=$(($H*100))
T_percent=$(($T*100)) 
HH_percent=$(($HH*100)) 
TT_percent=$(($TT*100)) 
HT_percent=$(($HT*100)) 
TH_percent=$(($TH*100))

combination[“H”]=$H_percent
combination[“T”]=$T_percent
combination[“HH”]=$HH_percent
combination[“TT”]=$TT_percent
combination[“HT”]=$HT_percent
combination[“TH”]=$TH_percent
for key in ${!combination[@]}
do
echo “$key : ${combination[$key]} %”
done
