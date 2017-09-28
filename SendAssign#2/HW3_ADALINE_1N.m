clear all
close all
clc
%Linear network
points = [0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1;
          1 1 1 1 0 0 0 1 1 1 1 1 1 0 0 0 1 1 1 1;
          1 1 1 1 0 0 0 1 1 1 1 1 0 0 0 1 1 1 1 1;
          1 0 0 1 1 0 0 1 1 1 1 1 0 0 0 1 0 0 0 1;
          1 1 1 1 1 0 0 0 1 1 1 1 0 0 0 1 1 1 1 1;
          1 1 1 1 1 0 0 0 1 1 1 1 1 0 0 1 1 1 1 1;
          1 1 1 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1;
          1 1 1 1 1 0 0 1 1 1 1 1 1 0 0 1 1 1 1 1;
          1 1 1 1 1 0 0 1 1 1 1 1 0 0 0 1 0 0 0 1;
          1 1 1 1 1 0 0 1 1 0 0 1 1 0 0 1 1 1 1 1];

t=[1;2;3;4;5;6;7;8;9;0];

p=points'
t=t';
net = newlin(minmax(p),1);
%train
net.trainParam.epochs=20000;
net.trainParam.goal=1e-6;
net = train(net,p,t);
a=sim(net,p)