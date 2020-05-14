clear Problem;
clear Options;
clear InitPop;

global history;

history = [];

% Problem definition
Problem.ObjFunction='styrene';

Problem.LB = [0;0;0;0;0;0;0;0];
Problem.UB = [100;100;100;100;100;100;100;100];

% Initial guess
InitPop(1).x=[54;66;86;8;29;51;32;15]; % x0
% InitPop(1).x=[100;83.24218750;96.825;0;0;43.825;38.0125;51.5125]; % xe

%Algorithm options
%Options.Size=40;
%Options.Size=1;
%Options.MaxIter=2000;
Options.MaxObj=1000;
%Options.SearchType=0;
%Options.LoadCache=0;

% Run the algorithm
[x,fx,RunData]=PSwarm(Problem, InitPop, Options);

bbe=RunData.ObjFunCounter
% deg=RunData.Degenerate

sol=x'
fx



% Write history file:
% dlmwrite('~/Desktop/history.txt',history,'\t')