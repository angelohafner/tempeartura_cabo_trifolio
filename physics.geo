Include "parameters.dat";


resistance_core   = 0.1e-6; // ohm / m
resistance_sheath = 0.1e-4; // ohm / m

area_core   = Pi*rInd^2; // m^2
area_sheath = Pi*(rDiel2^2-rBlind^2); // m^2

current_core   = 50; // A
current_sheath = 2.0; // A

heat_generated_core   = resistance_core   * current_core^2;   // W
heat_generated_sheath = resistance_sheath * current_sheath^2; // W

volumetric_heat_generated_core   = heat_generated_core   / area_core;   // W/m^3
volumetric_heat_generated_sheath = heat_generated_sheath / area_sheath; // W/m^3

q_core   = volumetric_heat_generated_core;
q_sheath = volumetric_heat_generated_sheath;
