This project used MATLAB to analyze and experiment in finding the optimal bulb placement in different bulbs to maximize the distribution light intensity in a room.


The code Bulb_300_Watt.m is used to find the optimal placement of a 300-watt light bulb in a room with the dimensions of length = 10 m, width = 4 m and height = 3 m. The figure below shows where to place the 300-watt light bulb to get the maximum light intensity in the room of the given dimensions. 


![Optimal Placement of 300 watt bulb](<Optimal Placement of 300 watt bulb.jpg>)


The code Two_150_Watt.m is used to find the optimal placement of two 150-watt light bulbs in a room with the dimensions of length = 10 m, width = 4 m and height = 3 m. The figure below shows where to place the two 150-watt light bulbs to get the maximum light intensity in the room of the given dimensions.


![Optimal Placement of two 150-watt bulbs](<Optimal Placement of two 150 watts bulb.jpg>)


The code for Light.m is used to calculate the optimal position of any light bulb to maximize the light intensity for a room of given dimensions. The graph below shows the position at which to place a light source in a 2D plane to get maximum light intensity.


![Optimal Light Placement Analysis](<Optimal Light Placement Analysis.jpg>)

Mathematical Reasoning

1. Distance from the Light Source

For a light source located at \((x_b,y_b)\) and a point \((x,y)\) on the floor, the distance between them is calculated using:

\[
R =
\sqrt{(x-x_b)^2+(y-y_b)^2+H^2}
\]

2. Light Intensity

The project models light intensity using the inverse-square relationship:

\[
I = \frac{P}{4\pi R^2}
\]

where:

- \(I\) = modeled light intensity
- \(P\) = bulb power in watts
- \(R\) = distance between the bulb and the point on the floor

As the distance from the bulb increases, the modeled intensity decreases according to the inverse-square relationship.

3. Two-Bulb Configuration

For two light sources, the intensity contributions from both bulbs are combined:

\[
I_{\text{total}}
=
\frac{P_1}{4\pi R_1^2}
+
\frac{P_2}{4\pi R_2^2}
\]

For the two-bulb experiment:

\[
P_1=P_2=150\,W
\]

This allows the project to compare different placements of two 150-watt bulbs with the single 300-watt configuration.

4. Optimization

The `Light.m` program uses a simplified 2D model in which the light sources are positioned symmetrically:

\[
L_1=(d,5)
\]

\[
L_2=(10-d,5)
\]

The optimization variable is \(d\), the distance of a light source from the side wall.

The program calculates intensity at:

\[
P_{\text{corner}}=(0,0)
\]

and

\[
P_{\text{midpoint}}=(5,0)
\]

The optimization objective is:

\[
d^*
=
\arg\min_d
\left|
I_{\text{corner}}(d)
-
I_{\text{midpoint}}(d)
\right|
\]

The MATLAB program evaluates multiple possible values of \(d\) and selects the position that minimizes the difference between the corner and midpoint intensity values.
