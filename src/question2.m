clc;clear;
% [data]=xlsread('C:\Users\11738\Desktop\2021年（第二十二届）杭州电子科技大学数学建模竞赛题\q2.xlsx','Sheet1');
% x=data(1,:);
% %单次增长
syms t vo
vo=1800;  %初始体积
a=[vo];
b=[0];
for i=1:15
    f=inline('M/(1+(M-vo)/vo*exp(-0.15*t))','M','vo','t');
    M=2400;   %最大体积
    logi=f(M,vo,0.004)-vo;  %逻辑斯蒂在0.04秒的增长

    g=inline('vo*exp(-(4167/200*D+2*8279/4000*D*D)*0.004)','vo','D');
    D=2.5;   %放射剂量
    LQ=g(vo,D)-vo;  %LQ模型在放疗时的减少
    vo=vo+(LQ+logi) %两部分求和
    a=[a,vo];
    b=[b,i-1+0.004];
    vo=vo-6*10^(-5)*vo^2+0.0802*vo+0.1885
    a=[a,vo];
    b=[b,i];
end
plot(b,a,'-o')
img =gcf;  %获取当前画图的句柄
print(img, '-dpng', '-r600', './img.png')%导出600dpi图像
% text(0.00,1400,'(0.0,1400)')
% text(15.04,24.71,'(15.04,24.71)')

