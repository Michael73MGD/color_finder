IMG=readjpg('tux.jpg'); %copy of final.m, just compressed colorFinder function into another file
modIMG = colorFinder(IMG,200,255,0,100,0,100); %saves results of colofinder to modIMG
dispimg(modIMG); %display modIMG modified image

%i dont think final.m works for the reasons originally thought. It gets it
%dont right, but how it gets it done is wrong.