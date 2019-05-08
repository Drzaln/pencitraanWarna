function [R,G,B] = HSVkeRGB(H,S,V)
% HSVkeRGB digunakan untuk mengonversi HSV ke RGB
% Normalisasi SV ke [0, 1] dan H ke [0, 360]
H = double(H);
S = double(S);
V = double(V);
if max(max(H)) > 1.0 || max(max(S)) > 1.0 || ...
max(max(V)) > 1.0
H = double(H) / 255 * 360;
S = double(S) / 255;
V = double(V) / 255;
end
[tinggi, lebar] = size(H);
for m=1: tinggi
for n=1: lebar
if S(m,n) == 0
R(m,n) = V(m,n);
G(m,n) = V(m,n);
B(m,n) = V(m,n);
else
% S != 0
% Menghitung posisi sektor (0 s/d 5)
H(m,n) = H(m,n) / 60;
sektor = floor(H(m, n));
faktor = H(m,n) - sektor;
p = V(m,n) * (1 - S(m,n));
q = V(m,n) * (1 - S(m,n) * faktor);
t = V(m,n) * (1 - S(m,n) * (1 - faktor));
switch sektor
case 0
R(m,n) = V(m,n);
G(m,n) = t;
B(m,n) = p;
case 1
R(m,n) = q;
G(m,n) = V(m,n);
B(m,n) = p;
case 2
R(m,n) = p;
G(m,n) = V(m,n);
B(m,n) = t;
case 3
R(m,n) = p;
G(m,n) = q;
B(m,n) = V(m,n);
case 4
R(m,n) = t;
G(m,n) = p;
B(m,n) = V(m,n);
otherwise % case 5
R(m,n) = V(m,n);
G(m,n) = p;
B(m,n) = q;
end
end
end
end
R = uint8(R * 255);
G = uint8(G * 255);
B = uint8(B * 255);