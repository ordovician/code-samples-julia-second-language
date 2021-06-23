# chapter 03 - Control Flow

# recursion based factorial function
function fac(n)
    if n <= 2
        n
    else
        n*fac(n-1)
    end
end


# implement sine using our own factorial function
function sine(x)
    n = 5
    total = 0
    for i in 0:n
        total += (-1)^i*x^(2i+1)/fac(2i + 1)
    end
    total
end
