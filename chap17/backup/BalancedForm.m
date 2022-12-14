function [A,B,C,HankelSingValues]=NR_BalancedForm(A,B,C,MODE)
% function [A,B,C,HankelSingValues]=NR_BalancedForm(A,B,C,[MODE])
% Compute a balanced realization of a Hurwitz state-space system, resulting in
% a system with equal and diagonal controllability and observability grammians with
% the Hankel singular values listed in decreasing order on the main diagonal of both.
% Works for MODE='CT' (default) or 'DT'.
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 20.6.2.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap20">Chapter 20</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.
% Verify with: <a href="matlab:help NR_BalancedFormTest">NR_BalancedFormTest</a>.

if nargin==3, MODE='CT'; end, P=NR_CtrbGrammian(A,B,MODE); Q=NR_ObsvGrammian(A,C,MODE);
n=length(A); GP=Cholesky(P,n); QP=Cholesky(Q,n); [U,HankelSingValues,V]=SVD(GP'*QP);
T=GP*U*diag(diag(HankelSingValues).^(-1/2)); Ti=pinv(T); A=Ti*A*T; B=Ti*B; C=C*T;
end % function NR_BalancedForm