export CustomEngine

struct CustomEngine <: Engine
    mass::Float64
    thrust::Float64
    Isp::Float64
end

mass(engine::CustomEngine) = engine.mass
thrust(engine::CustomEngine) = engine.thrust
Isp(engine::CustomEngine) = engine.Isp


