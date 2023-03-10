# Using readlines()
import matplotlib.pyplot as plt
import numpy as np
import math

file1 = open('QuadData.txt', 'r')
file2 = open('Output.txt', 'r')
Lines = file1.readlines()
leasts = file2.readline()
a, b, c = leasts.strip().split()
a = float(a)
b = float(b)
c = float(c)

i = np.linspace(0,10,100)
  
count = 0
x = []
y = []
for line in Lines:
    row = line.strip().split()
    x.append(float(row[0]))
    y.append(float(row[1]))

plt.figure(figsize=(15,10))
plt.scatter(x, y)
plt.plot(i, (a*(i**2) + b*i + c), color='red')
plt.title('Data with Exponential Least Squares Fitted')
plt.xlabel('X')
plt.ylabel('Y')
plt.savefig('display')