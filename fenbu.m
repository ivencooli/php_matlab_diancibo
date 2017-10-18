clear;clf;
%%%%%%%%%%%%���ó�ʼֵ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ex=importdata('1.txt');
r=1;                             %����Բ�ε���Բ���İ뾶
u0=4*pi*(10)^(-7);                %���ôŵ���
I=3*(10)^(-6);                     %���õ���ֵ
%%%%%%%%%%%���ȴ���ͼ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[X,Z]=meshgrid([-2:0.1:2]);          %��������
R=sqrt(X.^2+Z.^2);                     %��ռ�����㵽ԭ��ľ���
sin=Z./R;                                %R��Z��нǵ�����
Um=u0*I*(pi*r^2)*sin./(4*pi*R.^2);  %��ռ������Ĵ���
contour(X,Z,Um,300,'b');              %����άXZ��ȴ���ͼ
axis([-1.5,1.5,-2,2]);                 %���¶���������
xlabel('x');
ylabel('z');
title('XZ��ȴ���ͼ');
hold on;
plot(0,-0.15,'ro',0,-0.15,'r-');      %���ź�λ��
hold on;                  
plot(0,0.15,'ro',0,0.15,'r+');         %���ź�λ��
hold on;
grid minor;                                %��ϸ����
figure
surf(X,Z,Um);                              %����ά��λ��ͼ
xlabel('x');
ylabel('y');
zlabel('z');
title('��ż���Ӵ�λ��ͼ');
figure
contour3(X,Z,Um,300);                    %��ά�ȴ�����ͼ
xlabel('x');
ylabel('y');
zlabel('z');
title('��ά�ȴ�����ͼ');
%%%%%%%%%%%%%��ǿ�ֲ�ͼ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Hx,Hz]=gradient(-Um);                    %��ռ������Ĵų�ǿ��
m=linspace(0,2*pi,100);
n=linspace(-pi/2,pi/2,50);
[theta,phi]=meshgrid(m,n);
r=cos(phi).*cos(phi);   
[x,y,z]=sph2cart(theta,phi,r);       %��������ϵ�µĳ�ǿת��Ϊ�ѿ�������ϵ��
figure
mesh(x,y,z)
xlabel('x');
ylabel('y');
zlabel('z');
title('��ż���ӿռ䳡�ֲ�ͼ');
hidden off;                               %͸�ӹ���
figure
AH=sqrt(Hx.^2+Hz.^2);
Hx=Hx./AH;
Hz=Hz./AH;                                %��ǿ��һ��
quiver(X,Z,Hx,Hz,0.5);                  %����ά�ų��ֲ�ͼ
hold on;
plot(0,-0.15,'ro',0,-0.15,'r-');       %���ź�λ��
hold on;           
plot(0,0.15,'ro',0,0.15,'r+');          %���ź�λ��
hold on;       
axis([-1.2,1.2,-1.2,1.2]);               %���¶���������
xlabel('x');
ylabel('y');
title('��ά�ų��ֲ�ͼ');
%%%%%%%%%%%%%%%%%����ά��ǿ�ֲ�ͼ%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
contour(X,Z,Um,300,'k-');                  %����ά�ȴ���ͼ   
xlabel('x');
ylabel('z');
hold on;
AH=sqrt(Hx.^2+Hz.^2);
Hx=Hx./AH;
Hz=Hz./AH;                                  %��ǿ��һ��
quiver(X,Z,Hx,Hz,0.5);                    % ����ά��ǿ�ֲ�ͼ
hold on;
plot(0,-0.15,'ro',0,-0.15,'r-');        % ���ź�λ��
hold on;  
plot(0,0.15,'ro',0,0.15,'r+');           %���ź�λ��             
hold on;        
axis([-1.5,1.5,-2,2]);                     %���¶���������       
xlabel('x');
ylabel('y');
title('��ż���Ӷ�ά���ֲ�ͼ');
