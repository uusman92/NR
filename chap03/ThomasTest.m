% script <a href="matlab:NR_ThomasTest">NR_ThomasTest</a>
% Test <a href="matlab:help Thomas">Thomas</a> & <a href="matlab:help NR_ThomasLU">NR_ThomasLU</a> on a random tridiagonal matrix.
% Note that this test script is NOT efficient, and is meant for TESTING PURPOSES ONLY.
% Any production code leveraging the Thomas.m and NR_ThomasLU.m algorithms should not actually
% build the (sparse) A, L, and U matrices.
% Numerical Renaissance codebase, Chapter 2, https://github.com/tbewley/NR
% Copyright 2022 by Thomas Bewley, distributed under BSD 3-Clause License. 
% See also NR_ThomasTTTest, NR_CirculantTest, NR_ThomasParallelTest.

disp('Now testing Thomas & NR_ThomasLU on a random tridiagonal matrix.')
n=5; m=2;   % note that m is the number of RHS vectors
a=randn(n,1); b=randn(n,1); c=randn(n,1); G=randn(n,m); a(1)=0; c(n)=0;
A=diag(a(2:n),-1)+diag(b(1:n),0)+diag(c(1:n-1),1);
[X,amod,bmod,cmod]=Thomas(a,b,c,G,n);
A_times_X_from_Thomas=A*X, G, error=norm(A*X-G)

Gnew=randn(n,m);
[Xnew]=NR_ThomasLU(amod,bmod,cmod,Gnew,n);
A_times_Xnew_from_ThomasLU=A*Xnew, Gnew, error=norm(A*Xnew-Gnew)

L=eye(n);   for i=2:n, L(i,i-1)=-amod(i); end
U=zeros(n); for i=1:n, U(i,i)=bmod(i);  end, for i=1:n-1, U(i,i+1)=cmod(i); end
L, U, error=norm(A-L*U), disp(' ')

% end script NR_ThomasTest
