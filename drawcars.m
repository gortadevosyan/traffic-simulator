function drawcars(n, w, k, g, o, r, vmin, vmax, x1, x2, x3, x4, D, p)
cord=[w/8 -k*w; -k*w -7*w/8;  (k-0.5)*w w/8; -7*w/8 (k-0.5)*w;];
%the two vectors are defined to help generate plates
letters='A':'Z';
num= ['0' '1' '2' '3' '4' '5' '6' '7' '8' '9'];
%this array will keep the track of the cars that didn't stop under the red
%light and later will print them
carsunderred=[""]; q=1;
%plate1=plates(5, letters, num, plate1, len);
%number of cars in each direction

b=[rand, rand, rand, rand];
Ncars1 = ceil(n*b(1)/sum(b));
Ncars2 = ceil(n*b(2)/sum(b));
Ncars3 = ceil(n*b(3)/sum(b));
Ncars4 = n-Ncars3-Ncars2-Ncars1;
l=6;len=0;
%generating plates for each set of cars
%The big platesall array is created to make sure no coicidence happens,
%which is higly unlikely: 1/26*35^4=1/39,016,250
platesall=[""]; ent=false;
for i=1:1:Ncars1
    plates1(i)="";
    plates1(i)=plates(l, letters, num, plates1(i), len);
    if length(platesall)>1 || ent
       for j=1:1:length(platesall)
        if plates1(i)==platesall(j)
            i=i-1;
            break;
        end
        if j==length(platesall)
            platesall(j+1)=plates1(i);
        end
       end
    else
        platesall(1)=plates1(i);
        ent=true;
    end
end

for i=1:1:Ncars2
    plates2(i)="";
    plates2(i)=plates(l, letters, num, plates2(i), len);
    if length(platesall)>1  || ent
       for j=1:1:length(platesall)
        if plates2(i)==platesall(j)
            i=i-1;
            break;
        end
        if j==length(platesall)
            platesall(j+1)=plates2(i);
        end
       end
    else
        platesall(1)=plates2(i);
        ent=true;
    end
end

for i=1:1:Ncars3
    plates3(i)="";
    plates3(i)=plates(l, letters, num, plates3(i), len);
    if length(platesall)>1 || ent
       for j=1:1:length(platesall)
        if plates3(i)==platesall(j)
            i=i-1;
            break;
        end
        if j==length(platesall)
            platesall(j+1)=plates3(i);
        end
       end
    else
        platesall(1)=plates3(i);
        ent=true;
    end
end

for i=1:1:Ncars4
    plates4(i)="";
    plates4(i)=plates(l, letters, num, plates4(i), len);
    if length(platesall)>1 || ent
       for j=1:1:length(platesall)
        if plates4(i)==platesall(j)
            i=i-1;
            break;
        end
        if j==length(platesall)
            platesall(j+1)=plates4(i);
        end
       end
    else
        platesall(1)=plates4(i);
        ent=true;
    end
end
%speed of the cars randomized
speed1 = randi([ceil(vmin), ceil(vmax)], Ncars1,1);
speed2 = randi([ceil(vmin), ceil(vmax)], Ncars2,1);
speed3 = randi([ceil(vmin), ceil(vmax)], Ncars3,1);
speed4 = randi([ceil(vmin), ceil(vmax)], Ncars4,1);

%sizes of the cars randomized in a range
sz1 = randi([ceil(w/4) ceil(3*w/4)], Ncars1+1,1);
sz2 = randi([ceil(w/4) ceil(3*w/4)], Ncars2+1,1);
sz3 = randi([ceil(w/4) ceil(3*w/4)], Ncars3+1,1);
sz4 = randi([ceil(w/4) ceil(3*w/4)], Ncars4+1,1);

%starting coordinates of the cars
coordup=[w/8 -k*w];
coorddown = [-7*w/8 (k-0.5)*w;];
coordleftright = [-k*w -7*w/8]; 
coordrightleft = [(k-0.5)*w w/8];


%setting the coordinates of the cars in their starting positions, up cars
coord1(1,:) = [coordup(1,1), coordup(1,2), sz1(1), 2*sz1(1)];
for i = 1:1:Ncars1
    coord1(i+1,:) = [coord1(1,1) coord1(i,2)-2*sz1(i+1)-randi([ ceil(w/2), ceil(2*w)], 1, 1)  sz1(i+1) 2*sz1(i+1)];
    if(coord1(i,2)+2*sz1(i)>= -k*w)
    car1(i) = rectangle('Position', coord1(i,:), 'FaceColor', [ 1 1 255]/255 );
    end
end

%setting the coordinates of the cars in their starting positions, down cars
coord2(1,:) = [coorddown(1,1), coorddown(1,2), sz2(1), 2*sz2(1)];
for i = 1:1:Ncars2
    coord2(i+1,:) = [coord2(1,1) coord2(i,2)+2*sz2(i)+randi([ ceil(w/2), ceil(2*w)], 1, 1)  sz2(i+1) 2*sz2(i+1)];
    if(coord2(i,2)<=k*w)
    car2(i) = rectangle('Position', coord2(i,:), 'FaceColor', [255 255 1]/255);
    end
end

%setting the coordinates of the cars in their starting positions, L to R
coord3(1,:) = [coordleftright(1,1), coordleftright(1,2), 2*sz3(1), sz3(1)];
for i = 1:1:Ncars3
    coord3(i+1,:) = [coord3(i,1)-2*sz3(i+1)-randi([ ceil(w/2), ceil(2*w)], 1, 1) coord3(1,2) 2*sz3(i+1) sz3(i+1)];
    if(coord3(i,1)+2*sz3(i)>=-k*w)
    car3(i) = rectangle('Position', coord3(i,:), 'FaceColor', [255 87 51]/255 );
    end
end

%setting the coordinates of the cars in their starting positions, R to L
coord4(1,:) = [coordrightleft(1,1), coordrightleft(1,2), 2*sz4(1), sz4(1)];
for i = 1:1:Ncars4
    coord4(i+1,:) = [coord4(i,1)+2*sz4(i)+randi([ ceil(w/2), ceil(2*w)], 1, 1) coord4(1,2) 2*sz4(i+1) sz4(i+1)];
    if(coord4(i,1)<=k*w)
    car4(i) = rectangle('Position', coord4(i,:), 'FaceColor', [255 1 128]/255 );
    end
end

%defining the front coordinate of the car, up
i = 1:1:Ncars1;
frnt1(i) = coord1(i,2)+2*sz1(i);

%defining the front coordinate of the car, down
i = 1:1:Ncars2;
frnt2(i) = coord2(i,2);

%defining the front coordinate of the car, L to R
i = 1:1:Ncars3;
frnt3(i) = coord3(i,1)+2*sz3(i);

%defining the front coordinate of the car, R to L
i = 1:1:Ncars4;
frnt4(i) = coord4(i,1);

%defining the colors of the traffic light
green = [1,255,1]/255;
red = [255, 1, 1]/255;
orange = [255,165,0]/255;

%defining the positions of the traffic light
pos1 = [x1(1)-D, x1(2), D, D];
pos2 = [x2(1)-D, x2(2)-D, D, D];
pos3 = [x3(1), x3(2)-D, D, D];
pos4 = [x4(1), x4(2), D, D];

%defining the timers for the traffic lights
time1 = [g, o, r]; time2 = [r, g, o];
ind1 = 1; ind2 = 1;

%defining the color circle of the traffic lights
color1 = [green; orange; red];
color2 = [red; green; orange];

%drawing the traffic lights: might be transferred to another file
light1 = rectangle('Position', pos1, 'Curvature',[1 1], 'FaceColor', color1(ind1,:));
light3 = rectangle('Position', pos3, 'Curvature',[1 1], 'FaceColor', color1(ind1,:));

light2 = rectangle('Position', pos2, 'Curvature',[1 1], 'FaceColor', color2(ind2,:));
light4 = rectangle('Position', pos4, 'Curvature',[1 1], 'FaceColor', color2(ind1,:));

tlight1 = tic; tlight2 = tic;

% starting indexes of each cari array
st1 = 1; st2 = 1; st3 = 1; st4 = 1;

while ~crash(coord1, coord2, coord3, coord4, Ncars1, Ncars2, Ncars3, Ncars4 ) 
    if toc(tlight1) >= time1(ind1)
        ind1 = mod(ind1,3)+1;
        light1.FaceColor = color1(ind1,:);
        light3.FaceColor = color1(ind1,:);
        tlight1 = tic;
    end

    if toc(tlight2) >= time2(ind2)
        ind2 = mod(ind2,3)+1;
        light2.FaceColor = color2(ind2,:);
        light4.FaceColor = color2(ind2,:);
        tlight2 = tic;
    end
    
    %moving from down to up
        for j = st1:1:Ncars1
            %checking if stops under red/orange or not
            if(frnt1(j)<= -w && frnt1(j)+speed1(j)*w/100> -w)
            end
            if (frnt1(j)<= -w && frnt1(j)+speed1(j)*w/100> -w && ind1~=1)
                if p/100 >= rand()  % allowing some cars to not to stop at the traffic light
                    carsunderred(q)=plates1(j);
                    q=q+1;
                    coord1(j,2) = coord1(j,2)+speed1(j)*w/100;
                    frnt1(j) = frnt1(j)+speed1(j)*w/100;
                    car1(j).Position = [coord1(j,1) coord1(j,2) sz1(j) 2*sz1(j)];
                else 
                    continue;
                end
            else
                if(j~=st1)
                    if ( frnt1(j) + speed1(j)*w/100 > coord1(j-1,2)-w/8  )
                        speed1(j)=speed1(j-1); %adjust the speed if cannot keep a distance
                            if ( frnt1(j)+speed1(j)*w/100 > coord1(j-1,2)-w/8  )
                                continue;
                            end
                    end
                end
                coord1(j,2) = coord1(j,2)+speed1(j)*w/100;
                frnt1(j) = frnt1(j)+speed1(j)*w/100;
                if  coord1(j,2) >= k*w
                    n=n-1;
                    delete(car1(j));
                    st1 = st1+1;
                    getframe;                   
                    continue;
                end
                if(frnt1(j)>=-k*w)
                    if(length(car1)>=j)
                        car1(j).Position = [coord1(j,1) coord1(j,2) sz1(j) 2*sz1(j)];
                        getframe;
                    else
                        car1(j)=rectangle('Position', [coord1(j,1) coord1(j,2) sz1(j) 2*sz1(j)], 'FaceColor', [ 1 1 255]/255 );
                        getframe;
                    end
                end
            end
        end
    
    %moving from up to down

        for j = st2:1:Ncars2
            %checking if stops under red
            if (frnt2(j)>= w && frnt2(j)-speed2(j)*w/100 < w && ind1~=1)
                if p/100 >= rand()
                    carsunderred(q)=plates2(j);
                    q=q+1;
                    coord2(j,2) = coord2(j,2)-speed2(j)*w/100;
                    frnt2(j) = frnt2(j)-speed2(j)*w/100;
                    car2(j).Position = [coord2(j,1) coord2(j,2) sz2(j) 2*sz2(j)];
                    getframe;
                else
                    continue;
                end
            else
                if(j~=st2)
                    if ( frnt2(j) - speed2(j)*w/100 < coord2(j-1,2)+w/8+2*sz2(j-1) )
                        speed2(j)=speed2(j-1); %adjust the speed if cannot keep a distance
                            if ( frnt2(j)-speed2(j)*w/100 < coord2(j-1,2)+w/8+2*sz2(j-1) )
                                continue;
                            end
                    end
                end
                coord2(j,2) = coord2(j,2)-speed2(j)*w/100;
                frnt2(j) = frnt2(j)-speed2(j)*w/100;
                if  coord2(j,2) <= -k*w
                    n=n-1;
                    delete(car2(j));
                    st2 = st2+1;
                    getframe;                   
                    continue;
                end
                if frnt2(j)<=k*w
                    if(length(car2)>=j)
                        car2(j).Position = [coord2(j,1) coord2(j,2) sz2(j) 2*sz2(j)];
                        getframe;
                    else
                        car2(j)=rectangle('Position', [coord2(j,1) coord2(j,2) sz2(j) 2*sz2(j)], 'FaceColor', [255 255 1]/255 );
                        getframe;
                    end
                end
            end
        end

    %moving from left to right
    
        for j = st3:1:Ncars3
            %checking if stops under red
            if (frnt3(j)<= -w && frnt3(j)+speed3(j)*w/100> -w && ind2~=2)
                if p/100 >= rand()
                    carsunderred(q)=plates3(j);
                    q=q+1;
                    coord3(j,1) = coord3(j,1)+speed3(j)*w/100;
                    frnt3(j) = frnt3(j)+speed3(j)*w/100;
                    car3(j).Position = [coord3(j,1) coord3(j,2) 2*sz3(j) sz3(j)];
                    getframe;
                else
                continue;
                end
            else
                if(j~=st3)
                    if ( frnt3(j) + speed3(j)*w/100 > coord3(j-1,1)-w/8  )
                        speed3(j)=speed3(j-1); %adjust the speed if cannot keep the distance
                            if ( frnt3(j)+speed3(j)*w/100 > coord3(j-1,1)-w/8  )
                                continue;
                            end
                    end
                end
                coord3(j,1) = coord3(j,1)+speed3(j)*w/100;
                frnt3(j) = frnt3(j)+speed3(j)*w/100;
                if  coord3(j,1) >= k*w
                    delete(car3(j));
                    n=n-1;
                    st3 = st3+1;
                    getframe;                   
                    continue;
                end
                if frnt3(j)>=-k*w
                    if(length(car3)>=j)
                        car3(j).Position = [coord3(j,1) coord3(j,2) 2*sz3(j) sz3(j)];
                        getframe;
                    else 
                        car3(j)=rectangle('Position', [coord3(j,1) coord3(j,2) 2*sz3(j) sz3(j)], 'FaceColor', [ 255 87 51]/255 );
                        getframe;
                    end
                end
            end
        end

    %moving from right to left

        for j = st4:1:Ncars4
            %checking if stops under red
            if (frnt4(j)>= w && frnt4(j)-speed4(j)*w/100 < w && ind2~=2)
                if p/100 >= rand()
                    carsunderred(q)=plates4(j);
                    q=q+1;
                    coord4(j,1) = coord4(j,1)-speed4(j)*w/100;
                    frnt4(j) = frnt4(j)-speed4(j)*w/100;
                    car4(j).Position = [coord4(j,1) coord4(j,2) 2*sz4(j) sz4(j)];
                    getframe;
                else
                    continue;
                end
            else
                if(j~=st4)
                    if frnt4(j) - speed4(j)*w/100 < coord4(j-1,1)+w/8+2*sz4(j-1)
                        speed4(j)=speed4(j-1); %adjust the speed if cannot keep a distance
                            if frnt4(j)-speed4(j)*w/100 < coord4(j-1,1)+w/8+2*sz4(j-1)
                                continue;
                            end
                    end
                end
                coord4(j,1) = coord4(j,1)-speed4(j)*w/100;
                frnt4(j) = frnt4(j)-speed4(j)*w/100;
                if  coord4(j,1) <= -k*w
                    n=n-1;
                    delete(car4(j));
                    st4 = st4+1;
                    getframe;                   
                    continue;
                end
                if frnt4(j)<=k*w
                    if(length(car4)>=j)
                        car4(j).Position = [coord4(j,1) coord4(j,2) 2*sz4(j) sz4(j)];
                        getframe;
                    else
                        car4(j)=rectangle('Position', [coord4(j,1) coord4(j,2) 2*sz4(j) sz4(j)], 'FaceColor', [255 1 128]/255 );
                        getframe;
                    end
                end
            end
        end
    if n==0
        clf;
        rectangle('Position', [0 0 2 2],"FaceColor",'green');
        text(0.9,1, 'Victory!');
        break;
    end
end

i=1:1:q-1;
disp(carsunderred(i));
if n>0
    text(0,0, 'Game Over!');
end
end

%crash checking function, true if it happened, otherwise false
function a=crash(coord1, coord2, coord3, coord4, Ncars1, Ncars2, Ncars3, Ncars4 )
a=false;
for i=1:1:Ncars1
    for j=1:1:Ncars3
        if rectint(coord1(i,:), coord3(j,:))
            a=true;
            return;
        end
    end
end
for i=1:1:Ncars1
    for j=1:1:Ncars4
        if rectint(coord1(i,:), coord4(j,:))
            a=true;
            return;
        end
    end
end
for i=1:1:Ncars2
    for j=1:1:Ncars3
        if rectint(coord2(i,:), coord3(j,:))
            a=true;
            return;
        end
    end
end
for i=1:1:Ncars2
    for j=1:1:Ncars4
        if rectint(coord2(i,:), coord4(j,:))
            a=true;
            return;
        end
    end
end
end

%plate generating function
function s=plates(l, letters, num, s, len)
    if len>=l
        return;
    elseif len==0
        len=len+1;
        s=letters(randi([1, length(letters)], 1, 1));
        s=plates(l, letters, num, s, len);
    else
        switch randi([0,1])
            case 0
                s=append(s,letters(randi([1, length(letters)], 1, 1)));
            case 1
                s=append(s,num(randi([1, length(num)], 1, 1)));
        end
        len=len+1;
        s=plates(l, letters, num, s, len);
    end

end