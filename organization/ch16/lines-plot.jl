# Create window to show plot output
using ElectronDisplay

# Make scatter, scatter! and current_figure available
using CairoMakie

# create values from 1 to 10 with stepping value of 0.1
xs = 1:0.1:10
ys1 = map(sin, xs)
ys2 = map(cos, xs)

# Plot lines with thickness 5
lines(xs,  ys1, linewidth=5)
lines!(xs, ys2, linewidth=5)

current_figure()

