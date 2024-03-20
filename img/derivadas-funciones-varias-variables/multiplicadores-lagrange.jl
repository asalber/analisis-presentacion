using CairoMakie
CairoMakie.activate!(type = "png")
myblue = RGBf(0.067,0.529,0.871)
f(x,y) = x^3/3-y^3/3-x+y
xs = ys = range(-2, 2; length=100)
zs = f.(xs, ys')
size_inches = (8, 6)
size_pt = 100 .* size_inches
fig = Figure(resolution = size_pt, fontsize = 16, backgroundcolor=:transparent)
ax = Axis(fig[1,1], xlabel = L"$x$", ylabel = L"$y$", aspect = 1)
contour!(ax, xs, ys, zs; labels = true, levels = [-2,-1.8,-1.6,-1.4,-1.1547, -1, -0.8, -0.6,-0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1,1.1547, 1.4, 1.6, 1.8, 2], colormap=:hsv)
g(x) = -2x
lines!(ax, -1..1, g)
scatter!(ax, [-sqrt(1/3), sqrt(1/3)], [2sqrt(1/3), -2sqrt(1/3)])
save("img/derivadas-funciones-varias-variables/multiplicadores-lagrange.png", fig, pt_per_unit = 1)
fig