function [L,A,B] = RGBkeLAB(R,G,B)
% RGBkeLab digunakan untuk mengonversi RGB ke CIELAB
% Nilai balik:
% L -> [1, 100]
% a dan b -> [-110,110]
R = double(R);
G = double(G);
B = double(B);
if max(max(R)) > 1.0 || max(max(G)) > 1.0 || ...
max(max(B)) > 1.0
R = double(R) / 255;
G = double(G) / 255;
B = double(B) / 255;
end
% RGB to XYZ
Koef = [0.412453 0.357580 0.180423;
0.212671 0.715160 0.072169;
0.019334 0.119193 0.950227];
RGB = [R, G, B]';
XYZ = Koef * RGB;
% Peroleh Xq=X/Xn, Yq=Y/Yn, Zq=Z/Zn
% dengan R=G=B=1 untuk menghitung Xn, Yn, Zn
Xq = XYZ(1,:) / 0.950456;
Yq = XYZ(2,:);
Zq = XYZ(3,:) / 1.088754;
[tinggi, lebar] = size(B);
for m=1 : tinggi
for n=1 : lebar
fqx = fq(Xq(m, n));
fqy = fq(Yq(m, n));
fqz = fq(Zq(m, n));
L(m, n) = 116.0 * fqy - 16;
A(m, n) = 500.0 * (fqx - fqy);
B(m, n) = 200.0 * (fqy - fqz);
end
end
return
function hasil = fq(q)
% Untuk menghitung f(q)
if q > 0.008856
hasil = q ^(1/3);
else
hasil = 7.787*q + 16/116.0;
end