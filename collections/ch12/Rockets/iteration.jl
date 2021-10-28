import Base: iterate

iterate(payload::Payload) = payload, nothing
iterate(r::Rocket) = r, r.payload

iterate(::Union{Rocket, SpaceVehicle}, state) = state == nothing || state isa NoPayload ? nothing : iterate(state)

iterate(ship::SpaceVehicle) = iterate(ship.active_stage)

Base.IteratorSize(::SpaceVehicle) = Base.SizeUnknown()
Base.IteratorSize(::Payload)      = Base.SizeUnknown()

