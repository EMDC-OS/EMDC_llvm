#!/bin/bash

BIN=cudaMalloc.exe
num_proc=$1
shift_bit=$2

echo $BIN $num_proc $shift_bit
rm append.txt


# init parent process
./$BIN $num_proc $shift_bit &

# run child processes
for i in {0..$num_proc};
do
	nsys nvprof ./$BIN $num_proc $shift_bit > $i.txt &
done

cat *.txt >> append.txt

