using CairoMakie
graphictype = "png"
CairoMakie.activate!(type = graphictype)
myblue = RGBf(0.067,0.529,0.871)
myred = RGBf(1.0, 0.13, 0.32)
xs = ys = range(-2, 2, 30)
f(x, y) = y^2 - x^2
fig = Figure(backgroudcolor = :transparent)
ax = Axis3(fig[1,1], xlabel = L"$x$", ylabel = L"$y$", zlabel = L"$z$", azimuth = -pi/6, elevation = pi/12, aspect = (1,1,1))
surface!(ax, xs, ys, f.(xs, ys'))
scatter!(ax, Point3(0,0,0), color = myred, markersize = 16)
text!(ax, -1.2, -2, 4, text = L"$f(x,y)=y^2-x^2$", color = myblue, fontsize = 20)
text!(ax, 0, 0, 0.5, text = "Punto de silla", color = myred, fontsize = 20)
save("img/derivadas-funciones-varias-variables/punto-silla." * graphictype, fig, pt_per_unit = 1)
fig