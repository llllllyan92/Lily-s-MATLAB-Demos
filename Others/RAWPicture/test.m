% number of rows of pixes present in the image (please change this value according to your image)
row=576;  
%number of columns of pixels present in the image (please change this value according to your image)
col=768;

%read file (please change file name to your image file)
fin=fopen('a1.raw','r');


%(if you are reading grayscale image please change the line to:  I=fread(fin, col*row*1,'uint8=>uint8');)
% the image file was written as 8 bit unsigned binary representation 
%if your file uses different encoding e.g. uint16 please change the value accordingly

I=fread(fin, col*row*3,'uint8=>uint8'); %// Read in as a single byte stream 


% for greyscale image please change it to I = reshape(I, [col row 1]);
I = reshape(I, [col row 3]); %// Reshape so that it's a 3D matrix - Note that this is column major
Ifinal = flip(imrotate(I, -90),2); % // The clever transpose
imshow(Ifinal);
fclose(fin); %// Close the file

% save file as png
imwrite(Ifinal,'a1.png');