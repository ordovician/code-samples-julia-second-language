function snake_case(s::AbstractString)
    words = String[]
    i = 1
    for j in findall(isuppercase, s)
       push!(words, lowercase(s[i:j-1]))
       i = j
    end
    push!(words, lowercase(s[i:end]))
    join(words, '_')
end
