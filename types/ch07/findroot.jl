# chapter 07 - Type System
function findroot(T)
    T2 = supertype(T)
    println(T)
    if T2 != T
        findroot(T2)
    end
end
