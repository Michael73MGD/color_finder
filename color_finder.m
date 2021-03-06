function [IMGmod, grayscale] = colorFinder(IMG,rlow,rhi,glow,ghi,blow,bhi)
   
s = size(IMG);     %calculate the size (for now, get these results and manually change the x and y on the next line
x = s(1);        %dimensions of the image
y = s(2);
r=zeros(x,y);          %Create several 3D arrays, with dimensions of the image, but 0s as the values at all locations
g=zeros(x,y); 
b=zeros(x,y);
z = zeros(x,y);
r=IMG(:,:,1);       %In the multidimensional array of IMG, take the third dimension (first two are x and y, third is the three colors), and the 1st number (red)
g=IMG(:,:,2);       %Similar, but get get second color (green)
b=IMG(:,:,3);       %Again, but blue

IMGmod = IMG;       %Making a copy of IMG, IMGmod for modified 
%Find all pixels of more than 200 red, set all other pixels to white
grayscale = z;            %Creating red, a new array of the same dimensions as the image, with the third dimension all set to 0 for now (z is defined on line 8 with these properties)
for i = 1:x         %Iterate through every x value
    for j = 1:y     %and every y value
        if ((rlow <= IMGmod(i,j,1))&&(IMG(i,j,1) <= rhi)) && ((glow <= IMGmod(i,j,2))&&(IMGmod(i,j,2)<= ghi)) && ((blow <= IMGmod(i,j,3))&&(IMGmod(i,j,3) <= bhi))    %Check each pixel, see if red value is <200, or blue > 100 or green >100 (basically any of these means that the pixel isn't sufficiently red to be caught by our filter)
           
                        %Otherwise, we have a very red pixel, no change to IMGmod is needed, we'll leave these pixels the red color that they were
            grayscale(i,j)=255;   %This is just saving the data in a different way. 'red' is a grayscale image that is black everywhere and white where the desired color is located
 
        else
            IMGmod(i,j,1) = 255;    %Set the color at these pixels to white
            IMGmod(i,j,2) = 255;
            IMGmod(i,j,3) = 255;
        end
    end
end

figure, dispimg(IMGmod);
figure, dispimg(grayscale);

end %func end