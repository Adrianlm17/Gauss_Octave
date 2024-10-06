## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## -----------------------------------------                                                                                                -----------------------------------------
## -----------------------------------------                                Gauss method With Column Pivoting                               -----------------------------------------
## -----------------------------------------                                                                                                -----------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



clc;



y = 0.3000;
z = 27;
s = 2307;
t = 12983;
x = 0.0001;

A=[x^4, x^3, x^2, x^1, 1; y^4, y^3, y^2, y^1, 1; z^4, z^3, z^2, z^1, 1; s^4, s^3, s^2, s^1, 1; t^4, t^3, t^2, t^1, 1];

A = (A');
b = [1;2;3;4;5];



function [results, A, b]=gauss_method_with_column_pivoting(A,b)
  results = "";
  [n,m]=size(b);
  for j=1:n-1
    mx = j;
    for i = j +1 : n
      if abs(A(i,j)) > abs(A(mx,j))
        mx = i;
      endif
    endfor
    for k = j : n
      aux = A(j,k);
      A(j,k) = A(mx,k);
      A(mx,k) = aux;
    endfor

    aux = b(j,1);
    b(j,1) = b(mx,1);
    b(mx,1) = aux;
    for i=j+1:n
      m=A(i,j)/A(j,j);
      A(i,j)=0;

      for k=j+1:n
        A(i,k)=A(i,k)-m*A(j,k);
      endfor
      b(i,1)=b(i,1)-m*b(j,1);
    endfor
  endfor



  for i = size(A,1):-1:1
    if i == size(A,1)
      result = b(i)/A(i,i);
      for j = i:-1:1
        A(j,i);
        A(j,i) = A(j,i)*result;
      endfor

    else
      operation = 0;
      for j = i+1:size(A,1)
        operation = operation + (-1*A(i,j));
      endfor

      result = ((b(i)+operation)/A(i,i));
      for j = i:-1:1
        A(j,i);
        A(j,i) = A(j,i)*result;
      endfor
    endif

    results = [results, sprintf("X%d = %.15e\n", i, result)];
  endfor

endfunction


[results, A, b] = gauss_method_with_column_pivoting(A,b);

disp('Matrix A after elimination:');
disp(A);
disp('Vector B after removal:');
disp(b);
disp('Result of the unknowns:');
disp(results);

