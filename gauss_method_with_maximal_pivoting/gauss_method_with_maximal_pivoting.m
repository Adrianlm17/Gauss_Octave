## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## -----------------------------------------                                                                                                -----------------------------------------
## -----------------------------------------                               Gauss method With Maximal Pivoting                               -----------------------------------------
## -----------------------------------------                                                                                                -----------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



clc;



% Matrix and results given
A = [1,3,0;2,1,-1;2,4,-1];
B = [4;0;2];

function results = simple_gauss_method(A, B)
  results = "";
  orderUnknown = 1:size(A, 2);

  % Sort Columns
  for i = 1:size(A, 2)
    for j = i+1:size(A, 2)
      if A(1, j) > A(1, i)
        temp = A(:, i);
        A(:, i) = A(:, j);
        A(:, j) = temp;
        tempOrder = orderUnknown(i);
        orderUnknown(i) = orderUnknown(j);
        orderUnknown(j) = tempOrder;
      endif
    endfor
  endfor


  % Sort Rows
  for i = 1:size(A, 1)
    for j = i+1:size(A, 1)
      if A(i, 1) > A(j, 1)
        tempRow = A(i, :);
        A(i, :) = A(j, :);
        A(j, :) = tempRow;
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
