# sys
# os
# subprocess
# math
# random
# datetime
# json

print ("hello ShreeJ")

import sys

print (sys.version)
print (sys.argv)


import os

print(os.getcwd())

if os.path.exists("Test"):
	os.rmdir("Test")
#os.remove("path")  delete a file

#needs double \\ while giving path completly in windows
#os.chdir("/home/shree/cprojects/JnaneshGit/Manipal_codeRepo/Python")

os.mkdir("Test")
os.chdir("Test")
#os.path.split("pathname")  //this will give output with path and file name
#os.path.join("path1","path2")  //this  join the path using system paths

import math

print(math.pi)
print(math.e)
print(math.degrees(0.1)) #rad to degree
print(math.acos(0.5))
print(math.exp(2))
x=8
base =2
print(math.log(x,base))

import random

print (random.randrange(50))
print (random.randrange(10,50,10)) #from 10 -> 50 with stepsize of 10
print (random.randint(10,22))

import datetime
print (datetime.date.today())
now = datetime.datetime.today()
other = datetime.datetime(1996,12,12,12,12)
print (now-other)

import json
