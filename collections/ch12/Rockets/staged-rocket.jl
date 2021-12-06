export StagedRocket

"""
A staged rocket is made up of multiple stages which are rockets themselves
"""
mutable struct StagedRocket <: Rocket
    nextstage::Rocket
    tank::Tank
    engine::Engine
end


function Rocket(payload::Rocket, tank::Tank, engine::Engine)
    StagedRocket(payload, tank, engine)
end

"""
    Rocket(tank, engine)
Create a single stage rocket
"""
function Rocket(tank::Tank, engine::Engine)
    StagedRocket(emptypayload, tank, engine)
end

"""
    mass(r::StagedRocket)
Total mass of all stages in a staged rocket
"""
function mass(r::StagedRocket)
    mass(r.nextstage) + mass(r.tank) + mass(r.engine)
end

"""
    update!(r::StagedRocket)
Consume propellant for current active stage (bottom stage and any active boosters).
"""
function update!(r::StagedRocket, t::Number, Δt::Number)
    mflow = mass_flow(thrust(r), Isp(r.engine))
	consume!(r.tank, mflow * Δt)
end

"""
    thrust(r::StagedRocket)
Total thrust of active rocket stage
"""
thrust(r::StagedRocket) = thrust(r.engine)
