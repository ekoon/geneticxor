%In simulated annealing, if the child is better, replace parent
%If the child is NOT better, still replace parent with child with a certain probability P(t,R,S):
%P(t,R,S)= exp((Quality(R)-Quality(S))/t) 

% Recall, R is worse than S
% First, t ? 0
% (Quality(R) � Quality(S)) is negative
% If R is much worse than S, the fraction is larger, and the probability is close to 0
% If R is very close to S, the probability is close to 1 and we will select R with reasonable probability
% t is selectable, t close to 0, fraction is large and the probability is close to 0
% If t is large, probability is close to 1

% R(child) = 5, S(parent) = 8, t = 2
% P(t,R,S) = exp((R-S)/t) =0.2231
% Raise t, t=8
% P(t,R,S) = exp((R-S)/t)  = 0.6873
% ? The probability of replace S with R increases when t increases
% ? Initially set t high causing the algorithm to move to the newly created solution even if it is worse than the current position (random walk)
% ? Slowly decrease t as the algorithm proceeds, eventually to zero (then it�s simple Hill climbing)

function [ probability ] = SimAnnealing( childScore, parentScore, temp )
    probability = exp( -(childScore - parentScore) / temp );
end