Include "parameters.dat";


// Condutor superior central
cx = ccsc_x;
cy = ccsc_y;
r  = rInd;
Point(200001)={cx     , cy     , 0 , msg};
Point(200002)={cx + r , cy     , 0 , msg};
Point(200003)={cx     , cy + r , 0 , msg};
Point(200004)={cx - r , cy     , 0 , msg};
Point(200005)={cx     , cy - r , 0 , msg};

Circle(200001) = {200002,200001,200003};
Circle(200002) = {200003,200001,200004};
Circle(200003) = {200004,200001,200005};
Circle(200004) = {200005,200001,200002};

Line Loop(200001)     = {200001,200002,200003,200004};
Plane Surface(200001) = {200001};

// Physical Objects
Physical Line(LINDSC)    = {200001,200002,200003,200004};
Physical Surface(SINDSC) = {200001};


// Isolante 1
cx = ccsc_x;
cy = ccsc_y;
r  = rDiel1;
Point(300001)={cx     , cy     , 0 , msg};
Point(300002)={cx + r , cy     , 0 , msg};
Point(300003)={cx     , cy + r , 0 , msg};
Point(300004)={cx - r , cy     , 0 , msg};
Point(300005)={cx     , cy - r , 0 , msg};

Circle(300001) = {300002,300001,300003};
Circle(300002) = {300003,300001,300004};
Circle(300003) = {300004,300001,300005};
Circle(300004) = {300005,300001,300002};

Line Loop(300001)     = {300001,300002,300003,300004};
Plane Surface(300001) = {300001,200001};

// Physical Objects
//Physical Line(LDIEL1SC)    = {300001,300002,300003,300004};
Physical Surface(SDIEL1SC) = {300001};

// Blindagem
cx = ccsc_x;
cy = ccsc_y;
r  = rBlind;
Point(400001)={cx     , cy     , 0 , msg};
Point(400002)={cx + r , cy     , 0 , msg};
Point(400003)={cx     , cy + r , 0 , msg};
Point(400004)={cx - r , cy     , 0 , msg};
Point(400005)={cx     , cy - r , 0 , msg};

Circle(400001) = {400002,400001,400003};
Circle(400002) = {400003,400001,400004};
Circle(400003) = {400004,400001,400005};
Circle(400004) = {400005,400001,400002};

Line Loop(400001)     = {400001,400002,400003,400004};
Plane Surface(400001) = {400001,300001};

// Physical Objects
Physical Line(LBLINDSC)    = {400001,400002,400003,400004, 300001,300002,300003,300004};
Physical Surface(SBLINDSC) = {400001};


// Isolante 2
cx = ccsc_x;
cy = ccsc_y;
r  = rDiel2;
Point(500001)={cx     , cy     , 0 , msg};
Point(500002)={cx + r , cy     , 0 , msg};
Point(500003)={cx     , cy + r , 0 , msg};
Point(500004)={cx - r , cy     , 0 , msg};
Point(500005)={cx     , cy - r , 0 , msg};

Circle(500001) = {500002,500001,500003};
Circle(500002) = {500003,500001,500004};
Circle(500003) = {500004,500001,500005};
Circle(500004) = {500005,500001,500002};

Line Loop(500001)     = {500001,500002,500003,500004};
Plane Surface(500001) = {500001,400001};

// Physical Objects
Physical Surface(SDIEL2SC) = {500001};