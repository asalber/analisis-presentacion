using CairoMakie
graphictype = "pdf"
CairoMakie.activate!(type = graphictype)
myblue = RGBf(0.067,0.529,0.871)
f(x,y) = y^2-x^2
xs = ys = range(-2, 2; length=30)
zs = f.(xs, ys')
size_inches = (8, 6)
size_pt = 100 .* size_inches
fig = Figure(resolution = size_pt, fontsize = 12, backgroundcolor=:transparent)
ax1 = Axis3(fig[1,1], xlabel = L"$x$", ylabel = L"$y$", zlabel = L"$z$", azimuth = -pi/6, aspect = (1,1,1))
surface!(ax1, xs, ys, zs)
contour3d!(ax1, xs, ys, zs, levels = -4:0.5:4, colormap=:hsv)
text!(ax1, -1.2, -2, 4, text = L"$f(x,y)=y^2-x^2$", color = myblue, fontsize = 20)
ax2 = Axis(fig[1,2], xlabel = L"$x$", ylabel = L"$y$", aspect = 1)
contour!(ax2, xs, ys, zs; labels = true, levels = -4:0.5:4, colormap=:hsv)
save("img/derivadas-funciones-varias-variables/curvas-nivel." * graphictype, fig, pt_per_unit = 1)
fig