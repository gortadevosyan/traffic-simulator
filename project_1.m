n = input("input the overall number of cars");
w = input("input the width of the road, the input should be >=4, 20 and higher is recommended");
p = input("input the probability that a car doesn't stop on a red light in percentages 0-100");
g = input("input the duration of green light in seconds");
o = input("input the duration of orange light in seconds");
r = input("input the duration of red light in seconds, red light should be longer or equal to green and orange light lengths sum");
vmax = input("please input a maximum speed");
vmin= input("please input a minimum speed");

%k is the ratio of the road width to road length
k=4;
x1 = [-w,  w];
x2 = [-w, -w];
x3 = [ w, -w];
x4 = [ w,  w];
axis equal;
clf;
%draws the crossroad
drawroad(x1, x2, x3, x4, w, k);

%diameter of the traffic light
D=w/4;

%draws the traffic lights, cars and the whole animation
axis equal;
drawcars(n, w, k, g, o, r, vmin, vmax, x1, x2, x3, x4, D, p);