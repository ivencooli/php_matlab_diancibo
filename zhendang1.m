function zhendang1
clear
ex=importdata('txt/1.txt');                                 %清除变量
rm=ex;                                                           %最大距离
r=0.1:0.1:rm;                                               %生成距离向量
a=linspace(0,2*pi);                                      %生成角度向量
[R,A]=meshgrid(r,a);                                  %生成距离和角度矩阵
[X,Y]=pol2cart(A,R);                                %将极坐标化为直角坐标
E=cos(A).*cos(2*pi*R)./R;                       %计算电场强度
e=-3:0.3:3;                                                 %电场强度向量
figure                                                         %创建图形窗口
h=surf(X,Y,E);                                          %画电场曲面图
shading interp                                            %添加色彩
grid on                                                       %添加网格
box on                                                        %添加边框
axis([-rm,rm,-rm,rm])                               %设定坐标范围
t=0;                                                            %设定初始时刻
hold on                                                     %保持图像
colorbar                                                    %添加颜色条
for t=1:5:300                                        %动画循环
    E=cos(A).*cos(2*pi*(R-t/160))./R;   %电场强度
    set(h,'ZData',E)                                 %设置z坐标
    drawnow                                            %更新屏幕
     m(:,t)=getframe; 
      M=getframe(gcf);
nn=frame2im(M);
[nn,cm]=rgb2ind(nn,256);
if t==1
    imwrite(nn,cm,'img/zhendang1.gif','gif','LoopCount',inf,'DelayTime',0.1);% 说明loopcount只是在i==1的时候才有用
else
    %[nn,cm]=rgb2ind(nn,256);
    imwrite(nn,cm,'img/zhendang1.gif','gif','WriteMode','append','DelayTime',0.1)%当i>=2的时候loopcount不起作用
end
end                                                         %结束循环
