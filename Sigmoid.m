%Sigmoid function, note it does not use the parent's Score or the global temp.
function [ Prob ] = Sigmoid( childScore, parentScore, temp )  
    Prob =  1  / ( 1 + exp( -childScore ) );
end