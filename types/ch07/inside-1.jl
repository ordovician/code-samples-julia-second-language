# chapter 07 - Type System
function inside(needle::Number, haystack::OrdinalRange)
    haystack.start <= needle <= haystack.stop
end

function inside(needle::Number, haystack::Array)
    sortedstack = sort(haystack)
    sortedstack[1] <= needle <= sortedstack[end]
end

function inside(needle::OrdinalRange, haystack::OrdinalRange)
    haystack.start <= needle.start && needle.stop <= haystack.stop
end
