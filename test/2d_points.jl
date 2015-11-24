using MiniBall
using Base.Test
# Tests for (x, y) pairs. All the reference results have been calculated with 
# the original C++ miniball

# Random points
points_random = [ 0.247206  0.110497; 
                  0.876655  0.555887;
                  3.14755   3.32475;
                  0.551952  0.736911;
                  2.3369    2.79415;
                  0.841633  0.274646;
                  0.648779  0.867076;
                  0.566598  0.769689;
                  0.740699  0.802813;
                  0.96375   0.378811;
                  3.82      0.4]
random_center_ref = [1.93228 1.50566 ] 
random_rad_ref = sqrt(4.78596)

# Square
points_square = [  0.0  0.0;
                  10.0  0.0;
                  10.0 10.0;
                   0.0 10.0]
square_center_ref = [5. 5.] 
square_rad_ref = sqrt(50.)

# random pair, create with rand() * rand() * 100
points_rand = [15.201026002809915 4.205742914106132;
                2.0642942437309446 16.202756053687146;
                2.6911517920697667 6.09142922659148;
                0.378102635164462 15.54673908594114;
                16.658184399593477 52.91599603550958;
                1.65687749143664 52.17683651326058;
                12.103628240626422 82.01024792483732;
                23.836592317584067 14.38072873483128;
                22.03566557685967 1.3648127439224451;
                19.907968218288406 4.4971438758521405;
                1.3470849729885368 10.881162438578812;
                56.865242888444016 8.882207797681636;
                28.46354330283503 29.374933990333524;
                9.510620995517643 7.024114925755601;
                24.052263713324134 6.811637106401792;
                65.81201928155869 2.1809201437127386;
                44.10121220834222 19.35623732811709;
                17.93270566482291 72.88974698764137;
                10.32591170017104 36.522365416510425;
                11.704549628888321 35.58075157879185;
                46.67329197456145 9.63177099425921;
                15.053472450408806 50.461958055226;
                2.7289734786867768 16.685229414144054;
                25.728524248076123 2.8212214445094803;
                13.161713708351916 4.694490676127405;
                26.102565511652998 6.397917809722525;
                5.908166844638877 29.977727976351048;
                0.19326573337547506 22.1777928328827;
                48.75178834128242 10.438351432059772;
                8.03016917415464 73.86647303957707;
                4.4578586475714195 62.27835037439446;
                15.957884344213438 9.053488800020695;
                3.8933789697057644 25.327621533551646;
                0.7561293263985513 23.353782848537556;
                40.657312553408566 15.686191303242527;
                4.134018181893055 20.36624662343125;
                5.46270473795831 2.1890107908378145;
                13.996968546495589 41.31854652752799;
                16.885563038294848 1.3787565281883207;
                61.835932087203226 1.0378816026154971;
                8.60233779919819 3.9827525521772307;
                9.610778229651224 8.350769026023782;
                11.489384106869018 3.943889025881367;
                34.04861941602072 2.517126787749521;
                25.797546293445773 42.09485217291192;
                6.006761543665552 0.2703058209986466;
                10.775024400606505 22.85124653971943;
                27.801606380001942 32.072214016878355;
                80.36590320749707 23.882072814912917;
                10.114585654802209 37.108769272047745;
                7.740125670230712 1.3424864847651228;
                35.934844234601755 3.6244226277094915;
                10.967431364664108 12.851202843579932;
                28.68363623172721 8.946792138561104;
                38.8534413163757 30.894588079234435;
                29.075367017259 66.85252207103674;
                2.07345836550619 16.14414941917021;
                24.704313332455275 27.02474848298272;
                5.001014986449595 17.69173574292981;
                24.364782427417975 15.079425067081603;
                2.492688091165679 1.3111617358068084;
                4.006160271067846 36.940081926524186;
                10.245941479909941 2.435205939649001;
                7.092829175197693 2.7003540470087453;
                0.17201159283212697 42.44445998211886;
                49.888291740919385 24.99214113210696;
                5.167660547003532 32.957042575387334;
                64.52454552840567 43.20498646970195;
                16.973277751305652 5.145377047325937;
                21.73521294076896 30.185456972008566;
                0.6501322002588363 10.593547892171143;
                3.2869243549834284 19.41463405650076;
                1.1796778171787814 14.020896558299478;
                1.1182391319902052 19.285412751254754;
                50.364991317112505 0.8914398317644169;
                15.943734439692367 2.2253787796059075;
                6.315227299697318 53.53048562428706;
                2.678446355058345 13.807834167284955;
                25.648656363210957 34.46262448067225;
                61.8576756948276 93.44784240374915;
                28.59852140363292 0.05046786912322927;
                13.56772988661636 79.10557716455492;
                3.752559715179568 17.59965640143985;
                13.869235295301271 12.524654814536557;
                17.834205115730363 0.5917735459599994;
                22.815400365983397 26.93304958568418;
                0.5280557392064843 73.02176327068382;
                18.963761215304263 21.774643517191603;
                3.4456790830515143 10.726729583434764;
                12.543099281739059 38.05946121730917;
                20.468061217602372 16.12404911234709;
                2.9220894262936605 29.725443477187806;
                19.276510273095244 10.508060397268919;
                40.96516125406834 34.43829047020115;
                19.091753387229726 6.333061105428417;
                13.519303803472724 23.155452469647546;
                37.10598670666354 66.50564830237805;
                4.22280652816175 9.19198413205544;
                73.03918285076644 13.50715422693027;
                67.68853593405831 5.503211385265344;
                ]

rand_ref_c= [33.5376 46.5017]
rand_ref_r= sqrt(3005.97)

ball = j_miniball(points_square)
square_sqr_rad = sqrt(ball.squared_radius) 
square_center = ball.center

ball = j_miniball(points_random)
random_sqr_rad = sqrt(ball.squared_radius) 
random_center = ball.center

ball = j_miniball(points_rand)
rand_r = sqrt(ball.squared_radius) 
rand_c = ball.center

for i=1:2
    ref_center = square_center_ref[i]
    cal_center = square_center[i]
    @test_approx_eq_eps abs(ref_center - cal_center) 0.0 1e-4
    @test_approx_eq_eps abs(square_sqr_rad - square_rad_ref) 0.0 1e-4

    ref_center_random = random_center_ref[i]
    cal_center_random = random_center[i]
    @test_approx_eq_eps abs(ref_center_random - cal_center_random) 0.0 1e-4
    @test_approx_eq_eps abs(random_sqr_rad - random_rad_ref) 0.0 1e-4

    ref_center_random = rand_ref_c[i]
    cal_center_random = rand_c[i]
    @test_approx_eq_eps abs(ref_center_random - cal_center_random) 0.0 1e-4
    @test_approx_eq_eps abs(rand_r - rand_ref_r) 0.0 1e-4
end


println("2D points clear!")

