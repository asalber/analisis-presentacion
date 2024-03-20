using GLMakie
graphictype = "png"
GLMakie.activate!()
myblue = RGBf(0.067,0.529,0.871)
myred = RGBf(1.0, 0.13, 0.32)
xs = ys = range(-2, 2, 30)
f(x, y) = x^2 + y^2
fig = Figure()
ax = Axis3(fig[1,1], xlabel = L"$x$", ylabel = L"$y$", zlabel = L"$z$", azimuth= pi/12, aspect = (1, 1, 1))
surface!(ax, xs, ys, f.(xs, ys'))
xs = ys = range(0, 2, 2)
pn(x, y) = 2x + 2y - 2
surface!(ax, xs, ys, pn.(xs, ys'); colormap = [myred], alpha = 0.5, transparency = true)
ts = range(-1, 1, 2)
tg(t) = [1+2t, 1+2t, 2-t]
points = Point3.(tg.(ts))
lines!(ax, points, color = myred)
scatter!(ax, Point3(1, 1, 2); color = myblue)
fig
save("img/derivadas-funciones-varias-variables/recta-normal-plano-tangente." * graphictype, fig, pt_per_unit = 1)
fig