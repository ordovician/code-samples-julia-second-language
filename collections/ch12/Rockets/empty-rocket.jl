export EmptyPayload, emptypayload

"An empty without any propellant, mass or thrust. Used to mark the end of a staged rocket"
struct EmptyPayload <: Rocket end
const emptypayload = EmptyPayload()

mass(::EmptyPayload) = 0.0
thrust(r::EmptyPayload) = 0
update!(r::EmptyPayload, t::Number, Δt::Number) = nothing