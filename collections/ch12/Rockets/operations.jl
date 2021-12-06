export SpaceVehicle

import Base: popfirst!, pushfirst!

mutable struct SpaceVehicle
	activestage::Rocket
end

tail(r::StagedRocket) = r.nextstage
tail(r::Rocket) = nothing

function popfirst!(ship::SpaceVehicle)
    r = tail(ship.activestage)
    if r == nothing
        throw(throw(ArgumentError("no rocket stages left")))
    else
        discarded = ship.activestage
        discarded.nextstage = emptypayload
        ship.activestage = r
    end
    discarded
end

function pushfirst!(ship::SpaceVehicle, r::StagedRocket)
    r.nextstage = ship.activestage
    ship.activestage = r
    ship
end

