# Create window to show plot output
using ElectronDisplay

# Make scatter, scatter! and current_figure available
using CairoMakie

# create values from 1 to 10 with stepping value of 0.1
xs = 1:0.1:10
ys1 = map(sin, xs)
ys2 = map(cos, xs)

scatter(xs, ys1)

# Modify current figure by adding cosine plot
scatter!(xs, ys2)

# Sends current figure to the electron display
current_figure()
