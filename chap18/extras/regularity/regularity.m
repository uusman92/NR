N=5; k=pi*[1:N]'; A=-diag(k.^2); B=[2./k]; X=NR_CALE(A,B*B'); S=svd(X); plot(S)
