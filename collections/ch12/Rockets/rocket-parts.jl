export  Engine, EngineCluster, Tank

# Rocket parts as defined at the end of "define your own types chapter"
mutable struct Tank
   dry_mass::Float64			# Mass excluding propellant
   total_mass::Float64			# Mass including propellant
   propellant::Float64          # Amount of propellant mass left

   "Create a full tank"
   function Tank(dry_mass::Number, total_mass::Number)
      new(dry_mass, total_mass, total_mass - dry_mass) 
   end
end

function Tank(;dry_mass::Number, total_mass::Number)
    Tank(dry_mass, total_mass)
end

abstract type Engine end

struct SingleEngine <: Engine
    thrust::Float64
    Isp::Float64
    mass::Float64
end

struct EngineCluster <: Engine
    engine::SingleEngine
    count::Int8
end

function Engine(thrust::Number, Isp::Number, mass::Number)
    SingleEngine(thrust, Isp, mass)
end

function Engine(;thrust::Number, Isp::Number, mass::Number = 0, count::Integer = 1)
    engine = Engine(thrust, Isp, mass)
    if count > 1
        EngineCluster(engine, count)
    elseif count < 1
        throw(DomainError(count, "the number of rocket engines must be a whole number ≥ 1"))
    else
        engine
    end
end
