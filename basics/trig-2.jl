# chapter 03 - Control Flow

# loop based factorial function
function fac(n)
    prod = 1
    while n >= 1
        prod *= n
        n -= 1
    end
    prod
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
