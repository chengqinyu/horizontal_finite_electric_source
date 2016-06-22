%% ���� ��ͬ�����ʾ��ȴ�ص���Ӧ�仯
%--------------------------------------------------------------------------
%��������������TEM �뺽��TEM
% ����ˮƽ�ӵس�����Դ�������������й۲� B��
%--------------------------------------------------------------------------
%%
format long;
clear all;clc;close all;
%--------------------------------------------------------------------------
%��������������TEM �뺽��TEM
% ����ˮƽ�ӵس�����Դ�������������й۲� B��
% 1. ���Ȱ�ռ�������趨100ŷķ��,�ȹ۲ⲻͬ�߶���Ӧ�ı仯����Ҫ�ǹ۲�Hz,Hx,Hy,�߶��趨0,30,60,90��
% 2. �ı䳤����Դ�д��߷���ƫ�ƾ�ĳ��ȣ�y=100,500,1000,2000�����۲첻ͬƫ�ƾ��£���Ӧ��߶ȵı仯
%--------------------------------------------------------------------------
%%
format long;
clear all;clc;close all;
%%
u0 = 4*pi*1e-7;
load parameters.txt;
sigma1 = parameters(1,2);%��һ��ĵ絼��
rou = 1./sigma1;
%% �������������
x = 0; % �շ�ˮƽƫ�ƾ࣬��y��
y = [100,200,400,800,1600];
% y = 1000;
L= 1; % �������³��ȣ���x��
I = 1; % �������
%%  �뺽���շ��߶Ȳ���
z =0;% �۲������ĸ߶ȣ���������Ϊ��ֵ
%  z =[-90,-150];
h =0;% Դ�����ĸ߶�

%% �����ʺ͹۲�ʱ�������
fs = 1e5;% ������
dt = 1./fs;
t = logspace(-4,1,100);% ʱ������
%%
for k = 1:length(y)
    %% ������
    [ hz_impulse_jiexijie] = ground_finite_wire_source_jiexi(u0,rou,I,L,y(k),t);
    % save data
%     save(['ground_finite_wire_source_jiexi_y' num2str(y(k)) '.mat'],'hz_impulse_jiexijie');
    for kk = 1:length(z)
        [hz_01,hz_10,hz_impulse,hx_01,hx_10,hx_impulse,hy_01,hy_10,hy_impulse,ex_01,ex_impulse,ey_01,ey_impulse] =...
            Calculate_Horizontal_Finite_Electrical_Source(I,L,h,x,y(k),z(kk),t);
        save(['SemiAtem_Horizontal_Finite_Electrical_Source_separation_varying_L' num2str(L) '_h' num2str(h) '_z' num2str(z(kk)) '_x' num2str(x) '_y' num2str(y(k)) '.mat'],...
        'hz_01','hz_10','hz_impulse','hx_01','hx_10','hx_impulse','hy_01','hy_10','hy_impulse','ex_01','ex_impulse','ey_01','ey_impulse');
%          [hz_01,hz_10,hz_impulse,hx_01,hx_10,hx_impulse,hy_01,hy_10,hy_impulse,ex_01,ex_impulse,ey_01,ey_impulse] =...
%                 Calculate_Horizontal_Electrical_Dipole(I,L,h,x,y(k),z(kk),t);
%              save(['SemiAtem_Horizontal_Electrical_Dipole_separation_varying_L' num2str(L) '_h' num2str(h) '_z' num2str(z(kk)) '_x' num2str(x) '_y' num2str(y(k)) '.mat'],...
%         'hz_01','hz_10','hz_impulse','hx_01','hx_10','hx_impulse','hy_01','hy_10','hy_impulse','ex_01','ex_impulse','ey_01','ey_impulse');
    end
end








