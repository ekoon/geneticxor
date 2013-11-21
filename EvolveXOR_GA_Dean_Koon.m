% input1 = [1;1;0;0];
% input2 = [1;0;1;0];
% target = [0;1;1;0];

function[] = EvolveXOR_GA_Dean_Koon( PopSize )
    %random generate weights in the form of
    %weight = PopSize x [w1_in1 w1_in2 w1_0 0 0 ; w2_in1 w2_in2 w2_0 w2_1 0 ];
    %weight= [w1in1, w1in2, w10, w2in1, w2in2, w20, w21]  (popsize x veclenth=7)
    %veclength set to 8 so an extra space for holding score at PopSize(1,:)
    %Pop = weights = from -3 to 3 uniformal distribution
    if mod(PopSize,2)==1
        disp('population size cannot be an odd number, PopSize increased by 1');
        PopSize=PopSize+1;
    end
    Pop = randi( 6, PopSize, 8)-3;
    
    %assume
    sigma=3; varM=1; numCross=-1; chanceCross=.8; chanceMutate=.8; threshold=.01;
    Matcher = [ 1 1 0; 1 0 1; 0 1 1; 0 0 0]; 
    ProbTest = @Sigmoid; 

    [ X, Generations, Best, bestError ] = ...
        GA( ProbTest, Pop, sigma, varM, numCross, chanceCross, chanceMutate, threshold, Matcher );
    
    
    
    %Display Best weight
    %format into [w1_in1 w1_in2 w1_0 0 0 ; w2_in1 w2_in2 w2_0 w2_1 0 ];
    weight = [Best(1), Best(2), Best(3), 0, 0; Best(4), Best(5), Best(6), Best(7), 0]
    bestError
    
    %plot the Performance
    figure;
    plot(X);
    title('Performance vs Generation of XOR-GA');
    ylabel('Error');
    xlabel('Generation');
    
end
