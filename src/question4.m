clear;
clc;
global delta;
delta = 0;

load('d1.mat','d1');
lb ((1:21),1) = 2.5;ub ((1:21),1) = 6.5;
%% ËÑË÷
for loop=1:10
[d,fval] = fmincon(@min_v,d1,[],[],[],[],lb,ub,@nonlfun4);
%delta = delta+0.3;
%% Í¼ÏñÕ¹Ê¾
show_pic(d,21);
end
