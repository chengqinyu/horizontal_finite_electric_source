%--------------------------------------------------------------------------
%��������������TEM �뺽��TEM
% ����ˮƽ�ӵس�����Դ�������������й۲� B��

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
x = 100; % �շ�ˮƽƫ�ƾ࣬��y��
y = 100;
L= 1; % �������³��ȣ���x��
I = 1; % �������
%%  �뺽���շ��߶Ȳ���
z =0;% �۲������ĸ߶ȣ���������Ϊ��ֵ
h =0;% Դ�����ĸ߶�

%% �����ʺ͹۲�ʱ�������
fs = 1e5;% ������
dt = 1./fs;
t = 1/fs:1/fs:4e-2;% ʱ������
%%

[hz_01,hz_10,hz_1_impulse,hx_01,hx_10,hx_1_impulse,hy_01,hy_10,hy_1_impulse,ex_01,ex_impulse,ey_01,ey_impulse] = Calculate_Horizontal_Finite_Electrical_Source(I,L,h,x,y,z,t);
% save('horizontal_electrical_dipole_impulse_shuzhijie','hx_1_impulse','hy_1_impulse','hz_1_impulse');
%% Ex-Ey 
%
% Ex -Ey step response
figure;
loglog(t,abs(ex_01) ,'r','linewidth',2);
hold on;
loglog(t,abs(ey_01) ,'b','linewidth',2);
hold on;
grid on;
legend('��ֵ��ex\_1\_step','��ֵ��ey\_1\_step');
title(['source moment' num2str(I) 'm*' num2str(L) 'm position ('  num2str(x) ',' num2str(y) ',' num2str(z) ')wire loop  step response'])
xlabel('Time/(ms)')
ylabel('E/(V/m)');
% Ex -Ey impulse response
figure;
loglog(t,abs(ex_impulse) ,'r','linewidth',2);
hold on;
loglog(t,abs(ey_impulse) ,'b','linewidth',2);
hold on;
grid on;
legend('��ֵ��ex\_impulse','��ֵ��ey\_impulse');
title(['source moment' num2str(I) 'm*' num2str(L) 'm position ('  num2str(x) ',' num2str(y) ',' num2str(z) ')wire loop  impulse response'])
xlabel('Time/(ms)')
ylabel('E/(V/m)');
%
%%
% hx-hy-hz impulse response
figure;
loglog(t(1:end).*10^3,u0.*abs(hz_1_impulse),'r','Linewidth',2);
hold on
loglog(t(1:end-1).*10^3,u0.*abs(diff(hz_01)./dt),'b','Linewidth',2);
grid on;
legend('��ֵ��hz\_1\_impulse','��ֵ��diff(hz\_01)./dt');
title(['source moment' num2str(I) 'm*' num2str(L) 'm position ('  num2str(x) ',' num2str(y) ',' num2str(z) ')wire loop Bz impulse response'])
xlabel('Time/(ms)')
ylabel('Bz/(T)');

figure;
loglog(t(1:end).*10^3,u0.*abs(hx_1_impulse),'r','Linewidth',2);
hold on
loglog(t(1:end-1).*10^3,u0.*abs(diff(hx_01)./dt),'b','Linewidth',2);
grid on;
legend('��ֵ��hx\_1\_impulse','��ֵ��diff(hx\_01)./dt');
title(['source moment' num2str(I) 'm*' num2str(L) 'm position ('  num2str(x) ',' num2str(y) ',' num2str(z) ')wire loop Bx impulse response'])
xlabel('Time/(ms)')
ylabel('Bx/(T)');

figure;
loglog(t(1:end).*10^3,u0.*abs(hy_1_impulse),'r','Linewidth',2);
hold on
loglog(t(1:end-1).*10^3,u0.*abs(diff(hy_01)./dt),'b','Linewidth',2);
grid on;
legend('��ֵ��hy\_1\_impulse','��ֵ��diff(hy\_01)./dt');
title(['source moment' num2str(I) 'm*' num2str(L) 'm position ('  num2str(x) ',' num2str(y) ',' num2str(z) ')wire loop By impulse response'])
xlabel('Time/(ms)')
ylabel('By/(T)');
%%
% hx-hy-hz step response
figure;
loglog(t(1:end).*10^3,u0.*abs(hz_01),'r','Linewidth',2);
hold on
loglog(t(1:end).*10^3,u0.*abs(hz_10),'b','Linewidth',2);
grid on;
legend('��ֵ��hz\_01','��ֵ��hz\_10');
title(['source moment' num2str(I) 'm*' num2str(L) 'm position ('  num2str(x) ',' num2str(y) ',' num2str(z) ')wire loop Bz step response'])
xlabel('Time/(ms)')
ylabel('Bz/(T)');

figure;
loglog(t(1:end).*10^3,u0.*abs(hx_01),'r','Linewidth',2);
hold on
loglog(t(1:end).*10^3,u0.*abs(hx_10),'b','Linewidth',2);
grid on;
legend('��ֵ��hx\_01','��ֵ��hx\_10');
title(['source moment' num2str(I) 'm*' num2str(L) 'm position ('  num2str(x) ',' num2str(y) ',' num2str(z) ')wire loop Bx step response'])
xlabel('Time/(ms)')
ylabel('Bx/(T)');

figure;
loglog(t(1:end).*10^3,u0.*abs(hy_01),'r','Linewidth',2);
hold on
loglog(t(1:end).*10^3,u0.*abs(hy_10),'b','Linewidth',2);
grid on;
legend('��ֵ��hy\_01','��ֵ��hy\_10');
title(['source moment' num2str(I) 'm*' num2str(L) 'm position ('  num2str(x) ',' num2str(y) ',' num2str(z) ')wire loop By step response'])
xlabel('Time/(ms)')
ylabel('By/(T)');
%% save data

