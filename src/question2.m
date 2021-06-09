clc;clear;
% [data]=xlsread('C:\Users\11738\Desktop\2021�꣨�ڶ�ʮ���죩���ݵ��ӿƼ���ѧ��ѧ��ģ������\q2.xlsx','Sheet1');
% x=data(1,:);
% %��������
syms t vo
vo=1800;  %��ʼ���
a=[vo];
b=[0];
for i=1:15
    f=inline('M/(1+(M-vo)/vo*exp(-0.15*t))','M','vo','t');
    M=2400;   %������
    logi=f(M,vo,0.004)-vo;  %�߼�˹����0.04�������

    g=inline('vo*exp(-(4167/200*D+2*8279/4000*D*D)*0.004)','vo','D');
    D=2.5;   %�������
    LQ=g(vo,D)-vo;  %LQģ���ڷ���ʱ�ļ���
    vo=vo+(LQ+logi) %���������
    a=[a,vo];
    b=[b,i-1+0.004];
    vo=vo-6*10^(-5)*vo^2+0.0802*vo+0.1885
    a=[a,vo];
    b=[b,i];
end
plot(b,a,'-o')
img =gcf;  %��ȡ��ǰ��ͼ�ľ��
print(img, '-dpng', '-r600', './img.png')%����600dpiͼ��
% text(0.00,1400,'(0.0,1400)')
% text(15.04,24.71,'(15.04,24.71)')

