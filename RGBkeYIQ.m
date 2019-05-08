function [Y, I, Q] = RGBkeYIQ(R,G,B)
% RGBkeYIQ digunakan untuk mengonversi RGB ke YIQ
% Normalisasi RGB ke [0, 1]
R = double(R);
G = double(G);
B = double(B);
if max(max(R)) > 1.0 || max(max(G)) > 1.0 || max(max(B)) > 1.0
R = double(R) / 255;
G = double(G) / 255;
B = double(B) / 255;
end
[tinggi, lebar] = size(R);
for m=1: tinggi
for n=1: lebar
Y(m,n) = 0.299*R(m,n)+0.587*G(m,n)+0.114*B(m,n);
I(m,n) = 0.596*R(m,n)-0.274*G(m,n)-0.322*B(m,n);
Q(m,n) = 0.211*R(m,n)-0.523*G(m,n)+0.312*B(m,n);
end
end
% Konversikan ke jangkauan [0,255]
Y = uint8(Y * 255);
I = uint8(I * 255);
Q = uint8(Q * 255);