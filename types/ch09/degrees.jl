import Base: *, -, +, /,
            convert, promote_rule,
            show

abstract type Angle end

struct Radian <: Angle
    radians::Float64
end

struct DMS <: Angle
    seconds::Int
end

Radian(dms::DMS) = Radian(deg2rad(dms.seconds/3600))
Degree(rad::Radian) = DMS(floor(Int, rad2deg(rad.radians) * 3600))

Degree(degrees::Integer) = Minute(degrees * 60)

function Degree(deg::Integer, min::Integer)
    Degree(deg) + Minute(min)
end

function Degree(deg::Integer, min::Integer, secs::Integer)
    Degree(deg, min) + Second(secs)
end

Minute(minutes::Integer) = DMS(minutes * 60)
Second(seconds::Integer) = DMS(seconds)

function degrees(dms::DMS)
    minutes = dms.seconds ÷ 60
    minutes ÷ 60
end

function minutes(dms::DMS)
    minutes = dms.seconds ÷ 60
    minutes % 60
end

seconds(dms::DMS) = dms.seconds % 60


const ° = Degree(1)
const rad = Radian(1)

convert(::Type{Radian},  dms::DMS)    = Radian(dms)
convert(::Type{DMS},     rad::Radian) = DMS(rad)

promote_rule(::Type{Radian}, ::Type{DMS}) = Radian

*(coeff::Number, dms::DMS) = DMS(coeff * dms.seconds)
*(dms::DMS, coeff::Number) = coeff * dms
/(dms::DMS, denom::Number) = DMS(dms.seconds/denom)

*(coeff::Number, rad::Radian) = Radian(coeff * rad.radians)
*(rad::Radian, coeff::Number) = coeff * rad
/(rad::Radian, denom::Number) = Radian(rad.radians/denom)

+(Θ::DMS, α::DMS) = DMS(Θ.seconds + α.seconds)
-(Θ::DMS, α::DMS) = DMS(Θ.seconds - α.seconds)
sin(dms::DMS) = sin(Radian(dms))
cos(dms::DMS) = cos(Radian(dms))

+(Θ::Radian, α::Radian) = Radian(Θ.radians + α.radians)
-(Θ::Radian, α::Radian) = Radian(Θ.radians - α.radians)
sin(rad::Radian) = Base.sin(rad.radians)
cos(rad::Radian) = Base.cos(rad.radians)

+(Θ::Angle, α::Angle) = +(promote(Θ, α)...)
-(Θ::Angle, α::Angle) = -(promote(Θ, α)...)


function show(io::IO, dms::DMS)
   print(io, degrees(dms), "° ", minutes(dms), "' ", seconds(dms), "''") 
end

function show(io::IO, rad::Radian)
   print(io, rad.radians, "rad") 
end