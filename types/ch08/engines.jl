export Curie, Rutherford, Merlin

struct Curie <: Engine end
struct Rutherford <: Engine end
struct Merlin <: Engine end


# Note: Only thrust is currently known about Curie engine, so the rest is
# speculation.
mass(::Curie) = 8
thrust(::Curie) = 120
Isp(::Curie) = 317

mass(::Rutherford) = 35
thrust(::Rutherford) = 25000
Isp(::Rutherford) = 311

mass(::Merlin) = 470
thrust(::Merlin) = 845e3
Isp(::Merlin) = 282
