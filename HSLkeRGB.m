function [R,G,B] = HSLkeRGB(H,S,L)
% HSLkeRGB digunakan untuk mengonversi HSL ke RGB.
% Berdasarkan algoritma Max K. Agoston (2005)
% Normalisasi HSL
H = double(H);
S = double(S);
L = double(L);
if max(max(H)) > 1.0 || max(max(S)) > 1.0 || ...
max(max(L)) > 1.0
H = double(H) / 255 * 360;
S = double(S) / 255;
L = double(L) / 255;
end
[tinggi, lebar] = size(H);
for m=1: tinggi
for n=1: lebar
if L(m,n) <= 0.5
v = L(m,n) * (1 + S(m,n));
else
v = L(m,n) + S(m,n) - L(m,n) * S(m,n);
end
if v == 0
R(m,n) = 0;
G(m,n) = 0;
B(m,n) = 0;
else
terkecil = 2 * L(m,n) - v;
sv = (v - terkecil) / v;
if H(m,n) == 360
H(m,n) = 0;
else
H(m,n) = H(m,n) / 60;
end
sektor = floor(H(m,n)); % 0-5
frak = H(m,n) - sektor;
vsf = v * sv * frak;
mid1 = terkecil + vsf;
mid2 = v - vsf;
switch sektor
case 0
R(m,n) = v;
G(m,n) = mid1;
B(m,n) = terkecil;
case 1
R(m,n) = mid2;
G(m,n) = v;
B(m,n) = terkecil;
case 2
R(m,n) = terkecil;
G(m,n) = v;
B(m,n) = mid1;
case 3
R(m,n) = terkecil;
G(m,n) = mid2;
B(m,n) = v;
case 4
R(m,n) = mid1;
G(m,n) = terkecil;
B(m,n) = v;
case 5
R(m,n) = v;
G(m,n) = terkecil;
B(m,n) = mid2;
end
end
end
end
% Konversikan ke jangkauan [0, 255]
R = uint8(R * 255);
G = uint8(G * 255);
B = uint8(B * 255);