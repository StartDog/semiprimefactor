\\allocatemem(1000000000);
default(parisizemax,10000000);
\p31;

odd(xx) = xx%2;

sumaa(x)={
   lfx = length(x);
   lpd = 0;
   for (j = 1,lfx,
      lpd += x[j];
   );
   return(lpd);
  }

sumrad(x)={
   fx = factor(x);
   lfx = length(fx[,1]);
   lpd = 0;
   for (j = 1,lfx,
      lpd += fx[j,1];
   );
   return(lpd);
  }

rad(x)={
   fx = factor(x);
   lfx = length(fx[,1]);
   lpd = 1;
   for (j = 1,lfx,
      lpd *= fx[j,1];
   );
   return(lpd);
  }

radfactinput= 0;
radfact(x)={
   if (x != radfactinput,   \\ if already done do not do again!
      radfactoutput = factor(x);
      radfactinput = x;
   );
   lfx = length(radfactoutput[,1]);
   radret = vector(lfx);
   rad1ret = radfactoutput[1,2];
   lpd = 1;
   for (j = 1,lfx,
      radret[j] = radfactoutput[j,1];
   );
   return(radret);
}

findfact(x)={
dd=1;
for(i=1,4000,
   dd*=i;
   if (dd > x,dd/=i;break(););
   if (dd > x,break(););
);
return(dd);
}

findprim(x)={
dd=1;
forprime(i=1,4000,
   dd*=i;
   if (dd > x,break(););
   if (dd > x,dd/=i;break(););
);
return(dd);
}

countc(x)={
   fx = factor(x);
   lfx = length(fx[,1]);
   return(lfx);
}

nthfactor(x,y)={
   fx = factor(x);
   fcx = fx[y,1];
   return(fcx);
}

firstc(x)={
   fx = factor(x);
   fcx = fx[1,1];
   return(fcx);
}

secondc(x)={
   fx = factor(x);
   fcx = fx[2,1];
   return(fcx);
}

tryndif(xx)={

   if (gcd(sqrtint(xx*xx + 4*n) + xx,n) > 1, 
      q = sqrtint(xx*xx + 4*n) + xx;
      a = gcd(q,n);
      if (a != n,
         print("rndif:",xx," ",q," dif-ans:",gcd(q,n));
      );
   );
}

ttest(xx)={
for (jj = 1,countc(xx),
   mm = nthfactor(xx,jj)*c;
   print(mm);
   tryndif(mm);
);
}

\\ generates 2*c solutions 
thing(y)=y*y + tsn + y*sqrtint(y*y + fsn);

\\ main below
{

print();
print("Generate all solutions using rdiff");

while(1,
print("---------------------------------------");
n1 = nextprime((3215116755531111)); \\
n2 = nextprime((4215116755531111)); \\ 

n1 = nextprime(3251); \\
n2 = nextprime(4251); \\ 

\\n1 = 37975227936943673922808872755445627854565536638199;
\\n2 = 40094690950920881030683735292761468389214899724061;

n = n1*n2;
print("n:",n," ",n1," ",n2);
print();


nd = abs(n1-n2);
print(" nd:",nd," ",radfact(nd));
rdd = nd - rad(nd);
if (rdd > 2,print("rdd:",rdd," ",radfact(rdd)););

c = sqrtint(n);
print("  c:",c," ",radfact(c));
print("    ",((n1+n2)/2) -c);
fermat = (n1 + n2)/2;
print("fer:",fermat," ",radfact(fermat));
print(2.0*fermat/nd);

\\aa = radfact(n+1); laa = length(aa); print("n+1:",aa," ",laa);

print();

fsn = 4*n;
tsn = 2*n;


u = 1;
if (odd(u),u++;);
print("u:",u);

print("starting loop with going up ");
print();
cnt = 0; sol=0;
first = 0;
last = 0;
while(1,

   g2 = gcd(thing(u),n);
   if (g2 > 1 && g2 < n, 
      g1 = thing(u); 
      \\print("au:",u," fu:",radfact(u));
      ans1 = gcd(g1,n); ans2 = n/ans1; imf = (ans1 + ans2)/2;
      \\print(cnt," 1ndif:",u," ",g1," ans1:",ans1," fer:",imf," ans2:",ans2);
      sol++; 
      if (first == 0,first = g1;);
      last = g1;
      \\quit();
   );
   u+=2;   cnt++;
   if (u > n,break(););
);
print("solutions:",sol);
print("n:",n);
print(1.0*sol/c);
print(first);
print("c:",c);
print(last);
quit();
\\quit();
);
quit();

}

