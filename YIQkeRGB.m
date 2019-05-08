function [R, G, B] = YIQkeRGB(Y,I,Q)
% YIQkeRGB digunakan untuk mengonversi YIQ ke RGB
% Normalisasi YIQ ke [0, 1]
Y = double(Y);
I = double(I);
Q = double(Q);
if max(max(Y)) > 1.0 || max(max(I)) > 1.0 || ...
max(max(Q)) > 1.0
Y = double(Y) / 255;
I = double(I) / 255;
Q = double(Q) / 255;
end
[tinggi, lebar] = size(Y);
for m=1: tinggi
for n=1: lebar
R(m,n) = Y(m,n)+0.956 * I(m,n) + 0.621 * Q(m,n);
G(m,n) = Y(m,n)-0.272 * I(m,n) - 0.647 * Q(m,n);
B(m,n) = Y(m,n)-1.106 * I(m,n) + 1.703 * Q(m,n);
end
end
% Konversikan ke jangkauan [0,255]
R = uint8(R * 255);
G = uint8(G * 255);
B = uint8(B * 255);