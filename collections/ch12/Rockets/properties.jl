export thrust, Isp, mass

thrust(engine::SingleEngine)   = engine.thrust
thrust(cluster::EngineCluster)  = thrust(cluster.engine) * cluster.count

mass(engine::SingleEngine)  = engine.mass
mass(cluster::EngineCluster) = mass(cluster.engine) * cluster.count

Isp(engine::SingleEngine)   = engine.Isp
Isp(cluster::EngineCluster)  = Isp(cluster.engine)

mass(tank::Tank) = tank.dry_mass + tank.propellant
mass(payload::NoPayload) = 0.0
mass(probe::SpaceProbe) = probe.mass
mass(capsule::Capsule) = capsule.mass
mass(satellite::Sattelite) = satellite.mass

function mass(r::Rocket)
    mass(r.payload) + mass(r.tank) + mass(r.engine)
end