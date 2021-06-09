function c = min_v(D)
global delta;
% %单次增长
syms t vo
vo=1400;  %初始体积
a=[vo];
epoch=35;%治疗周期
for i=1:epoch
        f=inline('M/(1+(M-vo)/vo*exp(-0.15*t))','M','vo','t');
        M=2400;   %最大体积
        r=6.25*10^(-5);
        logi=f(M,vo,0.004)-vo;  %逻辑斯蒂在0.004天的增长
        syms d
        g=inline('vo*exp(-(4167/200*d+2*8279/4000*d*d)*0.004)','vo','d');
        d=D(i);   %放射剂量
        LQ=g(vo,d)-vo;  %LQ模型在放疗时的减少
        vo=vo+(LQ+logi);  %两部分求和
        
        vo=vo-6*10^(-5)*vo^2+0.0802*vo+0.1885;
        a=[a,vo];
end

%startup1 = 0.80;
%endp1 = 1.1;
%alpha = startp1 + (endp1-startp1) * rand();
%alpha = startup1+delta;
%startup2 = 8;
%endp2 = 11;
%beta = startp2 + (endp2-startp2) * rand();
%beta = startup2+delta;
%startup3 = 4.5;
%endp3 = 5.5;
%gamma = startp3 + (endp3-startp3) * rand();
%gamma = startup3+delta;

startup3 = 13.5;
%endp3 = 16;
%theta = startp3 + (endp3-startp3) * rand();
theta = startup3+delta;
%startp3 = 0.9;
%endp3 = 1.1;
%kesi = startp3 + (endp3-startp3) * rand();

c=theta*a(epoch+1)+1*mean(a); %第三题 返回均值和最后一个值（加权)
%c= 1*mean(a)+ 10*a(epoch+1) +1*sum(D);%第四题 

end