% script <a href="matlab:NR_ObsvMatrixTest">NR_ObsvMatrixTest</a>
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Sections 20.5.2.1 and 20.5.4.1.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap20">Chapter 20</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.

clear, N=4; Nob=2; Ni=2; No=2; Nnob=N-Nob;
A=[randn(Nob) zeros(Nob,Nnob); ...
   randn(Nnob,Nob) randn(Nnob)];
B=randn(N,Ni); C=[randn(No,Nob) zeros(No,Nnob)];
disp(sprintf('Initial continuous-time system with %d observable modes:',Nob))
NR_ShowSys(A,B,C)
[A,B,C]=NR_SSTransform(A,B,C,randn(N)); disp('Scramble this system:'), NR_ShowSys(A,B,C)
[OM,r]=NR_ObsvMatrix(A,C)

disp(' '); disp('Next <a href="matlab:help NRchap20">NRchap20</a> demo: <a href="matlab:NR_ObsvGramianTest">NR_ObsvGramianTest</a>'), disp(' ')
% end script NR_ObsvMatrixTest