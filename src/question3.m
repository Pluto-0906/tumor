%% �����Թ滮�ĺ���
% [x,fval] = fmincon(@fun,x0,A,b,Aeq,beq,lb,ub,@nonlfun,option)
% x0��ʾ�����ĳ�ʼֵ����������������������ʾ���������д
% A b��ʾ���Բ���ʽԼ��
% Aeq beq ��ʾ���Ե�ʽԼ��
% lb ub ��ʾ���½�Լ��
% @fun��ʾĿ�꺯��
% @nonlfun��ʾ������Լ���ĺ���
% option ��ʾ�������Թ滮ʹ�õķ���
clear;
clc;

%% ���ؿ���ģ��
n=100000; %���ɵ����������
d_mengte = []
for a =1:35
x=unifrnd(0,2.5,n,1);  % ������[,2.5]֮����ȷֲ����������ɵ�n��1�е���������x1
d_mengte = [d_mengte x]%����ƴ��
end
%d_mengte = d_mengte(1,:);
fmin=+inf; % ��ʼ������f����СֵΪ������
%d_inter = d_mengte(1,:)
%total = sum(d_inter)
for i=1:n
    d_inter = d_mengte(i,:);  
    if ((d_inter(1)*d_inter(35)>0)&&(45<sum(d_inter)<55)) % �ж��Ƿ�����Լ������
        result = min_v(d_inter); % ������������ͼ��㺯��ֵ
        if  result  < fmin  
            fmin = result;  
            d0 = d_inter;  % ����
        end
    end
end
%% ����
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