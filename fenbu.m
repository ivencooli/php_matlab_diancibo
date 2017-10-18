clear;clf;
%%%%%%%%%%%%设置初始值%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ex=importdata('1.txt');
r=1;                             %设置圆形导电圆环的半径
u0=4*pi*(10)^(-7);                %设置磁导率
I=3*(10)^(-6);                     %设置电流值
%%%%%%%%%%%画等磁势图%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[X,Z]=meshgrid([-2:0.1:2]);          %定义网格
R=sqrt(X.^2+Z.^2);                     %求空间任意点到原点的距离
sin=Z./R;                                %R与Z轴夹角的余弦
Um=u0*I*(pi*r^2)*sin./(4*pi*R.^2);  %求空间任意点的磁势
contour(X,Z,Um,300,'b');              %画二维XZ面等磁势图
axis([-1.5,1.5,-2,2]);                 %重新定义坐标轴
xlabel('x');
ylabel('z');
title('XZ面等磁势图');
hold on;
plot(0,-0.15,'ro',0,-0.15,'r-');      %负磁荷位置
hold on;                  
plot(0,0.15,'ro',0,0.15,'r+');         %正磁荷位置
hold on;
grid minor;                                %画细网格
figure
surf(X,Z,Um);                              %画三维磁位面图
xlabel('x');
ylabel('y');
zlabel('z');
title('磁偶极子磁位面图');
figure
contour3(X,Z,Um,300);                    %三维等磁势线图
xlabel('x');
ylabel('y');
zlabel('z');
title('三维等磁势线图');
%%%%%%%%%%%%%场强分布图%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Hx,Hz]=gradient(-Um);                    %求空间任意点的磁场强度
m=linspace(0,2*pi,100);
n=linspace(-pi/2,pi/2,50);
[theta,phi]=meshgrid(m,n);
r=cos(phi).*cos(phi);   
[x,y,z]=sph2cart(theta,phi,r);       %将球坐标系下的场强转化为笛卡尔坐标系下
figure
mesh(x,y,z)
xlabel('x');
ylabel('y');
zlabel('z');
title('磁偶极子空间场分布图');
hidden off;                               %透视功能
figure
AH=sqrt(Hx.^2+Hz.^2);
Hx=Hx./AH;
Hz=Hz./AH;                                %场强归一化
quiver(X,Z,Hx,Hz,0.5);                  %画二维磁场分布图
hold on;
plot(0,-0.15,'ro',0,-0.15,'r-');       %负磁荷位置
hold on;           
plot(0,0.15,'ro',0,0.15,'r+');          %正磁荷位置
hold on;       
axis([-1.2,1.2,-1.2,1.2]);               %重新定义坐标轴
xlabel('x');
ylabel('y');
title('二维磁场分布图');
%%%%%%%%%%%%%%%%%画二维场强分布图%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
contour(X,Z,Um,300,'k-');                  %画二维等磁势图   
xlabel('x');
ylabel('z');
hold on;
AH=sqrt(Hx.^2+Hz.^2);
Hx=Hx./AH;
Hz=Hz./AH;                                  %场强归一化
quiver(X,Z,Hx,Hz,0.5);                    % 画二维场强分布图
hold on;
plot(0,-0.15,'ro',0,-0.15,'r-');        % 负磁荷位置
hold on;  
plot(0,0.15,'ro',0,0.15,'r+');           %正磁荷位置             
hold on;        
axis([-1.5,1.5,-2,2]);                     %重新定义坐标轴       
xlabel('x');
ylabel('y');
title('磁偶极子二维场分布图');
