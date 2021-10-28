import Base: popfirst!, pushfirst!

export update!

function update!(r::Rocket, Δt::Number)
    mflow = mass_flow(thrust(r.engine), Isp(r.engine))
    r.tank.propellant -= min(mflow * Δt, r.tank.propellant)
end


function stage_separate!(ship::SpaceVehicle)
	stage = ship.active_stage
	if stage isa Rocket
		ship.active_stage = stage.payload
		stage.payload = NoPayload() # Disconnect separated stage from rest of rocket
        stage
	else
		nothing
	end
end

popfirst!(ship::SpaceVehicle) = stage_separate!(ship) 

function pushfirst!(ship::SpaceVehicle, rockets...)
    for r in reverse(rockets)
        r.payload = ship.active_stage
        ship.active_stage = r
    end
    ship
end