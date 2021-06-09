%% 非线性规划的函数
% [x,fval] = fmincon(@fun,x0,A,b,Aeq,beq,lb,ub,@nonlfun,option)
% x0表示给定的初始值（用行向量或者列向量表示），必须得写
% A b表示线性不等式约束
% Aeq beq 表示线性等式约束
% lb ub 表示上下界约束
% @fun表示目标函数
% @nonlfun表示非线性约束的函数
% option 表示求解非线性规划使用的方法
clear;
clc;

%% 蒙特卡罗模拟
n=100000; %生成的随机数组数
d_mengte = []
for a =1:35
x=unifrnd(0,2.5,n,1);  % 生成在[,2.5]之间均匀分布的随机数组成的n行1列的向量构成x1
d_mengte = [d_mengte x]%矩阵拼接
end
%d_mengte = d_mengte(1,:);
fmin=+inf; % 初始化函数f的最小值为正无穷
%d_inter = d_mengte(1,:)
%total = sum(d_inter)
for i=1:n
    d_inter = d_mengte(i,:);  
    if ((d_inter(1)*d_inter(35)>0)&&(45<sum(d_inter)<55)) % 判断是否满足约束条件
        result = min_v(d_inter); % 如果满足条件就计算函数值
        if  result  < fmin  
            fmin = result;  
            d0 = d_inter;  % 更新
        end
    end
end
%% 搜索
clear;
clc;

global delta;
delta = 0;

load('d2.mat','d2');
Aeq=ones(1,35); beq = 50;
lb = zeros(1,35); ub ((1:35),1) = 2.5;
for loop=1:10
[d,fval] = fmincon(@min_v,d2,[],[],Aeq,beq,lb,ub,@nonlfun3);
%show_pic(d2,35);
delta = delta+0.3;
show_pic(d,35);
end