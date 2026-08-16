length = 10;
width = 4;
height = 3;

P = 150; % Power per bulb
y_b = 2; % Center line of the room

x = linspace(0, length, 200);
y = linspace(0, width, 80);
[X, Y] = meshgrid(x, y);

positions = [3 7; 2 8; 1 9];

for k = 1:size(positions,1)
    x_1 = positions(k,1);
    x_2 = positions(k,2);
    
    R1 = sqrt((X - x_1).^2 + (Y - y_b).^2 + height^2);
    R2 = sqrt((X - x_2).^2 + (Y - y_b).^2 + height^2);
    
    I = P./(4*pi*R1.^2) + P./(4*pi*R2.^2);
    
    figure
    contourf(X, Y, I, 20)
    colormap('parula')
    colorbar
    title(['Brightness on Floor (Two 150W Bulbs at x = ' ...
        num2str(x1) ' and ' num2str(x2) ')'])
    xlabel('(m)')
    ylabel('(m)')
end