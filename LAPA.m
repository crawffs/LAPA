x = 10;
y = 10;
v = zeros(x,y);
v(:,1) = 1;
v2 = v;
for i = 1:50
    for j = 2:(x-1)
        for m = 2:(y-1)
            if(x == 1)
                v2(j,m) = v(j+1,m);
            elseif(x == y)
                v2(j,m) = v(j-1,m);
            else
                v2 =(v(j+1,m) + v(j-1,m) + v(j,m+1) + v(j,m-1))/4;
            end
        end
    end
    
   figure(1)
   surf(v)
   hold on
   pause(0.01)
end

figure(2)
[Ex, Ey] = gradient(v);
[X, Y] = meshgrid(1:x,1:y);
quiver(X,Y,Ex,Ey);
    
figure(3)
Vimage = imboxfilt(v,3);
Vimage(:,y) = 1;
Vimage(:,1) = 1;
Vimage(x,:) = 0;
Vimage(1,:) = 0;
surf(X,Y,Vimage);
