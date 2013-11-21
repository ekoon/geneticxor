function [A, B, Rest, pick] = take2random( MatRef )
%     disp('take2random')
    pick = randperm(  size(MatRef,1)  );
    A = pick(1);
	B = pick(2);
	Rest = pick(3:end);
end