# chapter 05 - Working with Text
n = length("-0.966")

function format(x)
    x = round(x, digits=3)
    if x < 0        
        rpad(x, n, '0')
    else
        rpad(x, n-1, '0')
    end
end

# chapter 04 - Julia as a Spreadsheet
function print_trigtable(inc, maxangle)
    print("│ ")
    printstyled("θ  ", color=:cyan)
    print(" │ ")
    printstyled(rpad("cos", n), 
                color=:cyan)
    print(" │ ")
    printstyled(rpad("sin", n), 
                color=:cyan)
    println(" │")
    angle = 0
    while angle <= maxangle
        rad = deg2rad(angle)        
        cosx = format(cos(rad))
        sinx = format(sin(rad))
        print("│ ")
        print(lpad(angle, 3), " │ ", 
              lpad(cosx, 6),  " │ ", 
              lpad(sinx, 6))
        println(" │")
        angle += inc
    end
end

function store_trigtable(io, inc, maxangle)
    println(io, "angle,cos,sin")
    angle = 0
    while angle <= maxangle
        rad = deg2rad(angle)        
        cosx = round(cos(rad), digits=3)
        sinx = round(sin(rad), digits=3)
        println(io, angle, ",", 
                    cosx,  ",", 
                    sinx)
        angle += inc
    end    
end
