import Base: getindex, setindex!, get, delete!,
       length, iterate, 
       getproperty, setproperty!, 
       haskey, isempty,
       union, push!,
       copy

"Dictionary implemented as associative list for doing lookups with either key or value"
mutable struct OrdDict <: AbstractDict{Symbol,String}
    items::Vector{Pair{Symbol, String}}
end

"""
    OrdDict(pairs...)
Create an associative list, where you can lookup using either key or value.

# Example
```julia
julia> a = OrdDict(:Foo => "bar", :Egg => "spam")
OrdDict(Pair{Symbol,String}[:Foo=>"bar", :Egg=>"spam"])

julia> a[Foo]
"bar"

julia> a["bar"]
:Foo
```
"""
OrdDict(items...) = OrdDict(collect(items))

"""
    OrdDict()
Create an empty ordered dictionary where the keys are of type `Symbol` and the values of type `String`
"""    
OrdDict() = OrdDict(Pair{Symbol, String}[])

function getindex(a::OrdDict, key::Symbol)
    for item in a.items
        if first(item) == key
            return last(item)
        end
    end
    throw(KeyError(key))
end

# Reverse lookup. Lookup using value instead of key
function value_lookup(a::OrdDict, value::AbstractString)
    for item in a.items
        if last(item) == value
            return first(item)
        end
    end
    error("No pair where value $value exist")
end

getindex(a::OrdDict, key::AbstractString) = value_lookup(a, key)

function setindex!(a::OrdDict, value::AbstractString, key::Symbol)
    i = findfirst(x->first(x) == key, a.items)
    if i == nothing
        push!(a.items, key => value)
    else
        a.items[i] = key => value
    end
end

length(a::OrdDict)     = length(a.items)
isempty(a::OrdDict)    = isempty(a.items)
iterate(a::OrdDict)    = iterate(a.items)
iterate(a::OrdDict, i) = iterate(a.items, i)
copy(a::OrdDict)       = OrdDict(copy(a.items))

function get(a::OrdDict, key::Symbol, default::Symbol)
    i = findfirst(x->first(x) == key, a.items)
    if i == nothing
        default
    else
       last(a.items[i])
    end    
end

function delete!(a::OrdDict, key::Symbol) 
    i = findall(x->first(x) == key, a.items)
    deleteat!(a.items, i)
    a
end

function getproperty(a::OrdDict, key::Symbol)
    if key == :items
        getfield(a, :items)
    else
        a[key]
    end
end

function setproperty!(a::OrdDict, key::Symbol, value::AbstractString)
    if key == :items
        setfield!(a, :item, value)
    else
        a[key] = value
    end
end

function haskey(a::OrdDict, key::Symbol)
    i = findfirst(x->first(x) == key, a.items)
    return i != nothing
end

push!(a::OrdDict, x::Pair{Symbol, String})  = push!(a.items, x)
