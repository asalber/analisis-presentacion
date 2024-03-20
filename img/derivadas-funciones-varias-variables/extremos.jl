using CairoMakie
graphictype = "pdf"
CairoMakie.activate!(type = graphictype)
myblue = RGBf(0.067,0.529,0.871)
myred = RGBf(1.0, 0.13, 0.32)
xs = ys = range(-2, 2, 30)
f(x, y) = y^2 - x^2
fig = Figure(backgroudcolor = :transparent)
ax = Axis3(fig[1,1], xlabel = L"$x$", ylabel = L"$y$", zlabel = L"$z$", azimuth = -pi/6, elevation = pi/12, aspect = (1,1,1))
xs = ys = range(-2, 2, 30)
f(x, y) = x^3/3 - y^3/3 - x + y 
surface!(ax, xs, ys, f.(xs, ys'), alpha = 0.9)
points = Point3.([-1,-1,1,1], [-1, 1, -1, 1], [0, 4/3, -4/3, 0])
scatter!(ax, points, color = myred, markersize = 16)
text!(ax, -1.2, -2, 2, text = L"$f(x,y)=\frac{x^3}{3}-\frac{y^3}{3}-x+y$", color = myblue, fontsize = 16)
text!(ax, [-1,-1,1,1], [-1, 1, -1, 1], [0, 4/3, -4/3, 0] .+ 0.1, text = ["Punto de silla", "Máximo", "Mínimo", "Punto de silla"], color = myred, fontsize = 16)
save("img/derivadas-funciones-varias-variables/extremos." * graphictype, fig, pt_per_unit = 1)
fig