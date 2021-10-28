# chapter 07 - Type System
function inside(needle, haystack::AbstractArray)
    minimum(haystack) <= minimum(needle) && maximum(needle) <= maximum(haystack)
end
