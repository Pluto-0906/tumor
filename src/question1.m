clear
clc

[data]=xlsread('.\a.xlsx') ;
x=data(:,1);
y=data(:,2);

%逻辑斯蒂曲线
logistic = inline('beta(1)./(1+beta(2).*exp(-beta(3).*x))','beta','x');
beta0 = [0.2,0.2,0.2]';
beta = nlinfit(x,y,logistic,beta0);
%拟合值
y_logistic = beta(1)./(1+beta(2).*exp(-beta(3).*x));
%画图
plot(x,y_logistic,'g-','linewidth',2);
hold on;
plot(x,y,'b.','markersize',10);
xlabel('时间 / 天');
ylabel('肿瘤大小 / mm^3');

%R方分析
[r,c]=size(y);
y_aver = sum(y)/r;
SS_tot=sum((y-y_aver).^2);
SS_res=sum((y-y_logistic).^2);
format long;
R_2=1-SS_res/SS_tot;



