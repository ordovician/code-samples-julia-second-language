# chapter 03 - Control Flow
function fib(n)
    if n == 0
        0
    elseif n == 1
        1
    else
        fib(n-1) + fib(n-2)
    end
end
