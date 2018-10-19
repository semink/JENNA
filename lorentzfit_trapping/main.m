clc; close all;
addpath('lorentzfit');
data = load('3.mat');
x = data.wavelength;
y1 = data.before;
y2 = data.after;
normal_area = [1:455,614:length(x)];
[~,params1,~,~] = lorentzfit(x(normal_area),y1(normal_area)); 
[~,params2,~,~] = lorentzfit(x(normal_area),y2(normal_area)); 
y11 = recover(x,params1);
y22 = recover(x,params2);

figure,
hold on
plot(x,[y1,y2], 'LineWidth', 1)
plot(x,[y11,y22],'LineWidth',2)
box on;
grid on;
hold off;
legend('Before','After','Before (fitted)','After (fitted)')

[~,idx1] = findpeaks(y11);
[~,idx2] = findpeaks(y22);
title({['Peak wave length is ',num2str(x(idx1)),' before trapping '],['and ',num2str(x(idx2)),' after trapping']})