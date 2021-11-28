export SmallTank, MediumTank, LargeTank

mutable struct SmallTank <: Tank
    propellant::Float64
end

mutable struct MediumTank <: Tank
    propellant::Float64
end

mutable struct LargeTank <: Tank
    propellant::Float64    
end

function SmallTank()
    refill!(SmallTank(0))
end

function MediumTank()
    refill!(MediumTank(0))
end

function LargeTank()
    refill!(LargeTank(0))
end

# These weights are roughly based on the Electron rocket
drymass(::SmallTank) = 40.0
drymass(::MediumTank) = 250.0
drymass(::LargeTank) = 950.0

totalmass(::SmallTank) = 410.0
totalmass(::MediumTank) = 2300.0
totalmass(::LargeTank) = 10200.0


