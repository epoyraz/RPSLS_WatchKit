clc

% green = imread('bg_win.png');
% red = imread('bg_lose.png');
% black = imread('bg.png');
rocki = imread('rocki.png');
rock = imread('rock.png');

paperi = imread('paperi.png');
paper = imread('paper.png');

lizardi = imread('lizardi.png');
lizard = imread('lizard.png');

scissori = imread('scissorsi.png');
scissor = imread('scissors.png');

spocki = imread('spocki.png');
spock = imread('spock.png');

n = 10;
ninv = 1/n;

cd('rock/');
for i=1:n
   
    imr = i*ninv*rock + (1 - i*ninv)*rocki;
    
    ind = num2str(i);
    s1 = ['rock-' ind '.png'];
   
    imwrite(imr,s1,'png');
    
end
cd ..

cd('spock/');
for i=1:n
   
    imr = i*ninv*spock + (1 - i*ninv)*spocki;
    
    ind = num2str(i);
    s1 = ['spock-' ind '.png'];
   
    imwrite(imr,s1,'png');
    
end
cd ..

cd('paper/');
for i=1:n
   
    imr = i*ninv*paper + (1 - i*ninv)*paperi;
    
    ind = num2str(i);
    s1 = ['paper-' ind '.png'];
   
    imwrite(imr,s1,'png');
    
end
cd ..

cd('scissors/');
for i=1:n
   
    imr = i*ninv*scissor + (1 - i*ninv)*scissori;
    
    ind = num2str(i);
    s1 = ['scissors-' ind '.png'];
   
    imwrite(imr,s1,'png');
    
end
cd ..

cd('lizard/');
for i=1:n
   
    imr = i*ninv*lizard + (1 - i*ninv)*lizardi;
    
    ind = num2str(i);
    s1 = ['lizard-' ind '.png'];
   
    imwrite(imr,s1,'png');
    
end
cd ..