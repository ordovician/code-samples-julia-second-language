# chapter 05 - Working with Text
pizzas = [
   ("hawaiian", 'S', 10.5),
   ("mexicana", 'S', 13.0),
   ("hawaiian", 'L', 16.5),
   ("bbq chicken", 'L', 20.75),
   ("sicilian", 'S', 12.25),
   ("bbq chicken", 'M', 16.75),
   ("mexicana", 'M', 16.0),
   ("thai chicken", 'L', 20.75),
 ]
 
name(pizza)    = pizza[1]
portion(pizza) = pizza[2]
price(pizza)   = pizza[3]

issmall(pizza)  = portion(pizza) == 'S'
islarge(pizza)  = portion(pizza) == 'L'
isbbq(pizza)    = name(pizza) == "bbq chicken"
       
function print_pizzatable(pizzas)
    print("│ ")
    printstyled(rpad("name", 12), color=:cyan)
    print(" │ ")
    printstyled("size", color=:cyan)
    print(" │ ")
    printstyled(rpad("price", 5), color=:cyan)
    println(" │")
    
    for pz in pizzas
         print("│ ",  rpad(name(pz), 12))
         print(" │ ", rpad(portion(pz), 4), " │ ")
         println(lpad(price(pz), 5), " │")
    end
end

function store_pizzatable(io, pizzas)
    println(io, "name,size,price")
    
    for pz in pizzas
        println(io, name(pz), ",", 
                portion(pz), ",", 
                price(pz))
    end
end

function simple_pizzatable(pizzas)
    pname  = rpad("name", 12)
    psize  = rpad("size", 4)
    pprice = lpad("price", 5)
        
    printstyled(pname, " ",  psize, " ", pprice, color=:cyan)
    println()
    
    for pz in pizzas
        pname  = rpad(name(pz), 12)
        psize  = rpad(portion(pz), 4)
        pprice = lpad(price(pz), 5)
        println(pname, " ", psize, " ", pprice)
    end       
end

function load_pizzatable(io)
    pizzas = []
    readline(io)
    while !eof(io)
      pz = split(readline(io), ',')
      pr = parse(Float64, price(pz))
      sz = portion(pz)
      push!(pizzas, (name(pz), sz[1], pr))
    end 
    pizzas
end
