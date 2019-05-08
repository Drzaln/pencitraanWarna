function [R,G,B] = HSIkeRGB(H,S,I)
% HSIkeRGB digunakan untuk mengonversi HSI ke RGB.
% Normalisasi HSI ke [0, 1]
H = double(H);
S = double(S);
I = double(I);
if max(max(H)) > 1.0 || max(max(S)) > 1.0 || ...
max(max(I)) > 1.0
H = double(H) / 255 * 360;
S = double(S) / 255;
I = double(I) / 255;
end
[tinggi, lebar] = size(H);
for m=1: tinggi
for n=1: lebar
if I(m,n) == 0
R(m,n) = 0;
G(m,n) = 0;
B(m,n) = 0;
elseif S(m,n) == 0
R(m,n) = I(m,n);
G(m,n) = I(m,n);
B(m,n) = I(m,n);
else
if H(m,n) < 0
H(m,n) = H(m,n) + 360.0;
end
skala = 3 * I(m,n);
if H(m,n) <= 120
sudut1 = H(m,n) * 0.017453292;
sudut2 = (60 - H(m,n)) * 0.017453292;
B(m,n) = (1 - S(m,n)) / 3;
R(m,n) = (1 + (S(m,n) * cos(sudut1)/...
cos(sudut2))) / 3;
G(m,n) = 1 - R(m,n) - B(m,n);
B(m,n) = B(m,n) * skala;
R(m,n) = R(m,n) * skala;
G(m,n) = G(m,n) * skala;
elseif H(m,n) <= 240
H(m,n) = H(m,n) - 120;
sudut1 = H(m,n) * 0.017453292;
sudut2 = (60 - H(m,n)) * 0.017453292;
R(m,n) = (1 - S(m,n)) / 3;
G(m,n) = (1 + (S(m,n) * cos(sudut1)/...
cos(sudut2))) / 3;
B(m,n) = 1 - R(m,n) - G(m,n);
R(m,n) = R(m,n) * skala;
G(m,n) = G(m,n) * skala;
B(m,n) = B(m,n) * skala;
else
H(m,n) = H(m,n) - 240;
sudut1 = H(m,n) * 0.017453292;
sudut2 = (60 - H(m,n)) * 0.017453292;
G(m,n) = (1 - S(m,n)) / 3;
B(m,n) = (1 + (S(m,n) * cos(sudut1)/cos(sudut2))) / 3;
R(m,n) = 1 - G(m,n) - B(m,n);
G(m,n) = G(m,n) * skala;
B(m,n) = B(m,n) * skala;
R(m,n) = R(m,n) * skala;
end
end
end
end
% Konversikan ke jangkauan [0, 255]
R = uint8(R * 255);
G = uint8(G * 255);
B = uint8(B * 255);