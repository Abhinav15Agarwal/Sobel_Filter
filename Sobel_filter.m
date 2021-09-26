close all;
clear all;
clc
Img = imread('lake.png');
%i = im2double(Img);
Img_grey = .299*Img(:,:,1) + .587*Img(:,:,2) + .114*Img(:,:,3);
A = Img_grey;


%Preallocate the matrices with zeros
I=zeros(size(A));

%Filter Masks
F1=[-1 0 1;-2 0 2; -1 0 1];
F2=[-1 -2 -1;0 0 0; 1 2 1];

A=double(A);


% for i=1:size(A,1)-2
%     for j=1:size(A,2)-2
%         %Gradient operations
%         Gx=sum(sum(F1.*A(i:i+2,j:j+2)));
%         Gy=sum(sum(F2.*A(i:i+2,j:j+2)));
%                
%         %Magnitude of vector
%          I(i+1,j+1)=sqrt(Gx.^2+Gy.^2);
%        
%     end
% end

Gx = convolve(A, F1);
Gy = convolve(A, F2);
mag = sqrt(Gx.^2+Gy.^2);
I = mag;
I=uint8(I);
figure,imshow(I);title('Filtered Image');

%Define a threshold value
Thresh=200;
B=max(I,Thresh);
B(B==round(Thresh))=0;

%B=im2bw(B);
%figure,imshow(B);title('Edge detected Image');

B=uint8(B);
figure,imshow(~B);title('Edge detected Image');