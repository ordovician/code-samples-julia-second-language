using Random

alphabet = join('A':'Z')
substitute = join(shuffle('A':'Z'))
mapping = collect(zip(alphabet, substitute))

function substitution_encrypt(ch::Char, mapping::Vector)
    i = findfirst(row->first(row) == ch, mapping)
    if isnothing(i)
       ch
    else
       mapping[i][2]
    end    
end

function substitution_decrypt(ch::Char, mapping::Vector)
    i = findfirst(row->last(row) == ch, mapping)
    if isnothing(i)
       ch
    else
       mapping[i][1]
    end 
end

# Implement a functional interface using partial application
function substitution_encrypt(mapping::Vector)
    msg -> map(msg) do ch
        substitution_encrypt(ch, mapping)
    end
end

function substitution_decrypt(mapping::Vector)
    msg -> map(msg) do ch
        substitution_decrypt(ch, mapping)
    end
end

function substitution_encrypt(msg::AbstractString, mapping::Vector)
   msg |> substitution_encrypt(mapping) 
end

function substitution_decrypt(msg::AbstractString, mapping::Vector)
   msg |> substitution_decrypt(mapping) 
end
