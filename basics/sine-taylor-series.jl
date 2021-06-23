# chapter 04 - Julia as a Spreadsheet
function sinus(x)
   n = 5
   taylor(i) = (-1)^i*x^(2i+1)/factorial(2i + 1)
   mapreduce(taylor, +, 0:n)
end
