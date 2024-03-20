using CairoMakie
graphictype = "svg"
CairoMakie.activate!(type = graphictype)
f(x,y) = x^2*y/(x^4+y^2)
xs = ys = range(-2, 2; length=50)
zs = f.(xs, ys')
size_inches = (8, 6)
size_pt = 100 .* size_inches
fig = Figure(resolution = size_pt, fontsize = 12, backgroundcolor=:transparent)
ax = Axis3(fig[1,1], xlabel = L"$x$", ylabel = L"$y$", zlabel = L"$z$")
surface!(ax, xs, ys, zs)
save("img/derivadas-funciones-varias-variables/no-existencia-limite." * graphictype, fig, pt_per_unit = 1)
fig
