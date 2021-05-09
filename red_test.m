IMG=readjpg('tux');
[modIMG, grayscale] = colorFinder(IMG,200,255,0,100,0,100); 
%imsave(modIMG);    %nonfunctional
%imsave(grayscale); %nonfunctional
imwrite(modIMG, 'results/modIMG.jpg');
imwrite(grayscale, 'results/grayscale.jpg');