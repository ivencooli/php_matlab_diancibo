function zhendang
ex=importdata('txt/1.txt');
rm = ex;
%rm=   input('������һ���ַ�����');                                            ����������
r=0:0.02:rm;                                                         %�糡�ľ�������
a=linspace(0,2*pi,300);                                       %�糡�ĽǶ�����
[R,A]=meshgrid(r,a);                                           %���ɾ���ͽǶȾ���
[X,Y]=pol2cart(A,R);                                          %�������껯Ϊֱ������
e=-2.5:0.25:2.5;                                                   %�糡ǿ������
mr=0.5:0.1:rm;                                                    %�ų��ľ�������
b=(0:15:350)*pi/180;                                          %�ų��ĽǶ�����
[MR,B]=meshgrid(mr,b);                                    %���ɾ���ͽǶȾ���
[XH,YH]=pol2cart(B,MR);                                %�������껯Ϊֱ������
figure                                                                  %����ͼ�δ���
m=moviein(200);                                                 %�������������ݾ���
for t=1:1:10                                                         %����ѭ��
    E=cos(A).*cos(2*pi*(t/50-R))./R;                  %����糡ǿ��
    contour(X,Y,E,e,'m','LineWidth',2)                %���糡��
    M=cos(B).*cos(2*pi*(t/50-MR))./MR;          %����ų�ǿ��
    L=M>0;                                                           %ȡ�ų�ǿ�ȴ�������߼�ֵ,
    hold on                                                       %��������
    plot(XH(L),YH(L),'x','MarkerSize',10)     %��������Ĵų�ǿ��Ϊ��
    plot(XH(~L),YH(~L),'.','MarkerSize',10)  %�踺����Ĵų�ǿ��Ϊ��
    grid on                                                        %��������
    axis equal                                                    %ʹ���������
    hold off                                                      %�ر����Ա���
    m(:,t)=getframe;                                        %����ǰͼ�δ�����Ϊ���汣�棬����Ϊ������
  M=getframe(gcf);
nn=frame2im(M);
[nn,cm]=rgb2ind(nn,256);
if t==1
    imwrite(nn,cm,'img/zhendang.gif','gif','LoopCount',inf,'DelayTime',0.1);% ˵��loopcountֻ����i==1��ʱ�������
else
    %[nn,cm]=rgb2ind(nn,256);
    imwrite(nn,cm,'img/zhendang.gif','gif','WriteMode','append','DelayTime',0.1)%��i>=2��ʱ��loopcount��������
end
sprintf('....')
end