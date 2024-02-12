Include "parameters.dat";


// Condutor central
cx = ccie_x;
cy = ccie_y;
r  = rInd;
Point(2001)={cx     , cy     , 0 , msg};
Point(2002)={cx + r , cy     , 0 , msg};
Point(2003)={cx     , cy + r , 0 , msg};
Point(2004)={cx - r , cy     , 0 , msg};
Point(2005)={cx     , cy - r , 0 , msg};

Circle(2001) = {2002,2001,2003};
Circle(2002) = {2003,2001,2004};
Circle(2003) = {2004,2001,2005};
Circle(2004) = {2005,2001,2002};

Line Loop(2001)     = {2001,2002,2003,2004};
Plane Surface(2001) = {2001};

// Physical Objects
Physical Line(LINDIE)    = {2001,2002,2003,2004};
Physical Surface(SINDIE) = {2001};


// Isolante 1
cx = ccie_x;
cy = ccie_y;
r  = rDiel1;
Point(3001)={cx     , cy     , 0 , msg};
Point(3002)={cx + r , cy     , 0 , msg};
Point(3003)={cx     , cy + r , 0 , msg};
Point(3004)={cx - r , cy     , 0 , msg};
Point(3005)={cx     , cy - r , 0 , msg};

Circle(3001) = {3002,3001,3003};
Circle(3002) = {3003,3001,3004};
Circle(3003) = {3004,3001,3005};
Circle(3004) = {3005,3001,3002};

Line Loop(3001)     = {3001,3002,3003,3004};
Plane Surface(3001) = {3001,2001};

// Physical Objects
// Linha unica para a blindagem
//Physical Line(LDIEL1IE)    = {3001,3002,3003,3004};
Physical Surface(SDIEL1IE) = {3001};

// Blindagem
cx = ccie_x;
cy = ccie_y;
r  = rBlind;
Point(4001)={cx     , cy     , 0 , msg};
Point(4002)={cx + r , cy     , 0 , msg};
Point(4003)={cx     , cy + r , 0 , msg};
Point(4004)={cx - r , cy     , 0 , msg};
Point(4005)={cx     , cy - r , 0 , msg};

Circle(4001) = {4002,4001,4003};
Circle(4002) = {4003,4001,4004};
Circle(4003) = {4004,4001,4005};
Circle(4004) = {4005,4001,4002};

Line Loop(4001)     = {4001,4002,4003,4004};
Plane Surface(4001) = {4001,3001};

// Physical Objects
Physical Line(LBLINDIE)    = {4001,4002,4003,4004, 3001,3002,3003,3004};
Physical Surface(SBLINDIE) = {4001};


// Isolante 2
cx = ccie_x;
cy = ccie_y;
r  = rDiel2;
Point(5001)={cx     , cy     , 0 , msg};
Point(5002)={cx + r , cy     , 0 , msg};
Point(5003)={cx     , cy + r , 0 , msg};
Point(5004)={cx - r , cy     , 0 , msg};
Point(5005)={cx     , cy - r , 0 , msg};

Circle(5001) = {5002,5001,5003};
Circle(5002) = {5003,5001,5004};
Circle(5003) = {5004,5001,5005};
Circle(5004) = {5005,5001,5002};

Line Loop(5001)     = {5001,5002,5003,5004};
Plane Surface(5001) = {5001,4001};

// Physical Objects
Physical Surface(SDIEL2IE) = {5001};