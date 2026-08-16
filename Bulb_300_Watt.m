length = 10;
width = 4;
height = 3;

P = 300;
x_b = 5;
y_b = 2;

x = linspace(0, length, 200);
y = linspace(0, width, 80);
[X, Y] = meshgrid(x, y);

R = sqrt((X - x_b).^2 + (Y - y_b).^2 + height^2);
I = P ./ (4 * pi * R.^2);

figure
contourf(X, Y, I, 50)
colormap('parula')
colorbar
title('Brightness on the Floor ofOne 300W Bulb at Ceiling Center')
xlabel( '(m)')
ylabel('(m)')

points = [5 2; 0 0; 10 0; 0 4; 10 4];
names = {'Center','Corner (0,0)','Corner (10,0)','Corner (0,4)','Corner (10,4)'};

for i = 1:size(points,1)
    p_x = points(i,1);
    p_y = points(i,2);
    R_point = sqrt((p_x - x_b)^2 + (p_y - y_b)^2 + height^2);
    I_point = P / (4 * pi * R_point^2);
    fprintf('%s: Intensity = %.4f W/m²\n', names{i}, I_point);
end