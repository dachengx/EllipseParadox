Clear["Global`*"]
n1=ToExpression[$ScriptCommandLine[[2]]];
n2=ToExpression[$ScriptCommandLine[[3]]];
x1=ToExpression[$ScriptCommandLine[[4]]];
x3=ToExpression[$ScriptCommandLine[[5]]];
x4=ToExpression[$ScriptCommandLine[[6]]];
x5=ToExpression[$ScriptCommandLine[[7]]];
Sumpic=ToExpression[$ScriptCommandLine[[8]]];
figpath=$ScriptCommandLine[[9]];
Print[$ScriptCommandLine];
f1:=x^2/a^2+y^2/(a^2-1);
N1[{x_,y_},a_]:=Normalize[{2*x/a^2,2*y/(a^2-1)}];
f2:=(x-1)^2/r^2+y^2/r^2;
N2[{x_,y_},r_]:=Normalize[{2*(x-1)/r^2,2*y/r^2}];
f3:=(x+1)^2/r^2+y^2/r^2;
eli1=f1/.a->x1;
circ=f2/.r->x3;
c1=f3/.r->x4;
c2=f2/.r->x5;
u=Max[x1,x3+1];
If[Sumpic>=0,rawfig=Show[ListPlot[{{-1,0},{1,0}}],ContourPlot[{eli1==1,circ==1,c1==1,c2==1},{x,-u,u},{y,-u,u}],PlotRange->All,GridLines->Automatic,AspectRatio ->Automatic];Export[StringTake[figpath,StringLength[figpath]-4]<>"raw.png",rawfig]];
A1=NSolve[eli1==1&&circ==1&&y>0,{x,y},Reals];
xa=x/.A1[[1]];
If[Sumpic>=0,geofig=Show[ContourPlot[{eli1==1},{x,-u,xa},{y,-u,u}],ContourPlot[{circ==1},{x,xa,u},{y,-u,u}],ContourPlot[{c1==1,c2==1},{x,-u,u},{y,-u,u}],PlotRange->All,GridLines->Automatic,AspectRatio ->Automatic];Export[StringTake[figpath,StringLength[figpath]-4]<>"geo.png",geofig]];
Print["Paradox L to R rate is ",1];
Print["Paradox R to L rate is ",N[1-VectorAngle[({x,y}/.A1[[1]])-{1,0},{1,0}]/Pi]];
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
s=3*Max[x1,x3+1];
T1=NSolve[{(eli1/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8,pt[[1]]<=xa},t,Reals];
If[Length[T1]!=0,If[Min[t/.T1]<s,flag=1;s=Min[t/.T1];]];
T3=NSolve[{(circ/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8,pt[[1]]>xa},t,Reals];
If[Length[T3]!=0,If[Min[t/.T3]<s,flag=3;s=Min[t/.T3];]];
T0=NSolve[{(c1/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T0]!=0,If[Min[t/.T0]<s,flag=0;s=Min[t/.T0];]];
T4=NSolve[{(c2/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T4]!=0,If[Min[t/.T4]<s,flag=4;s=Min[t/.T4];]];
If[s==3*Max[x1,x3+1],Print["Error!"];Break[];]
If[flag==0,p=pt/.t->s;AppendTo[P,p];Break[];];
If[flag==4,p=pt/.t->s;AppendTo[P,p];Num1++;Break[];];
If[flag==1,p=pt/.t->s;AppendTo[P,p];eN=N1[p,x1];dir=Normalize[dir-2*(dir.eN)*eN];pt=P[[-1]]+t*dir;];
If[flag==3,p=pt/.t->s;AppendTo[P,p];eN=N2[p,x3];dir=Normalize[dir-2*(dir.eN)*eN];pt=P[[-1]]+t*dir;];
]
If[picNum1<=Sumpic,pict=Show[ContourPlot[{eli1==1},{x,-u,xa},{y,-u,u}],ContourPlot[{circ==1},{x,xa,u},{y,-u,u}],ContourPlot[{c1==1,c2==1},{x,-u,u},{y,-u,u}],ListLinePlot[P,PlotStyle->{RGBColor[1,0,0]}],PlotRange->All,GridLines->Automatic,AspectRatio->Automatic];If[picNum1<10,Export[StringTake[figpath,StringLength[figpath]-4]<>"L0"<>ToString[picNum1++]<>".png",pict],Export[StringTake[figpath,StringLength[figpath]-4]<>"L"<>ToString[picNum1++]<>".png",pict]]];
]]
Print["Simulation L to R rate ",Num1,"/",n1*n2,"=",N[Num1/(n1*n2)]];

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
s=3*Max[x1,x3+1];
T1=NSolve[{(eli1/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8,pt[[1]]<=xa},t,Reals];
If[Length[T1]!=0,If[Min[t/.T1]<s,flag=1;s=Min[t/.T1];]];
T3=NSolve[{(circ/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8,pt[[1]]>xa},t,Reals];
If[Length[T3]!=0,If[Min[t/.T3]<s,flag=3;s=Min[t/.T3];]];
T0=NSolve[{(c1/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T0]!=0,If[Min[t/.T0]<s,flag=0;s=Min[t/.T0];]];
T4=NSolve[{(c2/.{x->pt[[1]],y->pt[[2]]})==1,t>10^-8},t,Reals];
If[Length[T4]!=0,If[Min[t/.T4]<s,flag=4;s=Min[t/.T4];]];
If[s==3*Max[x1,x3+1],Print["Error!"];Break[];]
If[flag==0,p=pt/.t->s;AppendTo[P,p];Num2++;Break[];];
If[flag==4,p=pt/.t->s;AppendTo[P,p];Break[];];
If[flag==1,p=pt/.t->s;AppendTo[P,p];eN=N1[p,x1];dir=Normalize[dir-2*(dir.eN)*eN];pt=P[[-1]]+t*dir;];
If[flag==3,p=pt/.t->s;AppendTo[P,p];eN=N2[p,x3];dir=Normalize[dir-2*(dir.eN)*eN];pt=P[[-1]]+t*dir;];
]
If[picNum2<=Sumpic,pict=Show[ContourPlot[{eli1==1},{x,-u,xa},{y,-u,u}],ContourPlot[{circ==1},{x,xa,u},{y,-u,u}],ContourPlot[{c1==1,c2==1},{x,-u,u},{y,-u,u}],ListLinePlot[P,PlotStyle->{RGBColor[1,0,0]}],PlotRange->All,GridLines->Automatic,AspectRatio->Automatic];If[picNum2<10,Export[StringTake[figpath,StringLength[figpath]-4]<>"R0"<>ToString[picNum2++]<>".png",pict],Export[StringTake[figpath,StringLength[figpath]-4]<>"R"<>ToString[picNum2++]<>".png",pict]]];
]]
Print["Simulation R to L rate ",Num2,"/",n1*n2,"=",N[Num2/(n1*n2)]];
