allocatemem(1000000000);
\p41;
{

\\ combines Pollard's Rho and Fermat together.
\\ not fasterer but checks both

n1 = nextprime(92341111511111);
n2 = nextprime(83451111111111);
n1 = nextprime(923411511111);
n2 = nextprime(834511111111);
n = n1*n2;

print("n1:",n1);
print("n2:",n2);
print("n:",n);

print("n:",n);
print();
mm=2;
pp=sqrtint(n);
yy=ceil(pp/2);



m = mm; y = yy; p = pp;

cnt=0;
f = pp-1;

while (1,
\\''cnt++;
f++;
if (issquare(f*f - n),
   print("square found:",f);
   d = f*f - n;
   a = sqrtint(d);
   c = f - a;
   print("ans1:",c," ans2:",n/c);
   quit();
);

m = (m*m + p)%n;
y = (y*y + p)%n;
y = (y*y + p)%n;

c = y - m;
if (c == 0,print("zero"););
d = gcd(c,n);
if (d > 1 && d != n,
    print(cnt," m:",mm," y:",yy," p:",pp," rc:",gcd(c,n));
    quit();
);

);


quit();
}
