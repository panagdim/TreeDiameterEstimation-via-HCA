load('x.mat');
load('y.mat');

axis equal;

rng('default');
Y = pdist2(x,y,'minkowski');
Z = linkage(Y);
T = cluster(Z,'maxclust',3);

ang = 0:0.01:2*pi;
conAng = cos(ang);
sinAng = sin(ang);

figure
hold all;

for i = 1:max(T)
    [xo{i},yo{i},R{i}] = circle_fit(x(i==T),y(i==T));
    plot(x(i==T),y(i==T),'.');
    plot(xo{i},yo{i}, 'x', 'MarkerSize', 7,'MarkerEdgeColor', 'r');
    xc = R{i}*cos(ang);
    yc = R{i}*sin(ang);
    plot(xo{i}+xc,yo{i}+yc,'--');  
end