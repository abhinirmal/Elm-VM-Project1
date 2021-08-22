#!/bin/bash

cat $1_Dealer_schedule | awk -F"\t" '{print $1, $a}' a=$2 | grep "$3"


