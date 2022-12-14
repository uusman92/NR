% script <a href="matlab:NR_SSTransformTest">NR_SSTransformTest</a>
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 20.1.1.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap20">Chapter 20</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.

n=4; ni=1; no=1; A=randn(n); B=randn(n,ni); C=randn(no,n); D=randn(no,ni);
disp('Initial state-space form:'), NR_ShowSys(A,B,C,D)
disp('NR_Eigenvalues of A'); disp(NR_Eig(A,'r')), R=rand(n);
[A1,B1,C1]=NR_SSTransform(A,B,C,R);
disp('Transformed state-space form, taking A=inv(R)*A*R, B=inv(R)*B, C=C*R for random R:')
NR_ShowSys(A1,B1,C1,D)
disp('NR_Eigenvalues of the transformed A'); disp(NR_Eig(A1,'r'))

disp(' '); disp('Next <a href="matlab:help NRchap20">NRchap20</a> demo: <a href="matlab:NR_MatrixExponentialTest">NR_MatrixExponentialTest</a>'), disp(' ')
% end script NR_SSTransformTest
