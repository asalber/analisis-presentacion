import graph;
size(10cm);
Label f; 
f.p=fontsize(6); 
xaxis(-8,8,Ticks(f, 2.0)); 
yaxis(-8,8,Ticks(f, 2.0)); 

real f(real x) 
{ 
return x^3; 
} 
draw(graph(f,-2,2),green+linewidth(1));;