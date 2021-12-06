# chapter 07 - Type System
export Warrior
export Archer, Knight, Pikeman

export battle!, attack!, resupply!, shoot!, mount!, dismount!

abstract type Warrior end

mutable struct Archer <: Warrior
    name::String
    health::Int
    arrows::Int
end

mutable struct Pikeman <: Warrior
    name::String
    health::Int
end

mutable struct Knight <: Warrior
    name::String
    health::Int
    mounted::Bool
end

function Knight(name::AbstractString, health::Integer)
   Knight(name, health, true) 
end

function Archer(name::AbstractString, health::Integer)
    archer = Archer(name, health, 0)
    resupply!(archer)
    archer
end

"""
    shoot(a::Archer)
Shoot an arrow. Deplete nubmer of arrows in quiver.
"""
function shoot!(archer::Archer)
    if archer.arrows > 0
        archer.arrows -= 1
    end
    archer
end

"""
    resupply!(a::Archer)
Ressuply archer `a` with arrows.
"""
function resupply!(archer::Archer)
    archer.arrows = 24
    archer
end

function mount!(knight::Knight)
    knight.mounted = true
    knight
end

function dismount!(k::Knight)
    knight.mounted = false
    knight
end

"""
    battle!(a::Warrior, b::Warrior)
Display the outcome of warrior `a` attacking warrior `b`
"""
function battle!(a::Warrior, b::Warrior)
    attack!(a, b)
    if a.health == 0 && b.health == 0
        println(a.name, " and ", b.name, " destroyed each other")
    elseif a.health == 0
        println(b.name, " defeated ", a.name)
    elseif b.health == 0
        println(a.name, " defeated ", b.name)
    else
        println(b.name, " survived attack from ", a.name)
    end
end

"""
    attack!(a::Archer, b::Archer)
Archers can do a fair amount of damage on other archers as 
the archers don't have good armor to protect them.
"""
function attack!(a::Archer, b::Archer)
    if a.arrows > 0
        shoot!(a)
        damage = 6 + rand(1:6)
        b.health = max(b.health - damage, 0)
    end
    a.health, b.health
end

"""
    attack!(a::Archer, b::Knight)
Archers can do some damage to a knight when when he is mounted
because the horse is vulnurable. Hurting dismounted knights is harder
as most arrows cannot pierce plate armor.
"""
function attack!(a::Archer, b::Knight)
    if a.arrows > 0
        shoot!(a)
        damage = rand(1:6)
        if b.mounted
            damage += 3
        end
        b.health = max(b.health - damage, 0)
    end
    a.health, b.health
end

"""
    attack!(a::Knight, b::Knight)
Knights vs knights is evenly matched and both have a fairly good chance of
disengaging so casualties are not that high.
"""
function attack!(a::Knight, b::Knight)
    a.health = max(a.health - rand(1:6), 0)
    b.health = max(b.health - rand(1:6), 0)
    a.health, b.health
end

"""
    attack!(a::Archer, b::Pikeman)
Because pikemen move slowly they cannot easily get away from the rain of
arrows and thus take significant damage.
"""
function attack!(a::Archer, b::Pikeman)
    if a.arrows > 0
        shoot!(a)
        damage = 4 + rand(1:6)
        b.health = max(b.health - damage, 0)
    end
    a.health, b.health
end


"""
    attack!(a::Pikeman, b::Archer)
It is hard for pikemen to attack archers are they move slowly. Thus
only when lucky do they succeed in causing some injury.
"""
function attack!(a::Pikeman, b::Archer)
   if rand(1:6) >= 5
       b.health = max(b.health - 2, 0)
   end
   a.health, b.health
end

"""
    attack!(a::Pikeman, b::Pikeman)
Pikemen vs pikemen attacks were generally avoided as 
they tended to get  brutal and with heavy causualties. 
It is hard to escape such a close encounter once it begins.
"""
function attack!(a::Pikeman, b::Pikeman)
    for _ in 1:3 
        a.health = max(a.health - rand(1:6), 0)        
        b.health = max(b.health - rand(1:6), 0)
        
        if a.health > 0 && b.health > 0
            break
        end
    end
    a.health, b.health
end

"""
    attack!(a::Pikeman, b::Knight)
Due to the superior mobility of knights, a pikeman cannot easily engage a
knight which does not choose to attack, unless the knight is dismounted.
"""
function attack!(a::Pikeman, b::Knight)
    if rand(1:6) >= 6
        damage = 1
        if b.mounted
            damage += rand(1:6)
        end
        b.health = max(b.health - damage, 0)
    end
    a.health, b.health
end

"""
    attack!(a::Knight, b::Archer)
Archers attacked by knights would suffer heavy losses as they have poor
armor.
"""
function attack!(a::Knight, b::Archer)
    damage = 8 + 2*rand(1:6)
    b.health = max(b.health - damage, 0)
    a.health, b.health  
end

"""
    attack!(a::Knight, b::Pikeman)
Mounted knights attacking pikemen will usually suffer heavy losses
unless attacking on a flank or the rear. Unmounted knights are more
effective as pikemen cannot attack their vulnurable horses.
"""
function attack!(a::Knight, b::Pikeman)
    damage = rand(1:6)
    b.health = max(b.health - damage, 0)
    
    damage = rand(1:6)
    if a.mounted
        damage += 2*rand(1:6)
    end
    a.health = max(b.health - damage, 0)
    
    a.health, b.health
end
