import Base: iterate, length

export Cluster

"A collection of multiple engines attached to a rocket"
abstract type Cluster <: Engine end

mass(cl::Cluster) = sum(mass, cl)
thrust(cl::Cluster) = sum(thrust, cl)

struct UniformCluster <: Cluster
    engine::Engine
    count::Int
end

struct MixedCluster <: Cluster
   engines::Vector{Engine} 
end

"""
    Cluster(e::Engine, n::Integer)
Create a homogenous cluster of `n` engine of type `e`.
"""
function Cluster(engine::Engine, count::Integer)
    UniformCluster(engine, count)
end

"""
    Cluster(engines::Engine...)
Create a cluster of at least one engine.
"""
function Cluster(engine::Engine, engines::Engine...)
    sametype(e) = (typeof(engine) == typeof(e))
    if all(sametype, engines)
        UniformCluster(engine, length(engines) + 1)
    else
        MixedCluster([engine, engines...])
    end
end


function iterate(cluster::UniformCluster)
    cluster.engine, 2
end

function iterate(cluster::UniformCluster, i::Integer)
    if i > cluster.count
        nothing
    else
        cluster.engine, i+1
    end
end

function iterate(cluster::MixedCluster)
    cluster.engines[1], 2
end

function iterate(cluster::MixedCluster, i::Integer)
    if i > length(cluster.engines)
        nothing
    else
        cluster.engines[i], i+1
    end
end

length(cluster::UniformCluster) = cluster.count
length(cluster::MixedCluster) = length(cluster.engines)


Isp(cl::UniformCluster) = Isp(cl.engine)
Isp(cl::MixedCluster) = sum(Isp, cl)/length(cl)
