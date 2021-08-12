# chapter 05 - Working with Text
function practice(n)
    correct = 0
    for i in 1:n
        x = rand(2:9)
        y = rand(2:9)
        print(x, " * ", y, " = ")
        answer = readline(stdin)
        z = parse(Int, answer)
        if z == x*y
            correct += 1
        else
            printstyled("Wrong, it is ", x*y, color = :red) 
            println()
        end
    end
    println("Correct: ", correct, " of ", n)
end