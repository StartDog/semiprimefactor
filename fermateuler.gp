allocatemem(1000000000);
\p21;

/* adds in Fermat and Euler factoring 
Fermat is okay but Euler is doggish
*/

\\ has a square - really does not return
checkEuler(myi) = {
      eq = n - myi*myi;
      ep = myi*myi;
      eq = sqrtint(eq);
      ep = sqrtint(ep);
      print("first:",ep," ",eq);
      
      myi++;
      while(1,
         myi++;
         r = myi*myi;
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
            print("factors:",s1," ",s2); 
            print();
            quit();
         );
      );
}

{


n1 = nextprime(823413111); n2 = nextprime(974531111);
n1 = nextprime(6233311); n2 = nextprime(7745611);
\\n1 = nextprime(823478771111); n2 = nextprime(984572761111);
\\n1 = nextprime(8234111331111771111111); n2 = nextprime(9345111331115511111111);
\\n1 = nextprime(95340000000); n2 = nextprime(83210000000);

n = n1*n2;

\\ rsa 100
\\n = 1522605027922533360535618378132637429718068114961380688657908494580122963258952897654000350692006139;
print("Fermat and Euler in one factor search");
print("n:",n);
print();


f = sqrtint(n); \\ used for fermat - maybe a better one??
i=0;    \\ used for euler

print("starting big search");
print();

while (1,

   \\ below is fermat factoring
   f++;   \\ continues to increment even with changes to p
   if (issquare(f*f - n),
      print("checkFermat");
      print("square found:",f);
      c = f - sqrtint(f*f - n);;
      print("ans1:",c," ans2:",n/c);
      print();
      quit();
   );

   \\ below is Euler's method - does not work very well
   i++;
   \\if (eq < 1, print("done1");quit(););
   if (issquare(n - i*i),
      checkEuler(i); \\ never comes back
   );

);

quit();
}
