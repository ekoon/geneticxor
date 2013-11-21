% Randomly picks A or B, mutates it in a batch according to varM
function [ Pop ] = Mutate( Pop, A, B, varM, Matcher, T , ProbTest )
%     disp('Mutate')    
    i = randi( size(Pop,2) -1 ) + 1 ;% Pick a random bit in the vector
    if rand(1) < 0.5
        Child = Pop(A,:);
        parentScore = A(1,1);
        pick = 1;
    else 
        Child = Pop(B,:);
        parentScore = B(1,1);
        pick = 2;
    end

    % The larger the variance, the wider the spread.
    for x=i:i+varM
        if x>size(Child,2)
            break;
        end
        r_num = rand(1)*3;
        Child(1,x) = r_num - (.5*r_num) + Child(1,x);
    end % End-of-For-Loop

    %score the child
    Child = Compare( Child, parentScore, Matcher, T, ProbTest );

    %replace child
    if pick==1
        if Child(1,1)<Pop(A,1)
            Pop(A,1)=Child(1,1);
        end
    else
        if Child(1,1)<Pop(B,1)
            Pop(B,1)=Child(1,1);
        end
    end
end % End-of-Function
