%Par1 parent 1
%Par2 parent 2
%numCross number of time to cross over.  if = -1, then randomly decide
function [Pop] = CrossOver(Pop, A, B, numCross, Matcher, T, ProbTest )
%     disp('CrossOver')        
    %initialize Crossover children
    X = Pop(A,:);
    Y = Pop(B,:);
    vecLength = size(X,2);

    if numCross == -1 
        %randomly decide number of crossovers
        %select at random 
        random = rand(1, vecLength );

        for i = 2:vecLength
            if random(i) < .5
                %Stay the same
                X(1,i) = Pop(A,i);
                Y(1,i) = Pop(B,i);
            else
                %CrossOver
                X(1,i) = Pop(B,i);
                Y(1,i) = Pop(A,i);
            end % if random
        end %i loop

    else
        %n number of crossovers            
        %select numCross number of random place to cross over, sort index
        randomCrossIndex = sort(randperm(vecLength, numCross)); 
        randomCrossIndex(numCross+1) = vecLength;
        start = 1; stop = randomCrossIndex(1); count = 1;
        while stop ~= vecLength
            stop = randomCrossIndex(count);
            for p = start:stop
                if mod(p,2)==0
                    X(1,p) = Pop(A,p);
                    Y(1,p) = Pop(B,p);
                else
                    X(1,p) = Pop(B,p);
                    Y(1,p) = Pop(A,p);
                end
            end
            start = stop+1;
            count = count +1;
        end % while loop
    end %if numCross

    % Not the best way of doing this. Compare should really return the best of two.
    parentScore = max( A(1,1), B(1,1) );

    X = Compare( X, parentScore, Matcher, T, ProbTest );
    Y = Compare( Y, parentScore, Matcher, T, ProbTest );

    if X(1,1)<Pop(A,1)
        Pop(A,1)=X(1,1);
    end
    if Y(1,1)<Pop(B,1)
        Pop(B,1)=X(1,1);
    end
end %function
