Clear["Global`*"]
x1=1.4;
x2=1.6;
x3=1.2;
x4=0.2;
x5=0.2;
f1:=x^2/a^2+y^2/(a^2-1);
f2:=(x-1)^2/r^2+y^2/r^2;
eli1=f1/.a->x1;
eli2=f1/.a->x2;
circ=f2/.r->x3;
u=Max[x1,x2,x3];
demoraw=Show[ListPlot[{{-1,0},{1,0}}],ContourPlot[{eli1==1,eli2==1,circ==1},{x,-u,u},{y,-Sqrt[u^2-1],Sqrt[u^2-1]}],PlotRange->All,GridLines->Automatic,AspectRatio ->Automatic];
Export["demoraw.png",demoraw];
A1=NSolve[eli1==1&&circ==1&&y>0,{x,y},Reals];
xa=x/.A1[[1]];
A2=NSolve[eli2==1&&circ==1&&y>0,{x,y},Reals];
xb=x/.A2[[1]];
A3=NSolve[eli1==1&&x==(-x1+xa)/2&&y>0,{x,y},Reals];
P1={{-1,0},{x,y}/.A3[[1]],{1,0}};
A4=NSolve[circ==1&&x==(xa+xb)/2&&y<0,{x,y},Reals];
P2={{1,0},{x,y}/.A4[[1]],{1,0}};
A5=NSolve[eli2==1&&x==(x2+xb)/2&&y>0,{x,y},Reals];
P3={{-1,0},{x,y}/.A5[[1]],{1,0}};
demo2Dfig=Show[ListPlot[{{-1,0},{1,0}}],ContourPlot[{eli1==1},{x,-u,xa},{y,-Sqrt[u^2-1],Sqrt[u^2-1]}],ContourPlot[{eli2==1},{x,xb,u},{y,-Sqrt[u^2-1],Sqrt[u^2-1]}],ContourPlot[{circ==1},{x,xa,xb},{y,-Sqrt[u^2-1],Sqrt[u^2-1]}],ListLinePlot[P1,PlotStyle->{RGBColor[1,0,0]}],ListLinePlot[P2,PlotStyle->{RGBColor[1,0,0]}],ListLinePlot[P3,PlotStyle->{RGBColor[1,0,0]}],PlotRange->All,GridLines->Automatic,AspectRatio ->Automatic];
Export["demo2D.png",demo2Dfig];

f3:=x^2/a^2+(y^2+z^2)/(a^2-1);
f4:=(x-1)^2/r^2+(y^2+z^2)/r^2;
eli1=f3/.a->x1;
eli2=f3/.a->x2;
circ=f4/.r->x3;
demo3Dfig=Show[ListPointPlot3D[{{-1,0,0},{1,0,0}}],ContourPlot3D[{eli1==1},{x,-u,xa},{y,-Sqrt[u^2-1],Sqrt[u^2-1]},{z,-Sqrt[u^2-1],Sqrt[u^2-1]},BoundaryStyle->None,ContourStyle->None],ContourPlot3D[{circ==1},{x,xa,xb},{y,-Sqrt[u^2-1],Sqrt[u^2-1]},{z,-Sqrt[u^2-1],Sqrt[u^2-1]},BoundaryStyle->None,ContourStyle->None],ContourPlot3D[{eli2==1},{x,xb,u},{y,-Sqrt[u^2-1],Sqrt[u^2-1]},{z,-Sqrt[u^2-1],Sqrt[u^2-1]},BoundaryStyle->None,ContourStyle->None],PlotRange->All,BoxRatios ->Automatic];
Export["demo3D.png",demo3Dfig];

SeedRandom[0];
n=20000;
d0=RandomVariate[MatrixPropertyDistribution[r.{0,0,1},r \[Distributed] CircularRealMatrixDistribution[3]],n];
R=(RotationMatrix[{{1,0,0},#}])&/@d0;
theta=RandomVariate[ProbabilityDistribution[0.5*Cos[v],{v,-Pi/2,Pi/2}],n];
demo1Dcos=Show[Histogram[theta,20,"ProbabilityDensity"],Plot[PDF[ProbabilityDistribution[0.5*Cos[v],{v,-Pi/2,Pi/2}],x],{x,-Pi/2,Pi/2}],PlotRange->All];
Export["demo1Dcos.png",demo1Dcos];
phi=RandomReal[{0,2*Pi},n];
dir={};
dirp={};
For[i=1,i<=n,i++,AppendTo[dir,RotationTransform[phi[[i]],{1,0,0}][RotationTransform[theta[[i]],{0,0,1}][{1,0,0}]]];AppendTo[dirp,R[[i]].dir[[-1]]]];
demo2Dcos=ListPointPlot3D[dir,BoxRatios ->Automatic,ViewPoint->{5,0,0}];
Export["demo2Dcos.png",demo2Dcos];

