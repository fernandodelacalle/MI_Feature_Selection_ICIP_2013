%-------Feature selection using mutual information-------
%                Fernando de la Calle Silos
%             Universidad Carlos III de Madrid
%--------------------------------------------------------

clc; clear all; close all;
% Load the features and the ground truth
load('data.mat');
% Call the main function
[IM, featureSelec] = IMFeatureSelec(features, label);