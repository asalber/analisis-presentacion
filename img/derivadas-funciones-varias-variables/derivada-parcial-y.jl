using GLMakie
graphictype = "png"
GLMakie.activate!()
myblue = RGBf(0.067,0.529,0.871)
myred = RGBf(1.0, 0.13, 0.32)
xs = ys = range(-2, 2, 30)
f(x, y) = 2 - x^2 - y^2
size_inches = (8, 6)
size_pt = 100 .* size_inches
fig = Figure(resolution = size_pt, fontsize = 12)
ax = Axis3(fig[1,1], xlabel = L"$x$", ylabel = L"$y$", zlabel = L"$z$", azimuth= pi/4, xticks = ([1], [L"$a$"]), yticks = ([1], [L"$b$"]), zticklabelsvisible = false)
surface!(ax, xs, ys, f.(xs, ys'))
p1(x, y) = 1
idx(x, y) = x
zs = range(-6, 2, 30)
xss = idx.(xs, ys')
yss = idx.(zs', xs)
surface!(ax, p1.(xs, ys'), xss, yss; colormap = [myred], alpha = 0.5, transparency = true)
ts = range(-1, 1, 2)
l(t) = [1, 1+t, -2t] 
points = Point3.(l.(ts))
lines!(ax, points, color = myred)
scatter!(ax, Point3(1, 1, 0))
text!(ax, 0, 0, 3, text = L"$\frac{\partial f}{\partial y}(a,b)", color = myblue, fontsize = 20)
save("img/derivadas-funciones-varias-variables/derivada-parcial-y." * graphictype, fig, pt_per_unit = 1)
fig