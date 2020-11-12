a = 1

for i = -3000:50:-100
    modelSub = changeRxnBounds(modelSub,'EX_o2(e)',i,'l');
    FBAsolution = optimizeCbModel(modelSub,'max');
    g(a) = FBAsolution.f;
    gly(:,a) = FBAsolution.x(l1);
    oxpho(:,a) = FBAsolution.x(l2);
    cit(:,a) = FBAsolution.x(l3);
    ppp(:,a) = FBAsolution.x(l4);
    glu(:,a) = FBAsolution.x(l5);
    glut(:,a) = FBAsolution.x(l6);
    %atp_p(a) = FBAsolution.x(224); % atp production rxn
    a = a + 1;
	%k(j) = FBAsolution.f; for model total flux value.
end

%{
Create matrix storage for reaction fluxes of each pathway.

NOTES:			
ID list		Name list					matrix of R_names	Matrix of Rxn flux
l1 = 		Glycolysis reactions		gly_n				gly	
l2 = 		Oxphos reactions			oxpho_n				oxpho	
l3 = 		Citric acid cycle			cit_n				cit	
l4 = 		ppp reactions				ppp_n				ppp	
l5 = 		glucose uptake				glu_n				glu						
l6 = 		exchange of glutamine		glut_n				glut					
%}
