function ciou
clear,clc;
ciou1 = load('txt/ciou1.txt');
%ciou2 = load('txt/ciou2.txt');
f=10e+6;                                  %设定频率f=10MHz
lam=(3e+8)/f;                                      %求解波长   
I=ciou1;                                        %设定电流为25A
l=ciou2;                                     %设定长度l为0.5m    
r=10e+3;                                  %设定离原点的距离
k=2*pi/lam;                              %传播常数公式 
a=120*pi;                                          %空间阻抗
theta1=-pi:0.05:0;
theta2=0:0.05:pi;
theta0=-pi:0.05:pi;
E1=j*I*l*a.*sin(theta1)*exp(-j*k*r)/(2*lam*r);
E1=E1/max(E1);
E2=j*I*l*a.*sin(theta1)*exp(-j*k*r)/(2*lam*r);
E2=E2/max(E2);                              % 
E0=[E1,E2];
E0=E0/max(max(E0));                         %对E进行归一化
figure(1)
polar(theta0,E0)                         %电偶极子的E面方向图
title('\fontname{宋体}\fontsize{11} 电偶极子E平面方向图 ')                                        
phi=linspace(0,2*pi);
E=j*I*l*a.*sin(pi/2)*exp(-j*k*r)/(2*lam*r);
H=ones(1,length(phi)).*E;
H=H/max(H);                                 %对H进行归一化
figure(2)
polar(phi,H,'-r');                         %电偶极子的H面方向图
title('\fontname{宋体}\fontsize{11}电偶极子H平面方向图')
theta=linspace(0,pi);
theta=meshgrid(theta);
phi=meshgrid(phi)';
P=abs(sin(theta));                 %电偶极子的归一化方向性函数
P=P./max(max(P));
[x,y,z]=sph2cart(phi,pi/2-theta,P);        %将球坐标转化为直角坐标
figure(3)                          %显示电偶极子的立体方向图
mesh(x,y,z);
axis ([-1 1 -1 1 -1 1]);
title('\fontname{宋体}\fontsize{11}电偶极子方向图 ')
figure(4)             
li=find(y<0);
z(li)=nan                                %显示方向图的剖面图
mesh(x,y,z);
axis([-1 1 -1 1 -1 1]);
title('\fontname{宋体}\fontsize{11} 电偶极子剖面方向图 ')

saveas(1,'img/ciou1.jpg');
saveas(2,'img/ciou2.jpg');
saveas(3,'img/ciou3.jpg');
saveas(4,'img/ciou4.jpg');
