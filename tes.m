clear all;
img = imread('1.jpg');
[C,M,Y,K] = RGBkeCMY(img(:,:,1),img(:,:,2),img(:,:,3));
figure(1);
subplot(3,2,1);imshow(C);title('C')
subplot(3,2,2);imshow(M);title('M')
subplot(3,2,3);imshow(Y);title('Y')
subplot(3,2,4);imshow(K);title('K')
subplot(3,2,5);imshow(img);title('asli')