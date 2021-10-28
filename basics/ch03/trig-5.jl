# chapter 03 - Control Flow

# recursion based factorial function
function fac(n)
    if n > 2
        n*fac(n-1)
    elseif n > 0
        n
    elseif n == 0
        1
    else
        err = DomainError(n, "`n` must not be negative.")
        throw(err)
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
