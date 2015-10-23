%-------Feature selection using mutual information-------
%                Fernando de la Calle Silos
%             Universidad Carlos III de Madrid
%--------------------------------------------------------
function [ im ] = imcal(f,l)
    cd('MutualInformationICA/');
    im = MIxnyn(f,l);
    cd('..');
end

