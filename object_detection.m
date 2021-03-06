IMG=readjpg('tux');
diary('results/gray_copy_coords.txt'); %txt file for coordinate outputs
%[modIMG, grayscale] = colorFinder(IMG,190,250,225,255,225,255);  %blue
[modIMG, grayscale] = colorFinder(IMG,200,255,0,100,0,100);       %red
%[modIMG, grayscale] = colorFinder(IMG,240,255,190,245,80,140);      %yellow
gray_copy = grayscale;
s = size(IMG); 
x = s(1);        %dimensions of the image
y = s(2);

objects = [];
distance_threshold = 5;  %This is the distance threshold for considering 2 pixels as part of the same object, decrease for a finer tune, but the count below may have to be increased, which will make the program take longer to run
loop_count = 5;     %more is betterbut takes longer to run, 3 is sufficient for red, 5 for yellow
for i = 1:y         %Iterate through every x value
    for j = 1:x     %and every y value
        if (grayscale(i,j)==255)
            disp("Object found at "+i+", "+j);
            gray_copy(i,j) = 50;
            current = [i j];
            grayscale(i,j) = 0;
            for c=1:loop_count   
                for k = j:y
                    for g = 1:x
                        for h=1:2:length(current)
                            if(grayscale(k,g)==255)
                                distance = sqrt( (k-current(h))^2+(g-current(h+1))^2 );
                                %disp(distance);
                                if (distance_threshold > distance)
                                    current(end+1) = k;
                                    current(end+1) = g;
                                    %disp("working, adding "+k+", "+g);
                                    %disp(distance);
                                    grayscale(k,g) = 0;
                                end
                            end
                        end
                    end
                end
            end
            %disp(current);
            countx = 0;
            county = 0;
            current_size = length(current);
            for h=1:2:current_size
               countx = countx + current(h); 
               county = county + current(h+1);
            end
            midx = countx / (current_size/2);
            midy = county / (current_size/2);
            objects(end+1) = midx;
            objects(end+1) = midy;
        end
    end
end
dispimg(grayscale);

for i=1:2:length(objects)
    gray_copy(round(objects(i)),round(objects(i+1))) = 150;
end

diary('off'); %end console recording

dispimg(gray_copy);
%imsave(); %user-dependent image saving
imwrite(gray_copy, 'results/gray_copy.jpg'); 
