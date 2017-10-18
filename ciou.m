function ciou
clear,clc;
ciou1 = load('txt/ciou1.txt');
%ciou2 = load('txt/ciou2.txt');
f=10e+6;                                  %�趨Ƶ��f=10MHz
lam=(3e+8)/f;                                      %��Ⲩ��   
I=ciou1;                                        %�趨����Ϊ25A
l=ciou2;                                     %�趨����lΪ0.5m    
r=10e+3;                                  %�趨��ԭ��ľ���
k=2*pi/lam;                              %����������ʽ 
a=120*pi;                                          %�ռ��迹
theta1=-pi:0.05:0;
theta2=0:0.05:pi;
theta0=-pi:0.05:pi;
E1=j*I*l*a.*sin(theta1)*exp(-j*k*r)/(2*lam*r);
E1=E1/max(E1);
E2=j*I*l*a.*sin(theta1)*exp(-j*k*r)/(2*lam*r);
E2=E2/max(E2);                              % 
E0=[E1,E2];
E0=E0/max(max(E0));                         %��E���й�һ��
figure(1)
polar(theta0,E0)                         %��ż���ӵ�E�淽��ͼ
title('\fontname{����}\fontsize{11} ��ż����Eƽ�淽��ͼ ')                                        
phi=linspace(0,2*pi);
E=j*I*l*a.*sin(pi/2)*exp(-j*k*r)/(2*lam*r);
H=ones(1,length(phi)).*E;
H=H/max(H);                                 %��H���й�һ��
figure(2)
polar(phi,H,'-r');                         %��ż���ӵ�H�淽��ͼ
title('\fontname{����}\fontsize{11}��ż����Hƽ�淽��ͼ')
theta=linspace(0,pi);
theta=meshgrid(theta);
phi=meshgrid(phi)';
P=abs(sin(theta));                 %��ż���ӵĹ�һ�������Ժ���
P=P./max(max(P));
[x,y,z]=sph2cart(phi,pi/2-theta,P);        %��������ת��Ϊֱ������
figure(3)                          %��ʾ��ż���ӵ����巽��ͼ
mesh(x,y,z);
axis ([-1 1 -1 1 -1 1]);
title('\fontname{����}\fontsize{11}��ż���ӷ���ͼ ')
figure(4)             
li=find(y<0);
z(li)=nan                                %��ʾ����ͼ������ͼ
mesh(x,y,z);
axis([-1 1 -1 1 -1 1]);
title('\fontname{����}\fontsize{11} ��ż�������淽��ͼ ')

saveas(1,'img/ciou1.jpg');
saveas(2,'img/ciou2.jpg');
saveas(3,'img/ciou3.jpg');
saveas(4,'img/ciou4.jpg');
