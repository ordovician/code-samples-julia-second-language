export Payload

struct Payload <: Rocket 
    mass::Float64
end

mass(payload::Payload) = payload.mass
thrust(r::Payload) = 0
update!(r::Payload, t::Number, Δt::Number) = nothing