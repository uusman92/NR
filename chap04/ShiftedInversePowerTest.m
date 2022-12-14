% script <a href="matlab:NR_ShiftedInversePowerTest">NR_ShiftedInversePowerTest</a>
% Test <a href="matlab:help NR_ShiftedInversePower">NR_ShiftedInversePower</a> on a matrix with known eigenvalues.
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 4.4.5.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap04">Chapter 4</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.

disp('Now testing NR_ShiftedInversePower on a matrix with known eigenvalues.')
clear; n=4; lambda=randn(n,1), Lambda=diag(lambda); S=rand(n); A=S*Lambda*inv(S)
[Snew]=NR_ShiftedInversePower(A,lambda);  eig_error=norm(A*Snew-Snew*Lambda)
[Unew,Tnew]=NR_ShiftedInversePower(A,lambda);  schur_error=norm(A-Unew*Tnew*Unew'), disp(' ')

% end script NR_ShiftedInversePowerTest
