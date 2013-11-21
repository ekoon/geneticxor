function [Population] = ScoreSystem( Pop, Matcher, T, ProbTest )
%   disp('ScoreSystem')         
    Population = Pop;
    for i =1:size(Pop,1)
        Population(i,:) = Compare( Pop(i,:), 0, Matcher, T, ProbTest );
    end
    
    Population = sortrows( Population, 1 );
end
