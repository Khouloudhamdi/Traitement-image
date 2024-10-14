 clear all; 
 close all; 
 clc; 
 %lecture de l'image
 image=imread('LENA.BMP');
 figure,subplot(4,4,1);
 imshow(image);
 title('image original');
 
 %taille de l'image
 [rows, columns] =size(image);
 disp(['La taille de l''image est de : ', num2str(rows), ' x ',num2str(columns), ' pixels.']);
 
 %inversion des couleurs
 for i=0:1:255
     for j=0:1:255
         y=255-image;
     end;
 end;
 subplot(4,4,2);
 imshow(y);
 title('inversion des couleurs');
 
 % affichage d'un bloc de l'image
 for i=20:250
     for j=100:250
      T(i,j)=image(i,j);
     end;
 end;
 subplot(4,4,3);
 imshow(T);
 title('affichage dun bloc de limage');
 
 %rotation statique
 subplot();
 C=imrotate(image,60);
 subplot(4,4,4);
 imshow(C);
 title('rotation statique');

 %le profile d'intensité d'une ligne statique 
 X=image(50,:);
 subplot(4,4,5);
 plot(X),grid on;
 title('le profile de ligne statique');
 
 %le profile d'intensité d'une colonne statique 
 Y=image(:,50);
 subplot(4,4,6);
 plot(Y),grid on;
 title('le profile de colonne statique ');

 % rotation Dynamique 
 rotation=input('\n donner le degre de rotation')
 R=imrotate(image,rotation);
 subplot(4,4,7);
 imshow(R);
 title(' Rotation Dynamique');

 %le profile d'intensité d'une ligne Dynamique
 ligne=input('\n donner num de la ligne')
 X1=image(ligne,:);
 subplot(4,4,8);
 plot(X1)
 title('Le profile de ligne Dynamique ');
 
 %le profile d'intensité d'une colonne Dynamique 
 colonne=input('\n donner num de la colonne')
 Y1=image(:,colonne);
 subplot(4,4,9);
 plot(Y1)
 title('Le profile de Colonne Dynamique ');
 
%l'histogramme de l'image
subplot(4,4,10);
imhist(image);
title('Histograme')

%appliquer un bruit salt & pepper à l'image 
densite=input('\n Entrer la densité de bruit salt & pepper')
bruit1 = imnoise(image,'salt & pepper',densite);
subplot(4,4,11);
imshow(bruit1);
title('bruit salt & pepper ')
 
%appliquer un bruit speckle à l'image
densite1=input('\n Entrer la densité de bruit speckle')
bruit2 = imnoise(image,'speckle',densite1);
subplot(4,4,12);
imshow(bruit2);
title('bruit speckle')

%appliquer un filtrage médian à l'image pour un bruit salt & pepper
 median1= medfilt2(bruit1);
 subplot(4,4,13);
 imshow(median1)
 title('un filtrage moyenneur pour un bruit salt & pepper ')
 
%appliquer un filtrage médian à l'image pour un bruit speckle
 median2= medfilt2(bruit2);
 subplot(4,4,14);
 imshow(median2)
 title('un filtrage moyenneur pour un bruit speckle')

%appliquer un filtrage moyenneur à l'image pour un bruit salt & pepper

H = fspecial('average');
moyenneur1 = imfilter(bruit1,H,'replicate');
subplot(4,4,15);
imshow(moyenneur1);
title('un filtrage médian pour un bruit salt & pepper');

%appliquer un filtrage moyenneur à l'image pour un bruit speckle
H = fspecial('average');
moyenneur2 = imfilter(bruit2,H,'replicate');
subplot(4,4,16);
imshow(moyenneur2);
title('un filtrage médian pour un bruit speckle');

%determiner PSNR
[peaksnr, snr] = psnr(bruit1, image);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);


