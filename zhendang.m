function zhendang
ex=importdata('txt/1.txt');
rm = ex;
%rm=   input('请输入一个字符串：');                                            设置最大距离
r=0:0.02:rm;                                                         %电场的距离向量
a=linspace(0,2*pi,300);                                       %电场的角度向量
[R,A]=meshgrid(r,a);                                           %生成距离和角度矩阵
[X,Y]=pol2cart(A,R);                                          %将极坐标化为直角坐标
e=-2.5:0.25:2.5;                                                   %电场强度向量
mr=0.5:0.1:rm;                                                    %磁场的距离向量
b=(0:15:350)*pi/180;                                          %磁场的角度向量
[MR,B]=meshgrid(mr,b);                                    %生成距离和角度矩阵
[XH,YH]=pol2cart(B,MR);                                %将极坐标化为直角坐标
figure                                                                  %创建图形窗口
m=moviein(200);                                                 %创建动画的数据矩阵
for t=1:1:10                                                         %动画循环
    E=cos(A).*cos(2*pi*(t/50-R))./R;                  %计算电场强度
    contour(X,Y,E,e,'m','LineWidth',2)                %画电场线
    M=cos(B).*cos(2*pi*(t/50-MR))./MR;          %计算磁场强度
    L=M>0;                                                           %取磁场强度大于零的逻辑值,
    hold on                                                       %保持属性
    plot(XH(L),YH(L),'x','MarkerSize',10)     %设正方向的磁场强度为叉
    plot(XH(~L),YH(~L),'.','MarkerSize',10)  %设负方向的磁场强度为点
    grid on                                                        %设置网格
    axis equal                                                    %使坐标间隔相等
    hold off                                                      %关闭属性保持
    m(:,t)=getframe;                                        %将当前图形窗口作为画面保存，整理为列向量
  M=getframe(gcf);
nn=frame2im(M);
[nn,cm]=rgb2ind(nn,256);
if t==1
    imwrite(nn,cm,'img/zhendang.gif','gif','LoopCount',inf,'DelayTime',0.1);% 说明loopcount只是在i==1的时候才有用
else
    %[nn,cm]=rgb2ind(nn,256);
    imwrite(nn,cm,'img/zhendang.gif','gif','WriteMode','append','DelayTime',0.1)%当i>=2的时候loopcount不起作用
end
sprintf('....')
end