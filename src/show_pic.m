function f = show_pic(d,n)
%单次增长
syms t vo
vo=1400;  %初始体积
a=[vo];
b=[0];
for i=1:n
    f=inline('M/(1+(M-vo)/vo*exp(-0.15*t))','M','vo','t');
    M=2400;   %最大体积
    logi=f(M,vo,0.004)-vo;  %逻辑斯蒂在0.04秒的增长
    syms D
    g=inline('vo*exp(-(4167/200*D+2*8279/4000*D*D)*0.004)','vo','D');
    D=d(i);   %放射剂量
    LQ=g(vo,D)-vo;  %LQ模型在放疗时的减少
    vo=vo+(LQ+logi) %两部分求和
    a=[a,vo];
    b=[b,i-1+0.004];
    vo=vo-6*10^(-5)*vo^2+0.0802*vo+0.1885
    a=[a,vo];
    b=[b,i];
end
plot(b,a,'-o','linewidth',1.5,'markersize',3);
hold on;
%text(21,1.64,'(21,1.64)');
xlim([0,21]);
set(gca,'XTick',[0:3:21]);
ylim([0,1400]);
xlabel('放疗日期/天');
ylabel('肿瘤体积/mm^3');
end