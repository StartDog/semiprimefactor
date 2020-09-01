allocatemem(1000000000);
\p41;

/*

this is a combination of 3 algorithms. 
1. Euler
2. Fermat
3. Pollards Rho

The Pollards Rho is generally the fastest 
though the others are guaranteed to finish
though much slower. 

Fun

*/

\\ a function which can work better in some circumstances
f3(aw) = { return ((aw*aw*aw - aw*aw + p)%n); }

\\ the standard Pollards Rho function below
f2(hh) = { return ((hh*hh + p)%n); }


{

\\ combines Pollard's Rho and Fermat together.
\\ not fasterer but checks both



\\n1 = nextprime(82341111); n2 = nextprime(97451111);
\\n1 = nextprime(823478771111); n2 = nextprime(984572761111);
n1 = nextprime(8234112345111); n2 = nextprime(9745123451111);
\\n1 = nextprime(823411111111111); n2 = nextprime(974511111111111);
\\n1 = nextprime(7323411111511111); n2 = nextprime(6434531211111111);
\\n1 = nextprime(823411111111111111); n2 = nextprime(934511111111111111);
\\n1 = nextprime(82341113311111111111); n2 = nextprime(93451113311111111111);
\\n1 = nextprime(8234111331111771111111); n2 = nextprime(9345111331115511111111);

\\print("n1:",n1);
\\print("n2:",n2);
n = n1*n2;

\\ rsa 100
\\n = 1522605027922533360535618378132637429718068114961380688657908494580122963258952897654000350692006139;

print("n:",n);
print();

print("find a square pp");
pp = sqrtint(n);
print("   initial pp:",pp);

pt = sqrtint(pp);
pt = nextprime(pt);
\\pt = precprime(pt);  \\ generally faster than nextprime and sqrtint
pp = pt*pt;
print("new square pp:",pp);

f = sqrtint(n); \\ used for fermat
acnt=0; \\ not used
i=0;    \\ used for euler
print("starting search");
print();

p = pp;

while(1,

mm = random(ceil(n/5));  \\  back to 3,4 is slower   5,6,7 faster   11,13 slower   
\\mm = random(ceil(n));  \\ or set back to 3,4 is slower   5,6,7 faster   11,13 slower   
m = mm; y = mm;

cnt=0;  \\ used for failure of Pollard's Rho
acnt++;

while (1,
   cnt++;

   \\ below is Pollard's Rho1
   m = f2(m);
   y = f2(f2(y));
   c = y - m;
   d = gcd(c,n);
   if (d > 1 && d != n,
      print("prho1 ",acnt," ",cnt," m:",mm," p:",pp," rc:",gcd(c,n));
      if (acnt > 13,quit(););
      break(); 
      \\quit();
   );

   \\ below is fermat factoring
   f++;   \\ continues to increment evven with changes to p
   if (issquare(f*f - n),
      print("square found:",f);
      c = f - sqrtint(f*f - n);;
      print("ans1:",c," ans2:",n/c);
      print();
      quit();
   );

   \\ below is Euler's method
   i++;
   eq = n - i*i;
   \\if (eq < 1, print("done1");quit(););
   if (issquare(eq),
      ep = i*i;
      eq = sqrtint(eq);
      ep = sqrtint(ep);
      print("first:",ep," ",eq);
      
      i++;
      while(1,
         i++;
         r = i*i;
         s = n - r;
         if (s < 1, print("done2",quit();););
         if (issquare(s),
            r = sqrtint(r);
            s = sqrtint(s);
            print("second:",r," ",s);

            d1 = eq - s;
            d2 = eq + s;
            d3 = r - ep;
            d4 = ep + r;
            k1 = gcd(d1,d3);
            k2 = gcd(d2,d4);
            s1 = gcd(k1*k1+k2*k2,n); 
            s2 = n/s1; 
            print(s1," ",s2); 
            print();
            quit();
         );
      );
   );

\\-----------------------------
\\if (cnt > 4000000000,break(););
  if (cnt > 4000000000,print("break");break(););
\\if (cnt > 40000000000,break(););

);
);

quit();
}
