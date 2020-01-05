Clear["Global`*"]
n1=ToExpression[$ScriptCommandLine[[2]]];
n2=ToExpression[$ScriptCommandLine[[3]]];
x3=ToExpression[$ScriptCommandLine[[4]]];
x4=ToExpression[$ScriptCommandLine[[5]]];
x5=ToExpression[$ScriptCommandLine[[6]]];
figpath=$ScriptCommandLine[[7]];
Print[$ScriptCommandLine];
f2:=(x-1)^2/r^2+y^2/r^2;
N2[{x_,y_},r_]:=Normalize[{2*(x-1)/r^2,2*y/r^2}];
f3:=(x+1)^2/r^2+y^2/r^2;
circ=f2/.r->x3;
c1=f3/.r->x4;
c2=f2/.r->x5;
rawfig=Show[ListPlot[{{-1,0},{1,0}}],ContourPlot[{circ==1,c1==1,c2==1},{x,-x3+1,x3+1},{y,-x3,x3}],PlotRange->All,GridLines->Automatic,AspectRatio ->Automatic];
Export[StringTake[figpath,StringLength[figpath]-4]<>"raw.png",rawfig];
Print["Paradox L to R rate is ",1];
Print["Paradox R to L rate is ",0];
SeedRandom[0];
d0=RandomVariate[MatrixPropertyDistribution[r.{0,1},r \[Distributed] CircularRealMatrixDistribution[2]],n1];
R=(RotationMatrix[{{1,0},#}])&/@d0;
d=({-1,0}+#)&/@(x4*d0);
Num1=0;
picNum1=1;
For[i=1,i<=n1,i++,
theta=RandomVariate[ProbabilityDistribution[0.5*Cos[v],{v,-Pi/2,Pi/2}],n2];
For[j=1,j<=n2,j++,
p=d[[i]];
ro=R[[i]];
P={p};
dir=Normalize[ro.(RotationMatrix[theta[[j]]].{1,0})];
pt=P[[-1]]+t*dir;
flag=-1;
While[flag!=0&&flag!=4,
s=3*x3;
T3=NSolve[{(circ/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T3]!=0,If[Min[t/.T3]<s,flag=3;s=Min[t/.T3];]];
T0=NSolve[{(c1/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T0]!=0,If[Min[t/.T0]<s,flag=0;s=Min[t/.T0];]];
T4=NSolve[{(c2/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T4]!=0,If[Min[t/.T4]<s,flag=4;s=Min[t/.T4];]];
If[s==3*x3,Print["Error!"];Break[];]
If[flag==0,p=pt/.t->s;AppendTo[P,p];Break[];];
If[flag==4,p=pt/.t->s;AppendTo[P,p];Num1++;Break[];];
If[flag==3,p=pt/.t->s;AppendTo[P,p];eN=N2[p,x3];dir=Normalize[dir-2*(dir.eN)*eN];pt=P[[-1]]+t*dir;];
]
If[picNum1<=50,pict=Show[ContourPlot[{circ==1,c1==1,c2==1},{x,-x3+1,x3+1},{y,-x3,x3}],ListLinePlot[P,PlotStyle->{RGBColor[1,0,0]}],PlotRange->All,GridLines->Automatic,AspectRatio->Automatic];If[picNum1<10,Export[StringTake[figpath,StringLength[figpath]-4]<>"L0"<>ToString[picNum1++]<>".png",pict],Export[StringTake[figpath,StringLength[figpath]-4]<>"L"<>ToString[picNum1++]<>".png",pict]]];
]]
Print["Simulation L to R rate ",N[Num1/(n1*n2)]];

d0=RandomVariate[MatrixPropertyDistribution[r.{0,1},r \[Distributed] CircularRealMatrixDistribution[2]],n1];
R=(RotationMatrix[{{1,0},#}])&/@d0;
d=({1,0}+#)&/@(x5*d0);
Num2=0;
picNum2=1;
For[i=1,i<=n1,i++,
theta=RandomVariate[ProbabilityDistribution[0.5*Cos[v],{v,-Pi/2,Pi/2}],n2];
For[j=1,j<=n2,j++,
p=d[[i]];
ro=R[[i]];
P={p};
dir=Normalize[ro.(RotationMatrix[theta[[j]]].{1,0})];
pt=P[[-1]]+t*dir;
flag=-1;
While[flag!=0&&flag!=4,
s=3*x3;
T3=NSolve[{(circ/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T3]!=0,If[Min[t/.T3]<s,flag=3;s=Min[t/.T3];]];
T0=NSolve[{(c1/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T0]!=0,If[Min[t/.T0]<s,flag=0;s=Min[t/.T0];]];
T4=NSolve[{(c2/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T4]!=0,If[Min[t/.T4]<s,flag=4;s=Min[t/.T4];]];
If[s==3*x3,Print["Error!"];Break[];]
If[flag==0,p=pt/.t->s;AppendTo[P,p];Num2++;Break[];];
If[flag==4,p=pt/.t->s;AppendTo[P,p];Break[];];
If[flag==3,p=pt/.t->s;AppendTo[P,p];eN=N2[p,x3];dir=Normalize[dir-2*(dir.eN)*eN];pt=P[[-1]]+t*dir;];
]
If[picNum2<=50,pict=Show[ContourPlot[{circ==1,c1==1,c2==1},{x,-x3+1,x3+1},{y,-x3,x3}],ListLinePlot[P,PlotStyle->{RGBColor[1,0,0]}],PlotRange->All,GridLines->Automatic,AspectRatio->Automatic];If[picNum2<10,Export[StringTake[figpath,StringLength[figpath]-4]<>"R0"<>ToString[picNum2++]<>".png",pict],Export[StringTake[figpath,StringLength[figpath]-4]<>"R"<>ToString[picNum2++]<>".png",pict]]];
]]
Print["Simulation R to L rate ",N[Num2/(n1*n2)]]
