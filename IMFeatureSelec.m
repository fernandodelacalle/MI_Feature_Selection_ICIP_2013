%-------Feature selection using mutual information-------
%                Fernando de la Calle Silos
%             Universidad Carlos III de Madrid
%--------------------------------------------------------
function [IM, selecFeatures] = IMFeatureSelec(features, label)
    numFeatures = size(features,2);  
    selecFeatures = [];
    restFeatures = 1:numFeatures;   
    maxIM =  -1*ones(1,numFeatures+1);
    IM = zeros(numFeatures, numFeatures);
    X = [];
    endofselec = 0;  
    step = 1;   
    for i = 1:numFeatures
        features{i} = features{i}/norm(features{i});
        IM(i,step) = imcal(features{i},label);
    end
    step = step + 1; 
    for t = 1: numFeatures  
        [maxIM(step), maxFeature] = max(IM(:,t));
        if(maxIM(1:(step - 1)) < maxIM(step))
            if(endofselec==0)
                selecFeatures = [selecFeatures; maxFeature];
            end
        else
            endofselec=1;
        end       
        X = [X; features{maxFeature}];
        restFeatures(restFeatures == maxFeature) = [];
        for j = restFeatures   
            X_cont = [X; features{j}];
            IM(j,step) = imcal(X_cont,label);
        end
        step = step + 1;
    end  
    fprintf('-------Feature selection using mutual information-------\n');
    fprintf('                Fernando de la Calle Silos\n');
    fprintf('             Universidad Carlos III de Madrid\n') ;
    fprintf('--------------------------------------------------------\n\n')  
    fprintf('The selected features are: \n');
    fprintf('Feature %i \n',selecFeatures);
    fprintf('\n');
    fprintf('\t \t Mutual Information Table \n');
    fprintf('--------------------------------------------------------\n')
    for i = 1:(size(IM,1))
        if  sum(i == selecFeatures)   
            fprintf(2,'Feature %i',i);
        else
            fprintf('Feature %i',i);
        end
        fprintf('\t');
        for j = 1:(size(IM,2))
            if(IM(i,j) ~= 0)
                fprintf('%6.4f',IM(i,j));
            else
                fprintf('  ---  ');
            end
            fprintf('\t');  
        end
        fprintf('\n');   
    end    
end %function