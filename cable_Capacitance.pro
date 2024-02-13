Include "parameters.dat";
Include "physics.geo";

Group {
	// L denotes Lines, S Surfaces # is can be used instead of Region[]
	
	// Veia Inferior Esquerda
	Lindie 		= #LINDIE;
	Ldiel1ie	= #LDIEL1IE;
	Lblindie 	= #LBLINDIE;
  
	Sindie		= #SINDIE;
	Sdiel1ie 	= #SDIEL1IE;
	Sblindie	= #SBLINDIE;
	Sdiel2ie	= #SDIEL2IE;	
	//======================
	
	// Veia Inferior Direita
	Lindid 		= #LINDID;
	Ldiel1id	= #LDIEL1ID;
	Lblindid 	= #LBLINDID;
  
	Sindid		= #SINDID;
	Sdiel1id 	= #SDIEL1ID;
	Sblindid	= #SBLINDID;
	Sdiel2id	= #SDIEL2ID;
	//======================
	
	// Veia Superior Central
	Lindsc 		= #LINDSC;
	Ldiel1sc	= #LDIEL1SC;
	Lblindsc 	= #LBLINDSC;
  
	Sindsc		= #SINDSC;
	Sdiel1sc 	= #SDIEL1SC;
	Sblindsc	= #SBLINDSC;
	Sdiel2sc	= #SDIEL2SC;
	//======================
	
	// Armadura
	Sfiller		= #SFILLER;
	Sdiel3 		= #SDIELINTARM;
	Sarmor		= #SARMOR;
	Sfronteira  = #SFRONTEIRA;
	Larmor		= #LARMOR;
	Lfronteira  = #LFRONTEIRA;
	//======================
  

	Sind 		=	#{Sindie,Sindid,Sindsc};
	Sdiel1		=	#{Sdiel1ie,Sdiel1id,Sdiel1sc};
	Sblind		=	#{Sblindie,Sblindid,Sblindsc};
	Sdiel2		=	#{Sdiel2ie,Sdiel2id,Sdiel2sc};
	
	Lind 		=	#{Lindie,Lindid,Lindsc};
	//Ldiel1		=	#{Ldiel1ie,Ldiel1id,Ldiel1sc};
	
	/*
	Lpos		=	#{Ldiel1ie,Lblindie};
	Lzero		=	#{Lindie, 
					  Lindid,Ldiel1id,Lblindid, 
					  Lindsc,Ldiel1sc,Lblindsc, 
					  Larmor};
					  */
					  
	//Vol is the total calculation domain
	//Grouped are domains, for which constituents only a single Voltage is defined    
	//Vol is the total calculation domain
	Vol      	=	#{Sind,Sdiel1,Sblind,Sdiel2,Sfiller,Sarmor,Sdiel3,Sfronteira};
	//Grouped are domains, for which constituents only a single Voltage is defined
	Grouped  	= 	#{Lind,Lfronteira};//#{Lpos,Lzero};
}

Function{
	//eps0 			 = 	1;
	epsr[Sind]		 =	400.0;
	epsr[Sdiel1]	 =	0.4; 
	epsr[Sblind]	 =	400.0;
	epsr[Sdiel2]	 =	0.4;   
	epsr[Sfiller]	 =	0.4;
	epsr[Sdiel3]	 =	0.4;  
	epsr[Sarmor]	 =	50.0;
	epsr[Sfronteira] =  0.025;    
}

Jacobian {
	{ Name Vol ; 
		// All domains expand in to infinity in z direction
		// Using Jacobian VolAxi would define a system with a sphere in an 
		// zylindrical capacitor.
		// It should not hurt to have negative radii aslong as the system is 
		//perfectly symmetric..
		Case{ 
			{ Region All ; Jacobian Vol ; } 
		} 
	}
}

Integration{
	{ Name Int ; 
		Case{ 
			{ Type Gauss ; 
				Case{ 
					// 3D elements are not relevant
					// This block defines the accuracy for the numerical integrations
					// Higher NumberOfPoint should correspond to higher accuracy in case
					// of nonlinear behaviour within single cells.
					{ GeoElement Point       	; NumberOfPoints  1 ; }
					{ GeoElement Line        	; NumberOfPoints  3 ; }
					{ GeoElement Triangle    	; NumberOfPoints  4 ; }
					{ GeoElement Quadrangle  	; NumberOfPoints  4 ; }
					{ GeoElement Tetrahedron 	; NumberOfPoints  4 ; }
					{ GeoElement Hexahedron  	; NumberOfPoints  6 ; }
					{ GeoElement Pyramid     	; NumberOfPoints  8 ; }
					{ GeoElement Prism       	; NumberOfPoints  6 ; } 
				}
			} 
		} 
	}
}

Constraint{  
	{ Name GlobalElectricPotential ;
		Case{
			//Boundary condition using fixed Voltages
			//{ Region Lindie;  	Value  100. ;  }
			//{ Region Lblindie; 	Value  0. ;  }
			
			//{ Region Lindid;  	Value  100. ;  }
			//{ Region Lblindid; 	Value  0. ;  }
			
			//{ Region Lindsc;  	Value  100. ;  }
			//{ Region Lblindsc; 	Value  0. ;  }			
			
			//{ Region Larmor; 	Value  0. ;  }
			{ Region Lfronteira;  	Value  0.0 ;  }
			
		}
	}

	{ Name GlobalElectricCharge ;
		Case {
			//Boundary Condition defining the charge of a grouped domain
			//For each grouped domain, either a charge or a potential 
			//needs to be specified
			{ Region Lindie;  	Value  q_core ;  }
			{ Region Lindid;  	Value  q_core ;  }
			{ Region Lindsc;  	Value  q_core ;  }
			{ Region Lblindie; 	Value  q_sheath ;  }
			{ Region Lblindid; 	Value  q_sheath ;  }
			{ Region Lblindsc; 	Value  q_sheath ;  }
		}
	}
}

FunctionSpace{
	{ Name fs_vglob ; 
		Type Form0 ; // so we have scalars
		BasisFunction{
			// ordinary nodal basis functions everywhere but for the grouped domains,
			// which will be grouped of course.
			// Then each grouped domain constituent can only have a single shared value
			{ Name sn ; NameOfCoef vn ; Function BF_Node ;
			  Support Region[{Vol}] ; Entity NodesOf[ All,Not Grouped] ; 
			}
			{ Name sf ; NameOfCoef vfu ; Function BF_GroupOfNodes ;
			  Support Vol ; Entity GroupsOfNodesOf[ Grouped] ; 
			}
		}
    
		GlobalQuantity{
			{ Name GlobalElectricPotential ; Type AliasOf        ; NameOfCoef vfu ; }
			{ Name GlobalElectricCharge    ; Type AssociatedWith ; NameOfCoef vfu; }
		}
    
		Constraint{
			// CFoo: unused, nonexisting boundary condition
			{ NameOfCoef vn  ; EntityType NodesOf         ; NameOfConstraint CFoo; }
			{ NameOfCoef vfu ; EntityType GroupsOfNodesOf ; NameOfConstraint CFoo; }
			{ NameOfCoef GlobalElectricCharge ; EntityType GroupsOfNodesOf ; 
			  NameOfConstraint GlobalElectricCharge ; 
			}
			{ NameOfCoef GlobalElectricPotential ; EntityType GroupsOfNodesOf ; 
			  NameOfConstraint GlobalElectricPotential ; 
			}
		}
	}
}

Formulation{
	// first problem (Laplace equation with Dirichlet BC)
	{ Name for_v ; Type FemEquation ;
		Quantity { 
			{ Name v; Type Local ; NameOfSpace fs_vglob                          ; }
			{ Name Q; Type Global; NameOfSpace fs_vglob [GlobalElectricCharge]   ; }
			{ Name V; Type Global; NameOfSpace fs_vglob [GlobalElectricPotential]; }
		}
		Equation {
			Galerkin { [ epsr[]*Dof{Grad v} , {Grad v} ] ; In Vol; Jacobian Vol ; Integration Int ; }
			// div epsr[] grad v=0
			GlobalTerm { [ -Dof{Q}/1 , {V} ] ; In Grouped ; }
		}
	}
}

Resolution 
{
  {  Name all;System 
    {
        { Name A1 ; NameOfFormulation for_v ;}
    }
    Operation 
    { 
      Generate[A1] ; Solve[A1] ; SaveSolution[A1] ;
    }
  }
}

PostProcessing {
  { Name all ; NameOfFormulation for_v;  Quantity 
  {
    { Name v ; Value { Local { [ {v} ] ; In Vol ; Jacobian Vol; } } }
    { Name e ; Value { Local { [ -{Grad v} ] ; In Vol ; Jacobian Vol; } } }
    { Name ne ; Value { Local { [ Norm[{d v}] ] ; In Vol ; Jacobian Vol; } } }
    { Name Q ; Value { Term { [ {Q} ] ; In Grouped ; } } }
    { Name V ; Value { Term { [ {V} ] ; In Grouped ; } } }
    { Name C ; Value { Term { [ {Q}/{V} ] ; In Grouped; } } }
  }
  }
}


PostOperation{
  { Name all ; NameOfPostProcessing all; 
    Operation {
      Print[ v , OnElementsOf Vol , File "v.pos" ] ;
      Print[ e , OnElementsOf Vol , File "e.pos" ] ;
      Print[ ne , OnElementsOf Vol , File "ne.pos" ] ;
      Print[Q, OnRegion Grouped, File "Carga.txt", Format RegionTable];
      Print[V, OnRegion Grouped, File "Tensao.txt", Format RegionTable];
      Print[C, OnRegion Grouped, File "Capacitancia.txt", Format RegionTable];
    }
  }
}

