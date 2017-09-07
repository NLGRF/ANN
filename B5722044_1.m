clear all %clear all variables
close all %close all figure
clc %clear screen

p =[0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1]; %input vectors (input patterns)
t =[0 1 1 1 0 0 0 1]'; %target output
w = [0.5 0.5 1]; %initial weight
b = 1; %initial bias

%plot input, target, and initial weight(line wp+b =0)
%see help for plotpv and plotpc
pt = p';
tt = t';
figure(1);
plotpv(pt,tt)
plotpc([w(1,1) w(1,2) w(1,3)],b)

%create table to show result of each iteration 
head = sprintf('IterNo\t\t p\t\t y\t\t t\t\t e\t\t w11\t w12\t w13\t b');
out = sprintf('\f\f--\t\t\t--\t\t --\t\t --\t\t --\t\t %.1f \t %.1f\t %.1f\t %.1f',...
w(1,1),w(1,2),w(1,3),b);
disp(head)
disp(out)

%prepare to save result in file
%fid = fopen('resultOR.txt','w+');
%fprintf('IterNo\t\t p\t\t y\t\t t\t\t e\t\t w11\t w12\t w13\t b\n');
%fprintf('\f\f--\t\t --\t\t --\t\t --\t\t --\t\t %.1f \t %.1f\t %.1f\t %.1f\n',...
%w(1,1),w(1,2),w(1,3),b);
fprintf('---------------------------------------------------------------------\n');

update = 1;
iter = 0;
while update == 1
    for i = 1:8
        iter = iter+1;
        n(i,1) = w(1,1)*p(i,1) + w(1,2)*p(i,2)+ w(1,3)*p(i,3)+b;
        if n(i,1) >= 0
            y(i,1) = 1;
        elseif n(i,1) < 0
            y(i,1) = 0;
        end %of if
        
        e(i,1) = t(i,1)-y(i,1);
        w(1,1) = w(1,1) + e(i,1)*p(i,1);
        w(1,2) = w(1,2) + e(i,1)*p(i,2);
        w(1,3) = w(1,3) + e(i,1)*p(i,3);
        b = b+e(i,1);
        
        fprintf('\f\f%d \t\t\t p%d \t\f%d \t\t\f%d \t\t\f%d \t\t %.1f \t %.1f\t %.1f\t %.1f\n',...
        iter, i, y(i,1), t(i,1), e(i,1), w(1,1),w(1,2),w(1,3),b);
        %disp(out)
        %fprintf(fid,'\f\f%d \t\t p%d \t\f%d \t\t\f%d \t\t\f%d \t\t %.1f \t %.1f\t %.1f\t %.1f\n',...
        %iter, i, y(i,1), t(i,1), e(i,1), w(1,1),w(1,2),w(1,3),b);
    end %of for
    fprintf('---------------------------------------------------------------------\n');
    
    if any(e) == 0
    update = 0;
    end %of if
end %of while

%fclose(fid);
epoch = iter/8

%plot output of weight after training
figure
pt = p';
tt = t';
figure(2);
plotpv(pt,tt)
plotpc([w(1,1) w(1,2) w(1,3)],b)
