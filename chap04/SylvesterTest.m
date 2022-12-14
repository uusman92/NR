% script <a href="matlab:NR_SylvesterTest">NR_SylvesterTest</a>
% Test <a href="matlab:help NR_Sylvester">NR_Sylvester</a> with random A and B and C.
% See <a href="matlab:web('http://numerical-renaissance.com')">Numerical Renaissance: simulation, optimization, & control</a>, Section 4.5.1.1.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap04">Chapter 4</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.

disp('Now testing NR_Sylvester with random A and B and C.')
m=4, n=5, A=rand(m,m); B=rand(n,n); C=rand(m,n);
g=1; X=NR_Sylvester(A,B,C,g,m,n), norm(A*X-X*B-g*C), disp(' ')

% end script NR_SylvesterTest
