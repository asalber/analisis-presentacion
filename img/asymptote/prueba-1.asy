import graph3;
unitsize(1cm);
size(10cm);
real x(real t) {return cos(2pi*t);}
real y(real t) {return sin(2pi*t);}
real z(real t) {return t;}

path3 p=graph(x,y,z,0,2,operator ..);

draw(p,red,Arrow3);

scale(true);

xaxis3(XZ()*"$x$",-1.5,1.5,InOutTicks(Label,0.5,0.5));
yaxis3(YZ()*"$y$",OutTicks(beginlabel=false,Label,2,2));
zaxis3(XZ()*"$z$",OutTicks);