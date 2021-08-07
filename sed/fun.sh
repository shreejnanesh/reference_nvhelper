#!/usr/bin/bash

LOWER='abcdefghijklmnopqrstuvwxyz'
UPPER='ABCDEFGHIJKLMNOPQRSTUVWXYZ'

#sed 'y/$LOWER/$UPPER/' random

sed "y/$LOWER/$UPPER/" random