% script <a href="matlab:NR_CirculantTest">NR_CirculantTest</a>
% Test <a href="matlab:help NR_Circulant">NR_Circulant</a> and <a href="matlab:help NR_CirculantLU">NR_CirculantLU</a> on a random circulant matrix.
% Note that this test script is NOT efficient, and is meant for TESTING PURPOSES ONLY.
% Any production code leveraging the NR_Circulant.m and NR_CirculantLU.m codes should not
% actually build the (sparse) A, L, and U matrices.
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 2.3.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap02">Chapter 2</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.
% See also NR_ThomasTest, NR_ThomasTTTest, NR_ThomasParallelTest.

disp('Now testing NR_Circulant & NR_CirculantLU on a random circulant matrix.')
n=6; m=1;  % note that m is the number of RHS vectors
a=randn(n,1); b=randn(n,1); c=randn(n,1); G=randn(n,m);
A=diag(a(2:n),-1)+diag(b(1:n),0)+diag(c(1:n-1),1); A(1,n)=a(1); A(n,1)=c(n);
[X,amod,bmod,cmod,dmod,emod]=NR_Circulant(a,b,c,G,n);
disp('Now testing NR_Circulant'), A, A*X, G, error=norm(A*X-G)

Gnew=randn(n,m);
[Xnew]=NR_CirculantLU(amod,bmod,cmod,dmod,emod,Gnew,n);
disp('Now testing NR_CirculantLU'), A*Xnew, Gnew, error=norm(A*Xnew-Gnew)

L=eye(n);   for i=2:n, L(i,i-1)=-amod(i); end
U=zeros(n); for i=1:n, U(i,i)=bmod(i);  end, for i=1:n-1, U(i,i+1)=cmod(i); end
L(n,1:n-2)=-emod(1:n-2);  U(1:n-1,n)=dmod(1:n-1);
disp('Now checking the LU decomposition'), L, U, error=norm(A-L*U), disp(' ')

% end script NR_CirculantTest
