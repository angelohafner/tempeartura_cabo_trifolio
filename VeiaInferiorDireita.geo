//Include "parameters.dat";


// Condutor central
cx = ccid_x;
cy = ccid_y;
r  = rInd;
Point(20001)={cx     , cy     , 0 , msg};
Point(20002)={cx + r , cy     , 0 , msg};
Point(20003)={cx     , cy + r , 0 , msg};
Point(20004)={cx - r , cy     , 0 , msg};
Point(20005)={cx     , cy - r , 0 , msg};

Circle(20001) = {20002,20001,20003};
Circle(20002) = {20003,20001,20004};
Circle(20003) = {20004,20001,20005};
Circle(20004) = {20005,20001,20002};

Line Loop(20001)     = {20001,20002,20003,20004};
Plane Surface(20001) = {20001};

// Physical Objects
Physical Line(LINDID)    = {20001,20002,20003,20004};
Physical Surface(SINDID) = {20001};


// Isolante 1
cx = ccid_x;
cy = ccid_y;
r  = rDiel1;
Point(30001)={cx     , cy     , 0 , msg};
Point(30002)={cx + r , cy     , 0 , msg};
Point(30003)={cx     , cy + r , 0 , msg};
Point(30004)={cx - r , cy     , 0 , msg};
Point(30005)={cx     , cy - r , 0 , msg};

Circle(30001) = {30002,30001,30003};
Circle(30002) = {30003,30001,30004};
Circle(30003) = {30004,30001,30005};
Circle(30004) = {30005,30001,30002};

Line Loop(30001)     = {30001,30002,30003,30004};
Plane Surface(30001) = {30001,20001};

// Physical Objects
//Physical Line(LDIEL1ID)    = {30001,30002,30003,30004};
Physical Surface(SDIEL1ID) = {30001};

// Blindagem
cx = ccid_x;
cy = ccid_y;
r  = rBlind;
Point(40001)={cx     , cy     , 0 , msg};
Point(40002)={cx + r , cy     , 0 , msg};
Point(40003)={cx     , cy + r , 0 , msg};
Point(40004)={cx - r , cy     , 0 , msg};
Point(40005)={cx     , cy - r , 0 , msg};

Circle(40001) = {40002,40001,40003};
Circle(40002) = {40003,40001,40004};
Circle(40003) = {40004,40001,40005};
Circle(40004) = {40005,40001,40002};

Line Loop(40001)     = {40001,40002,40003,40004};
Plane Surface(40001) = {40001,30001};

// Physical Objects
Physical Line(LBLINDID)    = {40001,40002,40003,40004, 30001,30002,30003,30004};
Physical Surface(SBLINDID) = {40001};


// Isolante 2
cx = ccid_x;
cy = ccid_y;
r  = rDiel2;
Point(50001)={cx     , cy     , 0 , msg};
Point(50002)={cx + r , cy     , 0 , msg};
Point(50003)={cx     , cy + r , 0 , msg};
Point(50004)={cx - r , cy     , 0 , msg};
Point(50005)={cx     , cy - r , 0 , msg};

Circle(50001) = {50002,50001,50003};
Circle(50002) = {50003,50001,50004};
Circle(50003) = {50004,50001,50005};
Circle(50004) = {50005,50001,50002};

Line Loop(50001)     = {50001,50002,50003,50004};
Plane Surface(50001) = {50001,40001};

// Physical Objects
Physical Surface(SDIEL2ID) = {50001};