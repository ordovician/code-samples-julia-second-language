export load_engines

function load_engines(path::AbstractString)
    rocket_engines = Dict{String, Engine}()

    rows = readlines(path)
    for row in rows[2:end]
        cols = split(row, ',')

        if any(isempty, cols)
            continue
        end

        name, company = cols[1:2]
        mass, thrust, Isp = map(cols[3:end]) do col
            parse(Float64, col)
        end

        engine = CustomEngine(
                    mass * 1000,   # from tons to kg
                    Isp,
                    thrust * 1000) # kN to Newton
        rocket_engines[name] = engine
    end

    rocket_engines
end