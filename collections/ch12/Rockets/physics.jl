export g₀, mass_flow

const g₀ = 9.80665
mass_flow(thrust::Number, Isp::Number) = thrust / (Isp * g₀)
