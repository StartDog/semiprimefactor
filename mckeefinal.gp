\p60;
/* fermat with mckee improvements and 
some changes of my own

pretty slow
*/

cfrac(x) =
{
i = 1;
q = vector(500);
q[i] = truncate(x);
x = x - q[i];
while (x > 0,
    i = i+1;
    if (i > 500, return(q););
    if (x < 1e-40, return(q););
    \\print("ax:",x);
    x = 1.0/x;
    \\print("bx:",x);
    q[i] = truncate(x);
    x = x - q[i];    
);
return(q);
}

q(x1,y1,nn,bb)=
{
return((x1+bb*y1)^2 - nn*y1*y1);
}

{


n1 = nextprime(38391111);
n2 = nextprime(25121222);


n = n1*n2;

print("1:",n1);
print("2:",n2);

print("n:",n);
b = ceil(sqrt(n));
lim=39628;
lim=ceil(b^(.588));

print("lim:",lim);

print("b:",b);

for (i=1,lim,
for (j=1,lim,

z = abs(q(i,j,n,b));
if (issquare(z),
    zz = sqrtint(z);
    print("1square:",z," ",i," ",j);
    print("1ans:",gcd(i+b*j-zz,n));
    quit();
);

xx=lim+1-i;
yy=lim+1-j;

z = abs(q(xx,yy,n,b));
if (issquare(z),
    zz = sqrtint(z);
    print("2square:",z," ",xx," ",yy);
    print("2ans:",gcd(xx+b*yy-zz,n));
    quit();
);

z = abs(q(i,yy,n,b));
if (issquare(z),
    zz = sqrtint(z);
    print("3square:",z," ",i," ",yy);
    print("3ans:",gcd(i+b*yy-zz,n));
    quit();
);

z = abs(q(xx,j,n,b));
if (issquare(z),
    zz = sqrtint(z);
    print("4square:",z," ",xx," ",j);
    print("4ans:",gcd(xx+b*j-zz,n));
    quit();
);

);
);

quit();
}



