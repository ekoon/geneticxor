function [Population] = ScoreSystem( Pop, Matcher, T )
%   disp('ScoreSystem')         
    Population = Pop;
    for i =1:size(Pop,1)
        Population(i,:) = Compare( Pop(i,:), 0, Matcher, T );
    end
    
    Population = sortrows( Population, 1 );
end
