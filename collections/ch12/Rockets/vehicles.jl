export Payload, Rocket, NoPayload, Capsule, SpaceProbe, Sattelite, SpaceVehicle
        
abstract type Payload end

# New addition to support markign the end of an iteration
struct NoPayload <: Payload
end

struct Capsule <: Payload
	mass::Float64
end

struct SpaceProbe <: Payload
    mass::Float64
end

struct Sattelite <: Payload
    mass::Float64
end

mutable struct Rocket <: Payload
     payload::Payload
     tank::Tank
     engine::Engine
end

Rocket(tank::Tank, engine::Engine) = Rocket(NoPayload(), tank, engine)

Rocket(;payload::Payload = NoPayload(), tank::Tank, engine::Engine) = Rocket(payload, tank, engine)

mutable struct SpaceVehicle
    active_stage::Payload
end

function SpaceVehicle(rockets::Array{Rocket})
    ship = SpaceVehicle()
    pushfirst!(ship, rockets...)
    ship
end

SpaceVehicle() = SpaceVehicle(NoPayload())

SpaceVehicle(rockets...) = SpaceVehicle(collect(rockets))