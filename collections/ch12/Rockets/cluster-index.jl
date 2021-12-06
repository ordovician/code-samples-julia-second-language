import Base: getindex, setindex!

function getindex(cluster::MixedCluster, i::Integer)
    cluster.engines[i]
end

function setindex!(cl::MixedCluster, egn::Engine, i::Integer)
    cl.engines[i] = egn
end

function getindex(cluster::UniformCluster, _)
    cluster.engine
end
