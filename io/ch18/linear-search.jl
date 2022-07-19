function linearsearch(haystack::AbstractVector{T}, needle::T) where T
   for (i, x) in enumerate(haystack)
       if needle == x
           return  i
       end
   end
   nothing
end