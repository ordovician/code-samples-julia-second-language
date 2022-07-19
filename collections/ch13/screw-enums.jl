@enum HeadType rounded flat headless tslot
@enum DriveStyle hex phillips slotted torx
@enum Material aluminium brass steel plastic wood

struct Screw
    prodnum::Int
    headtype::HeadType
    drivestyle::DriveStyle
    material::Material
end

screws = map(100:150) do prodnum
    headtype = rand(instances(HeadType))
    drivestyle = rand(instances(DriveStyle))
    material = rand(instances(Material))
    
    Screw(prodnum, headtype, drivestyle, material)     
end


roundedwood = filter(screws) do screw
    screw.headtype == rounded &&
    screw.material == wood
end

nonplastic = filter(screws) do screw
    screw.headtype == tslot &&
    screw.material != plastic
end


psteel = filter(screws) do screw
    screw.drivestyle == phillips && screw.material == steel
end

steel_screws = Set(filter(screws) do screw
    screw.material == steel
end)

hex_screws = Set(filter(screws) do screw
    screw.drivestyle == hex
end)

screwdict = Dict(screw.prodnum => screw for screw in screws)

prodnums = keys(screwdict)

brass_screws = Set(filter(prodnums) do prodnum
    screw = screwdict[prodnum]
    screw.material == brass
end)

torx_screws = Set(filter(prodnums) do prodnum
    screw = screwdict[prodnum]
    screw.drivestyle == torx
end)