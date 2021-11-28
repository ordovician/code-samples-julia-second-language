export mass
export Engine, thrust, Isp, thrust
export Rocket, update!


"A rocket produce thrust by consuming propellant"
abstract type Rocket end


"Provides propulsion for a rocket"
abstract type Engine end


"""
    mass(r::Rocket)
Mass of given object including its subcomponents.
"""
function mass end

"""
    thrust(r::Rocket)
    thrust(e::Engine)
An engine produces thrust. A rocket will have the same thrust as the sum of the engines
attached to the rocket.
"""
function thrust end


"""
    update!(r::Rocket)
Consume propellant and update mass accordingly
"""
function update! end

"""
    Isp(e::Engine)
Specific Impulse for a rocket engine. Says something about the equivalent of the gas milage
of a rocket. An engine with higher Isp will be able to change the velocity of a rocket more
per unit of fuel, than an engine with lower Isp
"""
function Isp end
