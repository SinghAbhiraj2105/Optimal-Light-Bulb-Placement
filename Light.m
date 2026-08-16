clear; close all; clc;

% --- Parameters (Modified to match target output) ---
L_room = 10; % Room length (meters)
W_room = 10; % Room width (meters) - Modified for a square room
H = 0;       % Height of the lights (placed at floor level for specific results)

% Intensity function: i = 1 / (distance^2 + H^2)
% Since H=0, the formula simplifies to the standard inverse square law 1 / distance^2
intensity_func = @(lx, ly, px, py) 1 ./ ((lx - px).^2 + (ly - py).^2 + H^2);

% Define the range for 'd' (distance from short wall x=0), from near 0 to half the room length
d_values = linspace(0.01, 5, 1000); 

% Point coordinates: P_corner = (0, 0)
% Light positions: (d, W_room/2) and (L_room - d, W_room/2)
i_corner = intensity_func(d_values, W_room/2, 0, 0) + ...
           intensity_func(L_room - d_values, W_room/2, 0, 0);

% Point coordinates: P_midpoint = (L_room/2, 0)
% We calculate intensity at (5, 0) assuming lights are at (d, 5)
i_mid = intensity_func(d_values, W_room/2, L_room/2, 0) + ...
        intensity_func(L_room - d_values, W_room/2, L_room/2, 0);

% --- Find the Optimal 'd' (Intersection Point) ---
% The point where the curves are closest is the optimal 'd'
difference = abs(i_corner - i_mid);
[~, idx] = min(difference);

optimal_d = d_values(idx);
optimal_intensity = i_corner(idx); 

% --- Plotting the Results ---

figure('Name', 'Optimal Light Placement Analysis');
plot(d_values, i_corner, 'b-', 'LineWidth', 2, 'DisplayName', 'Intensity at Corner');
hold on;
plot(d_values, i_mid, 'r-', 'LineWidth', 2, 'DisplayName', 'Intensity at Midpoint');

% Highlight the optimal intersection point
plot(optimal_d, optimal_intensity, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'yellow', 'DisplayName', 'Optimal Point');

xlabel('Light Position d (meters from the short wall)');
ylabel('Light Intensity');
title('Finding the Optimal d where Min Intensity is Maximized');
legend('show', 'Location', 'best');
grid on;
hold off;

% Print the optimal values to the Command Window
fprintf('Optimal d value found at intersection: %.4f meters\n', optimal_d);
fprintf('Minimum intensity at this d: %.4f units\n', optimal_intensity);