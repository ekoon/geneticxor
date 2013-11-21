%Make a vector to reference the population 
function[PopReference] = MakingMatingPool(Pop, sigma)
    
%     disp('MakingMatingPool')
    %Using a gaussian distribution with the center at 0.
    %The value must be positive and an integer
    %This will create a large chance of selecting the best performers 
    %rather than the not so high in scoring population
    PopReference = ceil(abs((randn(size(Pop,1),1) * sqrt(sigma) )));
end