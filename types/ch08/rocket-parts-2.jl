abstract type Payload end

struct Capsule <: Payload
	mass::Float64
end

struct SpaceProbe <: Payload
    mass::Float64
end

struct Satellite <: Payload
    mass::Float64
end

mutable struct Rocket <: Payload
    payload::Payload
    tank::Tank
    engine::Engine
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

thrust(engine::SingleEngine)   = engine.thrust
thrust(cluster::EngineCluster) = thrust(cluster.engine) * cluster.count

mass(engine::SingleEngine)  = engine.mass
mass(cluster::EngineCluster) = mass(cluster.engine) * cluster.count
mass(tank::Tank) = tank.dry_mass + tank.propellant
mass(probe::SpaceProbe) = probe.mass
mass(capsule::Capsule) = capsule.mass
mass(satellite::Satellite) = satellite.mass
mass(r::Rocket) = mass(r.payload) + mass(r.tank) + mass(r.engine)


Isp(engine::SingleEngine)   = engine.Isp
Isp(cluster::EngineCluster) = Isp(cluster.engine)

function update!(r::Rocket, Δt::Number)
    mflow = mass_flow(thrust(r.engine), Isp(r.engine))
    r.tank.propellant -= min(mflow * Δt, r.tank.propellant)
end
