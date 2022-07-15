# Working with ToyRocket Project

You may be downloading the ToyRockets package from GitHub which would then conflict with the ToyRockets package defined here. As solution is to activate an environment in this director. Just go into the ch17 subdirectory and do the
following:

    $ julia
    julia> ]
    (@v1.7) pkg> activate .
    Activating project at `~/Development/code-samples-julia-for-beginners/io/ch17

    (ch17) pkg> dev ./ToyRockets
    
At this point when you import the ToyRockets project you will get the project defined in this subdirectory rather than somewhere else.
