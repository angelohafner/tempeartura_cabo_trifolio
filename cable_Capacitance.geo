//View.IntervalsType = 1;
//View.NbIso = 32;


Include "parameters.dat";

// Center Point
Point(1000)={c_x , c_y , 0 , msg};
Include "VeiaInferiorDireita.geo";
Include "VeiaInferiorEsquerda.geo";
Include "VeiaSuperiorCentral.geo";

// Condutor central
cx = c_x;
cy = c_y;
r  = rIntDiel3;
Point(2000001)={cx     , cy     , 0 , msg};
Point(2000002)={cx + r , cy     , 0 , msg};
Point(2000003)={cx     , cy + r , 0 , msg};
Point(2000004)={cx - r , cy     , 0 , msg};
Point(2000005)={cx     , cy - r , 0 , msg};

Circle(2000001) = {2000002,2000001,2000003};
Circle(2000002) = {2000003,2000001,2000004};
Circle(2000003) = {2000004,2000001,2000005};
Circle(2000004) = {2000005,2000001,2000002};

Line Loop(2000001)     = {2000001,2000002,2000003,2000004};
Plane Surface(2000001) = {2000001,500001,50001,5001};

// Physical Objects
Physical Surface(SFILLER) = {2000001};

// Condutor central
cx = c_x;
cy = c_y;
r  = rExtDiel3;
Point(3000001)={cx     , cy     , 0 , msg};
Point(3000002)={cx + r , cy     , 0 , msg};
Point(3000003)={cx     , cy + r , 0 , msg};
Point(3000004)={cx - r , cy     , 0 , msg};
Point(3000005)={cx     , cy - r , 0 , msg};

Circle(3000001) = {3000002,3000001,3000003};
Circle(3000002) = {3000003,3000001,3000004};
Circle(3000003) = {3000004,3000001,3000005};
Circle(3000004) = {3000005,3000001,3000002};

Line Loop(3000001)     = {3000001,3000002,3000003,3000004};
Plane Surface(3000001) = {3000001,2000001};

// Physical Objects
Physical Line(LARMOR) = {3000001,3000002,3000003,3000004};
Physical Surface(SDIELINTARM) = {3000001};

// Condutor central
cx = c_x;
cy = c_y;
r  = rArmor;
Point(4000001)={cx     , cy     , 0 , msg};
Point(4000002)={cx + r , cy     , 0 , msg};
Point(4000003)={cx     , cy + r , 0 , msg};
Point(4000004)={cx - r , cy     , 0 , msg};
Point(4000005)={cx     , cy - r , 0 , msg};

Circle(4000001) = {4000002,4000001,4000003};
Circle(4000002) = {4000003,4000001,4000004};
Circle(4000003) = {4000004,4000001,4000005};
Circle(4000004) = {4000005,4000001,4000002};

Line Loop(4000001)     = {4000001,4000002,4000003,4000004};
Plane Surface(4000001) = {4000001,3000001};

// Physical Objects
Physical Surface(SARMOR) = {4000001};


// Fronteira Longínqua
cx = c_x;
cy = c_y;
r  = 5*rArmor;
msg = 20 * msg;
Point(5000001)={cx     , cy     , 0 , msg};
Point(5000002)={cx + r , cy     , 0 , msg};
Point(5000003)={cx     , cy + r , 0 , msg};
Point(5000004)={cx - r , cy     , 0 , msg};
Point(5000005)={cx     , cy - r , 0 , msg};

Circle(5000001) = {5000002,5000001,5000003};
Circle(5000002) = {5000003,5000001,5000004};
Circle(5000003) = {5000004,5000001,5000005};
Circle(5000004) = {5000005,5000001,5000002};

Line Loop(5000001)     = {5000001,5000002,5000003,5000004};
Plane Surface(5000001) = {5000001,4000001};

// Physical Objects
Physical Line(LFRONTEIRA) = {5000001,5000002,5000003,5000004};
Physical Surface(SFRONTEIRA) = {5000001};