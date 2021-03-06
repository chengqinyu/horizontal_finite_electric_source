%% 考察 不同电阻率均匀大地的响应变化
%--------------------------------------------------------------------------
%仿真条件：地面TEM 半航空TEM
% 地面水平接地长导线源激励，地面或空中观测 B场
%--------------------------------------------------------------------------
%%
format long;
clear all;clc;close all;
%--------------------------------------------------------------------------
%仿真条件：地面TEM 半航空TEM
% 地面水平接地长导线源激励，地面或空中观测 B场
% 1. 均匀半空间电阻率设定100欧姆米,先观测不同高度响应的变化，主要是观察Hz,Hx,Hy,高度设定0,30,60,90米
% 2. 改变长导线源中垂线方向偏移距的长度（y=100,500,1000,2000），观察不同偏移距下，响应随高度的变化
%--------------------------------------------------------------------------
%%
format long;
clear all;clc;close all;
%%
u0 = 4*pi*1e-7;
load parameters.txt;
sigma1 = parameters(1,2);%第一层的电导率
rou = 1./sigma1;
%% 发射机参数地面
x = 0; % 收发水平偏移距，沿y轴
y = [100,200,400,800,1600];
% y = 1000;
L= 1; % 发射线缆长度，沿x轴
I = 1; % 发射电流
%%  半航空收发高度参数
z =0;% 观测点距地面的高度，地面以上为负值
%  z =[-90,-150];
h =0;% 源距地面的高度

%% 采样率和观测时间段设置
fs = 1e5;% 采样率
dt = 1./fs;
t = logspace(-4,1,100);% 时间区间
%%
for k = 1:length(y)
    %% 解析解
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








