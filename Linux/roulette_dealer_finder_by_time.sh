#!/bin/bash

cat $1_Dealer_schedule | grep "$2" | awk '{print $1, $2, $5, $6}'
echo " enter date for argument 1 and time for argument 2. for eg for march 10 and time 2 PM , enter 0310 and '02:00:00 PM'"
