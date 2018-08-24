clc;
clear all;
close all;
faceDetector = vision.CascadeObjectDetector();
image=imread('C:\Users\Bharth\Desktop\20180722_084932.jpg');
bb=step(faceDetector,image);
hold on;  
for j=1:size(bb,1)   
     bb(j,3)=bb(j,3)+250;
     bb(j,4)=bb(j,4)+250;
     bb(j,1)=bb(j,1)-250;
     bb(j,2)=bb(j,2)-250;
end
bb=bb+50;
b=size(bb,1);
for i=1:b
    if bb(i,3)<1000
        bb(i,:)=[0 0 0 0];
        b=b-1;
    end
end
bb(~any(bb,2),:)=[];
for j=1:size(bb,1)
    z=imcrop(image,[bb(j,:)]);
    imwrite(z,sprintf('%d.jpg',j));
end
hold off;
loc=input('Enter the Name','s');
cd F:\MATLAB\PROJECT\DATABASE;
mkdir(loc);
cd F:\MATLAB\PROJECT;
for i=1:b
    img=sprintf('%d.jpg',i);
    FeatureExtraction(img,b,loc);
    imggg=sprintf('%d.jpg',i);
    immat=sprintf('%d.mat',i);
    source=['F:\MATLAB\PROJECT' immat];
    destination=['F:\MATLAB\PROJECT\DATABASE' loc];
    %%movefile(source,destination);
    %%delete (imggg);
end
