"""
    launch!(rocket::Rocket, Δt::Real) -> Float64
Simulate a rocket launch with with time steps `Δt` return max altitude
and time it was achieved
"""
function launch!(rocket::Rocket, Δt::Real)
    g = 9.80665  # acceleration caused by gravity
    v = 0        # velocity
    h = 0        # altitude
    
    for t in 0:Δt:1000
        m = mass(rocket)
        F = thrust(rocket) - m*g

        remaining = update!(rocket, t, Δt)        

        # Any propellant and thrust left?
        if remaining == 0 || F <= 0
            return (t, h)
        end
        
        h += v*Δt
        a = F/m
        v += a*Δt
    end
end

