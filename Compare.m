% item = weights [err1 , w1in1, w1in2, w10, w2in1, w2in2, w20, w21]  (popsize, veclenth=7)
% Matcher = [   1 1 0;
%               1 0 1;
%               0 1 1;
%               0 0 0 ]
% 
% 1. Apply inputs, calculates update X vector. x1 is correct at this time, 
% but x2 was calculated with x1=0.
% 2. Update x1 and x2
% Apply same inputs second time, this time x2 is correct.
% Output x2


function [ item ] = Compare( item, parentScore, Matcher, T )
    % For each row of the truth table find the score for that 
	% item weight system
    
    weight = [ item(2), item(3), item(4), 0, 0 ; item(5), item(6), item(7), item(8), 0 ];
    %data = [ Matcher(1); Matcher(2); 1; X1; Matcher(3) ] 
%     disp(' ')
    err = zeros(1,4);
    for row = 1:4
        %x2=0, bias = 1
        data = [ Matcher(row,1); 0; 1; 0; 0 ];
        %plug into activation sigmoid function and place in separate cells
        cell_response = num2cell( Sigmoid( weight*data, parentScore, T ) );      %% REPLACE WHEN WE WANT TO TEST SIM_ANNEAL
        [X1(row), X2(row)] = cell_response{:};

        %x2=input2, bias = 1
        data = [ Matcher(row,1); Matcher(row,2); 1; X1(row); X2(row) ] ;
        %plug into activation sigmoid function and place in separate cells
        cell_response = num2cell( Sigmoid( weight*data, parentScore, T ) );      %% REPLACE WHEN WE WANT TO TEST SIM_ANNEAL
        [X1(row), X2(row)] = cell_response{:};    

        %calculate error
        err(row) = (X2(row)-Matcher(row,3));
        
        
%         disp([  ' err1 = ', num2str(err(row)), 9 ...
%                 ' Iin1 = ', num2str(Matcher(row,1)), 9 ...
%                 ' Iin2 = ', num2str(Matcher(row,2)), 9 ...
%                 ' X2out = ', num2str(X2(row))           ]);
    end%end row for loop
   
    err = err
 
    %LABEL THE BEST
    if err(1)<.5 && err(2)>.5 && err(3)>.5 && err(4)<.5
        disp('Best above')
    end
        
    %combine error rate
    Error = .25*abs(sum(err));
    
    item = [Error, item(2:end)];
end
