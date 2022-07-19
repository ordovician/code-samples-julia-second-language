A = collect('A':'F')

A[begin+1]
A[end-1]
A[2:5]
A[begin+1:end-1]

A = [8, 1, 2, 7];

B = A[:];
B[2] = 42


B = @view A[3:end]
B[2] = 1331
