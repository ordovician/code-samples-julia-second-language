# Origial definition (reused for functional approach)
const n = length('A':'Z')

function caesar_encrypt(ch::Char, shift::Integer)
    if ch in 'A':'Z'
        'A' + mod((ch - 'A') + shift, n)
    else
        ch
    end
end

function caesar_decrypt(ch::Char, shift::Integer)
    if ch in 'A':'Z'
        'A' + mod((ch - 'A') - shift, n)
    else
        ch
    end
end

# Implement a functional interface using partial application
function caesar_encrypt(shift::Integer)
    msg -> map(msg) do ch
        caesar_encrypt(ch, shift)
    end
end

function caesar_decrypt(shift::Integer)
    msg -> map(msg) do ch
        caesar_decrypt(ch, shift)
    end
end

function caesar_encrypt(msg::AbstractString, shift::Integer)
   msg |> caesar_encrypt(shift) 
end

function caesar_decrypt(msg::AbstractString, shift::Integer)
   msg |> caesar_decrypt(shift) 
end