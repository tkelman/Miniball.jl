using MiniBall
using Base.Test

unit_circle_2D = miniball([-1.0 0.0; 1.0 0.0; 0.0 1.0; 0.0 -1.0])
@test unit_circle_2D[2] == 1
@test unit_circle_2D[1] == [0.0,0.0]

unit_ball_3D = miniball([-1.0 0.0 0.0; 1.0 0.0 0.0; 0.0 1.0 0.0; 0.0 -1.0 0.0])
@test unit_ball_3D[2] == 1
@test unit_ball_3D[1] == [0.0,0.0,0.0]
