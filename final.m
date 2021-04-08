IMG=readjpg('tux.jpg');
size(IMG);
x = 500;
y = 500;
r=zeros(x,y); 
g=zeros(x,y); 
b=zeros(x,y);
z = zeros(x,y);
r=IMG(:,:,1); 
g=IMG(:,:,2); 
b=IMG(:,:,3);

IMGmod = IMG;
%Find all pixels of more than 200 red, set all other pixels to white
red = z;
for i = 1:500
    for j = 1:500
        if IMGmod(i,j,1) < 200 || IMGmod(i,j,2) > 100 || IMGmod(i,j,3) > 100
            IMGmod(i,j,1) = 255;
            IMGmod(i,j,2) = 255;
            IMGmod(i,j,3) = 255;
        else
            red(i,j)=255;
        end
    end
end

%Z(:,:,1) = 0;
%Z(:,:,2) = 0;
%Z(:,:,3) = r;
dispimg(IMG);
dispimg(IMGmod);
%dispimg(red);


%Y = [0.299*r + 0.587*g + 0.114*b];
%dispimg(Y);
