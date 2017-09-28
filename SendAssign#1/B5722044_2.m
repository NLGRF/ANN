clear all
clc
p =[-0.5 2; 1 2; 1.5 -0.5; 2 1; -2 -1; -1 1; -1 -1; 1 -1];
t =[0 0; 0 0; 0 1; 0 1; 1 0; 1 0; 1 1; 1 1;];
w1 = [1 1];
w2 = [0.5 1.5];
b1 = 1;
b2 = 1;

pt = p';
tt = t';
figure(1);
plotpv(pt,tt)
plotpc([w1(1,1) w1(1,2)],b1)
plotpc([w2(1,1) w2(1,2)],b2)

head = sprintf('IterNo\t\t p\t\t y1\t\t y2\t\t t1\t\t t2\t\t e1\t\t e2\t\t w11\t w12\t w21\t w22\t b1 \t b2');
out = sprintf('\f\f--\t\t\t--\t\t --\t\t --\t\t --\t\t --\t\t --\t\t --\t\t %.1f \t %.1f\t %.1f\t %.1f\t %.1f\t %.1f',...
w1(1,1),w1(1,2),w2(1,1),w2(1,2),b1,b2);
disp(head)
disp(out)
fprintf('------------------------------------------------------------------------------------------------------------------\n');

update = 1;
iter = 0;
while update == 1
    for i = 1:8
        iter = iter+1;
        n1(i,1) = w1(1,1)*p(i,1) + w1(1,2)*p(i,2) +b1;
        if n1(i,1) >= 0
            y1(i,1) = 1;
        elseif n1(i,1) < 0
            y1(i,1) = 0;
        end %of if
        n2(i,1) = w2(1,1)*p(i,2) + w2(1,2)*p(i,2) +b2;
        if n2(i,1) >= 0
            y2(i,1) = 1;
        elseif n2(i,1) < 0
            y2(i,1) = 0;
        end %of if
        
        e1(i,1) = t(i,1)-y1(i,1);
        e2(i,1) = t(i,2)-y2(i,1);
        w1(1,1) = w1(1,1) + e1(i,1)*p(i,1);
        w1(1,2) = w1(1,2) + e1(i,1)*p(i,2);
        w2(1,1) = w2(1,1) + e2(i,1)*p(i,1);
        w2(1,2) = w2(1,2) + e2(i,1)*p(i,2);
        b1 = b1+e1(i,1);
        b2 = b2+e2(i,1);
        
        fprintf('\t%d \t\t p%d \t\f%d \t\t\f%d \t\t\f%d \t\t\f%d \t\t %.1f \t %.1f\t %.1f\t %.1f\t %.1f\t %.1f\t %.1f\t %.1f\n',...
        iter, i, y1(i,1), y2(i,1), t(i,1), t(i,2), e1(i,1),e2(i,1), w1(1,1),w1(1,2),w2(1,1),w2(1,2),b1,b2);
    end
    fprintf('------------------------------------------------------------------------------------------------------------------\n');
    
    if any(e1) == 0 
    update = 0;
    end 
end 
epoch = iter/8

figure
pt = p';
tt = t';
figure(2);
plotpv(pt,tt)
plotpc([w1(1,1) w1(1,2) ],b1)
plotpc([w2(1,1) w2(1,2) ],b2)