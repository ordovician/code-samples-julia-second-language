struct Wagon
     cargo::Int
     next::Union{Wagon, Nothing}
end

cargo(w::Wagon) = w.cargo + cargo(w.next)
cargo(w) = 0
 