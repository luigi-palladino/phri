
clear
clc

syms t b B Vm(t) Im(t) um(t) vm(t) us(t) vs(t) Is(t) Vs(t)

%% Case 1: Define the matrixes

A = [0 1/sqrt(2*b); sqrt(2*b)/(1+B) 0]
F = [(b*Vm(t))/sqrt(2*b); sqrt(2*b)/(1+B)*vm]
X = [um;Im]

%% Solve the system

X = inv(A)*F

%% Case 2: Define the matrixes
C = [0 -b*sqrt(2*b); (-B*sqrt(2*b))/(B*b+b) 0]
D = [(B*Is(t))/sqrt(2*b); (B*sqrt(2*b))/(B*b+b)*B*us]
Y = [vs; Vs(t)]

%% Solve the 2nd system

Y = inv(C)*D