allocatemem(1000000000);
\p21;

/* further final Pollard's Rho */


findpp(n)={
   mpp = sqrtint(sqrtint(n));
   mpp = nextprime(mpp);
   \\mpp = precprime(mpp);
   mpp = mpp*mpp;
return(mpp);
}

findmm(n)={
   mmm = sqrtint(pp);
   mmm = sqrtint(sqrtint(n));
   mmm = nextprime(mmm);
   \\mmm = precprime(mmm);  \\ not quite as good
   mmm = mmm*mmm;
   \\mmm = (ceil(n/7))-1;  
}

f3(aw) = { return ((aw*aw*aw - aw*aw + p)%n); }
\\ below is the standard
f2(hh) = { return ((hh*hh + p)%n); }

{

n1 = nextprime(8234111111); n2 = nextprime(9745122111);
\\n1 = nextprime(8234111331111771111111); n2 = nextprime(9345111331115511111111);

n = n1*n2;

\\ rsa 100
\\n = 1522605027922533360535618378132637429718068114961380688657908494580122963258952897654000350692006139;
print("Pollard's Rho only factor search");
print("n:",n);
print();


pp = findpp(n);
mm = findmm(n);
print(mm," ",pp);
f = sqrtint(n);
climit = ceil(sqrtint(f)/2);
print("climit:",climit);
acnt=0; \\ not used except to show pr interations

print("starting big search that takes forever");
print();

while(1,

imm = random(mm); 
m = imm;
y = imm;

ip = random(pp);
p = ip;
\\p = mm;

cnt=0;  \\ used for failure of Pollard's Rho
acnt++;

while (1,
   cnt++;

   m = f2(m);
   y = f2(f2(y));
  
   if (gcd(y - m,n) > 1,
      c = y - m;
      d = gcd(c,n);
      if (d < n,
         print("prho1 ",acnt," ",cnt," m:",imm," p:",ip," rc:",gcd(c,n));
         \\quit();
         break();
         ,
         print("gtetn ",cnt);
         break();
      );
   );

if (cnt > climit,break(););

);
);

quit();
}
