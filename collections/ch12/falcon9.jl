include("Rockets/Rockets.jl")

merlin = Engine(845e3, 282, 470)
tank = Tank(4e3, 111.5e3)
r2 = Rocket(SpaceProbe(22e3), tank, merlin)
r1 = Rocket(r2, tank, EngineCluster(merlin, 9))
ship = SpaceVehicle(r1)

SpaceVehicle(
    Rocket(
        tank   = Tank(
            dry_mass = 4e3,
            total_mass =  111.5e3
        ), 
        engine = Engine(
            thrust = 845e3,
            Isp    = 282,
            mass   = 470
        )
    ),
    Rocket(
        payload = SpaceProbe(22e3),
        tank    = Tank(
            dry_mass = 23.1e3,
            total_mass = 418.8e3
        ),
        engine  = Engine(
            thrust = 31e3, 
            Isp    = 311,
            mass   = 52
        )
    )    
)