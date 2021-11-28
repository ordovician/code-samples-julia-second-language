export FlexiTank

"Propellant tank with flexible size"
mutable struct FlexiTank <: Tank
    drymass::Float64
    totalmass::Float64
    propellant::Float64
    
    function FlexiTank(drymass::Number, totalmass::Number)
        new(drymass, totalmass, totalmass - drymass)
    end
end



# These weights are roughly based on the Electron rocket
drymass(tank::FlexiTank) = tank.drymass
totalmass(tank::FlexiTank) = tank.totalmass
