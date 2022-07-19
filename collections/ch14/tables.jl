table = [2  6 12;
         3  4 12;
         6  2 12;
         12 1 12]
         
x₁ = [2, 3, 6, 12]
x₂ = [6, 4, 2, 1]
x₃ = [12, 12, 12, 12]
table = [x₁ x₂ x₃]


table = [[2, 3, 6, 12] [6, 4, 2, 1] [12, 12, 12, 12]]

eltype(table)
size(table)
ndims(table)

using LinearAlgebra

norm([3, 4])