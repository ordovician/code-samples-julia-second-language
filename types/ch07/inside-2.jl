# chapter 07 - Type System
function inside(needle::Number, haystack::AbstractArray)
    minimum(haystack) <= needle <= maximum(haystack)
end

function inside(needle::AbstractArray, haystack::AbstractArray)
    minimum(haystack) <= minimum(needle) && maximum(needle) <= maximum(haystack)
end
