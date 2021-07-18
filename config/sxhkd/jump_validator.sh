#!/bin/bash

if [ $1 -eq $2 ]
then
    bspc desktop -f last
else
    bspc desktop -f $2
fi
