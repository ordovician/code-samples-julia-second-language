import Base: isempty

export Tank, drymass, totalmass, propellant, propellant!
export refill!, consume!
export mass

"Stores propellant for a rocket"
abstract type Tank end

"""
    totalmass(t::Tank) -> Float64
Mass of propellant tank `t` when it is full.
"""
function totalmass end

"""
    drymass(t::Tank) -> Float64
Mass of propellant tank `t` when it is empty.
"""
function drymass end

"""
    propellant(t::Tank)
Get remaining propellant in tank. Propellant is fuel plus oxidizer
"""
propellant(tank::Tank) = tank.propellant

"""
    propellant!(t::Tank, amount)
Set amount of propellant in tank to `amount`.
"""
function propellant!(tank::Tank, amount::Real)
    if 0 <= amount + drymass(tank) <= totalmass(tank)
        tank.propellant = amount
    else
        msg = "Propellant mass plus dry mass must be less than total mass"
        throw(DomainError(amount, msg))
    end
end

"""
    isempty(t::Tank)
Check if tank `t` is empty (has no propellant left).
""" 
isempty(tank::Tank) = tank.propellant <= 0

"""
    mass(t::Tank)
The total mass of tank `t`, dry mass plus propellant.
"""
mass(tank::Tank) = drymass(tank) + propellant(tank)

"""
    refill!(tank::Tank) -> Tank
Fill propellant tankt to the max. Returns full tank
"""
function refill!(tank::Tank)
    propellant!(tank, totalmass(tank) - drymass(tank))
    tank
end

"""
    consume!(t::Tank, a::Real)
Comsume `a` amount of propellant in tank `t`.
"""
function consume!(tank::Tank, amount::Real)        
    remaining = max(propellant(tank) - amount, 0)        
    propellant!(tank, remaining)
    remaining
end