function zhendang1
clear
ex=importdata('txt/1.txt');                                 %�������
rm=ex;                                                           %������
r=0.1:0.1:rm;                                               %���ɾ�������
a=linspace(0,2*pi);                                      %���ɽǶ�����
[R,A]=meshgrid(r,a);                                  %���ɾ���ͽǶȾ���
[X,Y]=pol2cart(A,R);                                %�������껯Ϊֱ������
E=cos(A).*cos(2*pi*R)./R;                       %����糡ǿ��
e=-3:0.3:3;                                                 %�糡ǿ������
figure                                                         %����ͼ�δ���
h=surf(X,Y,E);                                          %���糡����ͼ
shading interp                                            %���ɫ��
grid on                                                       %�������
box on                                                        %��ӱ߿�
axis([-rm,rm,-rm,rm])                               %�趨���귶Χ
t=0;                                                            %�趨��ʼʱ��
hold on                                                     %����ͼ��
colorbar                                                    %�����ɫ��
for t=1:5:300                                        %����ѭ��
    E=cos(A).*cos(2*pi*(R-t/160))./R;   %�糡ǿ��
    set(h,'ZData',E)                                 %����z����
    drawnow                                            %������Ļ
     m(:,t)=getframe; 
      M=getframe(gcf);
nn=frame2im(M);
[nn,cm]=rgb2ind(nn,256);
if t==1
    imwrite(nn,cm,'img/zhendang1.gif','gif','LoopCount',inf,'DelayTime',0.1);% ˵��loopcountֻ����i==1��ʱ�������
else
    %[nn,cm]=rgb2ind(nn,256);
    imwrite(nn,cm,'img/zhendang1.gif','gif','WriteMode','append','DelayTime',0.1)%��i>=2��ʱ��loopcount��������
end
end                                                         %����ѭ��
