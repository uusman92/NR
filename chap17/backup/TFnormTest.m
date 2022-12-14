% script <a href="matlab:NR_TFnormTest">NR_TFnormTest</a>
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 20.2.2.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap20">Chapter 20</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.

clear; n=4; ni=1; no=1;
R=randn(n); S=randn(n); A=-R*R'+S-S'; B=randn(n,ni); C=randn(no,n);
disp('Continuous-time system:'), NR_ShowSys(A,B,C)
disp('NR_Eigenvalues of A (note: Hurwitz)'); disp(NR_Eig(A,'r')),
fprintf('2-norm   of CT transfer function: %g\n',NR_TFnorm(A,B,C,'2','CT'))
fprintf('inf-norm of CT transfer function: %g\n',NR_TFnorm(A,B,C,'inf','CT'))
sys=ss(A,B,C,0); norm(sys), norm(sys,'inf'), disp(' ')

F=randn(n); F=0.95*F/max(abs(NR_Eig(F,'r'))); G=randn(n,ni); H=randn(no,n);
disp('Discrete-time system:'), NR_ShowSys(F,G,H)
disp('NR_Eigenvalues of F (note: Hurwitz)'); disp(NR_Eig(F,'r')),
fprintf('2-norm   of DT transfer function: %g\n',NR_TFnorm(F,G,H,'2','DT'))
fprintf('inf-norm of DT transfer function: %g\n',NR_TFnorm(F,G,H,'inf','DT'))
sys=ss(F,G,H,0,0.1); norm(sys), norm(sys,'inf')

disp('Next <a href="matlab:help NRchap20">NRchap20</a> demo: <a href="matlab:NR_TF2MarkovTest">NR_TF2MarkovTest</a>'), disp(' ')
% end script NR_TFnormTest
