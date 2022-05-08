using Random

struct SubstitutionCipher <: Cipher
    mapping::Vector{Tuple{Char, Char}}

    function SubstitutionCipher(substitute)
        mapping   = collect(zip('A':'Z', collect(substitute)))
        new(mapping)
    end
end

function encrypt(cipher::SubstitutionCipher, ch::Char)
    i = findfirst(row->first(row) == ch, cipher.mapping)
    if isnothing(i)
       ch
    else
       cipher.mapping[i][2]
    end   
end

function decrypt(cipher::SubstitutionCipher, ch::Char)
    i = findfirst(row->last(row) == ch, cipher.mapping)
    if isnothing(i)
       ch
    else
       cipher.mapping[i][1]
    end 
end
