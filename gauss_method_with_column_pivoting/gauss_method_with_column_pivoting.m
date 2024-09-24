## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## -----------------------------------------                                                                                                -----------------------------------------
## -----------------------------------------                                Gauss method With Column Pivoting                               -----------------------------------------
## -----------------------------------------                                                                                                -----------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



clc;



% Matrix and results given
A = [1,3,0,9;3,9,1,3;6,3,1,3;2,5,2,7];
B = [2;-1;1;0];

function results = simple_gauss_method(A, B)
  results = "";
  orderUnknown = 1:size(A, 2);

  % Sort Columns
  for i = 1:size(A, 2)
    for j = i+1:size(A, 2)
      if A(i, j) > A(i, i)
        temp = A(i, :);
        A(i, :) = A(j, :);
        A(j, :) = temp;

        temp = B(i, :);
        B(i, :) = B(j, :);
        B(j, :) = temp;
      endif
    endfor
  endfor



  % Upper Triangular
  for i = 2:size(A, 1)
    for j = 1:i-1
      if A(i,j) != 0
        x = A(i,j);
        y = A(j,j);

        multiplier = x / y;

        A(i, :) = A(i, :) - multiplier * A(j, :);
        B(i) = B(i) - multiplier * B(j);
      endif
    endfor
  endfor


  % Find values ​​of the unknowns
  for i = size(A,1):-1:1
    if i == size(A,1)
      result = B(i)/A(i,i);
      for j = i:-1:1
        A(j,i);
        A(j,i) = A(j,i)*result;
      endfor

    else
      operation = 0;
      for j = i+1:size(A,1)
        operation = operation + (-1*A(i,j));
      endfor

      result = ((B(i)+operation)/A(i,i));
      for j = i:-1:1
        A(j,i);
        A(j,i) = A(j,i)*result;
      endfor
    endif

     position = orderUnknown(i);
    results = [results, sprintf("X%d = %f\n", position, result)];
  endfor
endfunction



results = simple_gauss_method(A, B);

disp(results);
