## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## -----------------------------------------                                                                                                -----------------------------------------
## -----------------------------------------                                Gauss method With Column Pivoting                               -----------------------------------------
## -----------------------------------------                                                                                                -----------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



clc;



A = [1,3,0;2,1,-1;2,4,-1];
b = [4;0;2];



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

    results = [results, sprintf("X%d = %f\n", i, result)];
  endfor

endfunction


[results, A, b] = gauss_method_with_column_pivoting(A,b);

disp('Matrix A after elimination:');
disp(A);
disp('Vector B after removal:');
disp(b);
disp('Result of the unknowns:');
disp(results);

