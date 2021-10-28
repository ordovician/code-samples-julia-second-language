mutable struct Tank
   dry_mass::Float64
   total_mass::Float64
   propellant::Float64

   "Create a full tank"
   function Tank(dry_mass::Number, total_mass::Number)
      new(dry_mass, total_mass, total_mass - dry_mass)
   end
end

struct SpaceProbe
    mass::Float64
end

struct Satellite
    mass::Float64
end

struct Engine
    thrust::Float64  # Newton
    Isp::Float64     # Specific Impulse
    mass::Float64    # Kg
end


const g = 9.80665
function mass_flow(thrust::Number, Isp::Number)
    thrust / (Isp * g)
end

mutable struct Rocket
    payload::SpaceProbe
    tank::Tank
    engine::Engine
end
