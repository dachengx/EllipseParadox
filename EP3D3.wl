Clear["Global`*"]
n1=ToExpression[$ScriptCommandLine[[2]]];
n2=ToExpression[$ScriptCommandLine[[3]]];
x1=ToExpression[$ScriptCommandLine[[4]]];
x4=ToExpression[$ScriptCommandLine[[5]]];
x5=ToExpression[$ScriptCommandLine[[6]]];
figpath=$ScriptCommandLine[[7]];
Print[$ScriptCommandLine];
Sumpic=10;
f1:=x^2/a^2+(y^2+z^2)/(a^2-1);
N1[{x_,y_,z_},a_]:=Normalize[{2*x/a^2,2*y/(a^2-1),2*z/(a^2-1)}];
f2:=(x-1)^2/r^2+(y^2+z^2)/r^2;
N2[{x_,y_,z_},r_]:=Normalize[{2*(x-1)/r^2,2*y/r^2,2*z/r^2}];
f3:=(x+1)^2/r^2+(y^2+z^2)/r^2;
eli1=f1/.a->x1;
c1=f3/.r->x4;
c2=f2/.r->x5;
u=x1;
Print["Paradox L to R rate is ",1];
Print["Paradox R to L rate is ",1];
SeedRandom[0];
d0=RandomVariate[MatrixPropertyDistribution[r.{0,0,1},r \[Distributed] CircularRealMatrixDistribution[3]],n1];
R=(RotationMatrix[{{1,0,0},#}])&/@d0;
d=({-1,0,0}+#)&/@(x4*d0);
Num1=0;
picNum1=1;
For[i=1,i<=n1,i++,
theta=RandomVariate[ProbabilityDistribution[0.5*Cos[v],{v,-Pi/2,Pi/2}],n2];
phi=RandomReal[{0,2*Pi},n2];
For[j=1,j<=n2,j++,
p=d[[i]];
ro=R[[i]];
P={p};
dir=RotationTransform[phi[[j]],{1,0,0}][RotationTransform[theta[[j]],{0,0,1}][{1,0,0}]];
If[dir[[1]]<0,dir=-1*dir];
dir=Normalize[ro.dir];
pt=P[[-1]]+t*dir;
flag=-1;
While[flag!=0&&flag!=4,
s=3*x1;
T1=NSolve[{(eli1/.{x->pt[[1]],y->pt[[2]],z->pt[[3]]})==1,t>10^-8},t,Reals];
If[Length[T1]!=0,If[Min[t/.T1]<s,flag=1;s=Min[t/.T1];]];
T0=NSolve[{(c1/.{x->pt[[1]],y->pt[[2]],z->pt[[3]]})==1,t>10^-8},t,Reals];
If[Length[T0]!=0,If[Min[t/.T0]<s,flag=0;s=Min[t/.T0];]];
T4=NSolve[{(c2/.{x->pt[[1]],y->pt[[2]],z->pt[[3]]})==1,t>10^-8},t,Reals];
If[Length[T4]!=0,If[Min[t/.T4]<s,flag=4;s=Min[t/.T4];]];
If[s==3*x1,Print["Error!"];Break[];]
If[flag==0,p=pt/.t->s;AppendTo[P,p];Break[];];
If[flag==4,p=pt/.t->s;AppendTo[P,p];Num1++;Break[];];
If[flag==1,p=pt/.t->s;AppendTo[P,p];eN=N1[p,x1];dir=Normalize[dir-2*(dir.eN)*eN];pt=P[[-1]]+t*dir;];
]
If[picNum1<=Sumpic,pict=Show[ContourPlot3D[{eli1==1},{x,-u,u},{y,-Sqrt[u^2-1],Sqrt[u^2-1]},{z,-Sqrt[u^2-1],Sqrt[u^2-1]},BoundaryStyle->None,ContourStyle->None],ContourPlot3D[{c1==1,c2==1},{x,-u,u},{y,-Sqrt[u^2-1],Sqrt[u^2-1]},{z,-Sqrt[u^2-1],Sqrt[u^2-1]},ColorFunction->"DarkRainbow",BoundaryStyle->None,Mesh->None],Graphics3D[{Red,Thick,Line[P]}],PlotRange->All,BoxRatios ->Automatic];If[picNum1<10,Export[StringTake[figpath,StringLength[figpath]-4]<>"L0"<>ToString[picNum1++]<>".png",pict],Export[StringTake[figpath,StringLength[figpath]-4]<>"L"<>ToString[picNum1++]<>".png",pict]]];
]]
Print["Simulation L to R rate ",N[Num1/(n1*n2)]];

d0=RandomVariate[MatrixPropertyDistribution[r.{0,0,1},r \[Distributed] CircularRealMatrixDistribution[3]],n1];
R=(RotationMatrix[{{1,0,0},#}])&/@d0;
d=({1,0,0}+#)&/@(x5*d0);
Num2=0;
picNum2=1;
For[i=1,i<=n1,i++,
theta=RandomVariate[ProbabilityDistribution[0.5*Cos[v],{v,-Pi/2,Pi/2}],n2];
phi=RandomReal[{0,2*Pi},n2];
For[j=1,j<=n2,j++,
p=d[[i]];
ro=R[[i]];
P={p};
dir=RotationTransform[phi[[j]],{1,0,0}][RotationTransform[theta[[j]],{0,0,1}][{1,0,0}]];
If[dir[[1]]<0,dir=-1*dir];
dir=Normalize[ro.dir];
pt=P[[-1]]+t*dir;
flag=-1;
While[flag!=0&&flag!=4,
s=3*x1;
T1=NSolve[{(eli1/.{x->pt[[1]],y->pt[[2]],z->pt[[3]]})==1,t>10^-8},t,Reals];
If[Length[T1]!=0,If[Min[t/.T1]<s,flag=1;s=Min[t/.T1];]];
T0=NSolve[{(c1/.{x->pt[[1]],y->pt[[2]],z->pt[[3]]})==1,t>10^-8},t,Reals];
If[Length[T0]!=0,If[Min[t/.T0]<s,flag=0;s=Min[t/.T0];]];
T4=NSolve[{(c2/.{x->pt[[1]],y->pt[[2]],z->pt[[3]]})==1,t>10^-8},t,Reals];
If[Length[T4]!=0,If[Min[t/.T4]<s,flag=4;s=Min[t/.T4];]];
If[s==3*x1,Print["Error!"];Break[];]
If[flag==0,p=pt/.t->s;AppendTo[P,p];Num2++;Break[];];
If[flag==4,p=pt/.t->s;AppendTo[P,p];Break[];];
If[flag==1,p=pt/.t->s;AppendTo[P,p];eN=N1[p,x1];dir=Normalize[dir-2*(dir.eN)*eN];pt=P[[-1]]+t*dir;];
]
If[picNum2<=Sumpic,pict=Show[ContourPlot3D[{eli1==1},{x,-u,u},{y,-Sqrt[u^2-1],Sqrt[u^2-1]},{z,-Sqrt[u^2-1],Sqrt[u^2-1]},BoundaryStyle->None,ContourStyle->None],ContourPlot3D[{c1==1,c2==1},{x,-u,u},{y,-Sqrt[u^2-1],Sqrt[u^2-1]},{z,-Sqrt[u^2-1],Sqrt[u^2-1]},ColorFunction->"DarkRainbow",BoundaryStyle->None,Mesh->None],Graphics3D[{Red,Thick,Line[P]}],PlotRange->All,BoxRatios ->Automatic];If[picNum2<10,Export[StringTake[figpath,StringLength[figpath]-4]<>"R0"<>ToString[picNum2++]<>".png",pict],Export[StringTake[figpath,StringLength[figpath]-4]<>"R"<>ToString[picNum2++]<>".png",pict]]];
]]
Print["Simulation R to L rate ",N[Num2/(n1*n2)]];
