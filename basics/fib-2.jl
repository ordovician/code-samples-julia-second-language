# chapter 03 - Control Flow
function fib(n)
    if 0 <= n <= 1
        n
    else
        fib(n-1) + fib(n-2)
    end
end

# With early return (guard statement)
function fibi(n)
    if 0 <= n <= 1
        return n
    end

    prev = 0
    x    = 1
    for i in 2:n
        tmp = x
        x += prev
        prev = tmp
    end
    x
end
