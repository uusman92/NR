% script <a href="matlab:NR_CAREtest">NR_CAREtest</a>
% Test <a href="matlab:help NR_CARE">NR_CARE</a> with random A and random Q>0, S>0.
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 4.5.2.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap04">Chapter 4</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.
% See also NR_CALEtest, NR_DALEtest, NR_DAREtest. 

disp('Now testing NR_CARE with random A and random Q>0, S>0.')
clear; n=40; Q=randn(n); Q=Q*Q'; S=randn(n); S=S*S'; A=randn(n);
X=NR_CARE(A,S,Q); error_NR_CARE=norm(A'*X+X*A-X*S*X+Q), disp(' ')

% end script NR_CAREtest
