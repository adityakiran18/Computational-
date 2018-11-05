%-------------------------------------------------------------------------
% Programmed by Asad Ali
% Graduate Student, Faculty of Computer Science & Engineering
% GIK Institute of Engineering Sciences & Technology
% Pakistan
% email :-  asad_82@yahoo.com
% August 2006.
%-------------------------------------------------------------------------

clear all;
close all;

originalImage = double(rgb2gray(imread('oval.JPG'))); 

%Preprocessing
%-------------------------------------------------------------------------
% resize: optional step
originalImage = imresize(originalImage,[175 175],'bilinear');

% find the object contour
originalImage = edge(originalImage,'prewitt');

% change the background to white and boundary to black for tracing
[x,y,pixelValues]=find(originalImage);
contourImage(1:size(originalImage,1),1:size(originalImage,2)) = 255;

for i=1:size(x)
    contourImage(x(i),y(i)) = 0;
end
%figure,imshow(contourImage),title('White background and Black Boundary')

[xx,yy,pp] = find(originalImage);
%-------------------------------------------------------------------------
%End of Preprocessing

% select a starting point for contour parameterization
r = xx(40); c = yy(40);
% use the below method when the object has inner parts detected as edges
for i=1:size(originalImage,1)
    if originalImage(i,round(size(originalImage,2)/2))== 1
        r = i;
        c = round(size(originalImage,2)/2);
        break;
    end
end

% trace the object outer contour
cpixels = affine_contour_trace(contourImage,r,c,xx,yy);

% check the traced contour whether it is correct or not
testImage(1:size(originalImage,1),1:size(originalImage,2))=1;
for i=1:size(cpixels,1) 
    dx = cpixels(i,1); dy = cpixels(i,2);
    testImage(dx,dy) = 0; 
end
figure,imshow(testImage),title('Test Extracted Contour')

% assign the traced contour coordinate values to x & y
x = cpixels(:,1); y = cpixels(:,2);

% use x & y for any thing like constructing affine contour invariants etc.
figure,plot(x,y),title('Parameterized Boundary')

