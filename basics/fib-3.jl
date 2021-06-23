# chapter 03 - Control Flow
function fib(n)
    if 0 <= n <= 1
        n
    else
        fib(n-1) + fib(n-2)
    end
end

# Without early return. Notice deep indentation.
function fibi(n)
    if 0 <= n <= 1
        n
    else
        prev = 0
        x    = 1
        for i in 2:n
            tmp = x
            x += prev
            prev = tmp
        end
        x
    end
end
