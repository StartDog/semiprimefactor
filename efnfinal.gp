\p10
/*

  This combines Euler, Fermat and a factoring method I created. 
  It factors first by any one of the three above.  Euler is 
  least probable to occur. Fermat the most probable. 

  
*/

\\ input two pairs of n = a*a + b*b
eulerg(A,B,C,D)={
\\ gonea and goneb are one pair of numbers 
         eA = A - C;
         eB = A + C;
         eC = D - B;
         eD = D + B;
         ek = gcd(eA,eC);
         eh = gcd(eB,eD);
         eFactor = ek*ek + eh*eh;
         eFactor = gcd(n,eFactor);
         return(eFactor);
}


{

print("-----------------------------------------------------------------------");

\\ rsa 100   uncomment or put your own n in 
n = 1522605027922533360535618378132637429718068114961380688657908494580122963258952897654000350692006139;

c = sqrtint(n);
print("n:",n," \nsqrtn:",c);

onea = 0; oneb = 0; twoa = 0; twob = 0;

cnt = 0;
b = c;
f = c; \\ used for fermat - maybe a better one??
r = 2*ceil(sqrtint(n)/16);  \\ a guess - maybe can improve on

while(1,

   b--;
   f++;   \\ continues to increment evven with changes to p

   if (b < 1, break(););

   \\ below is fermat factoring
   if (issquare(f*f - n),
      c = f - sqrtint(f*f - n);;
      print("fermat ans1:",c," ans2:",n/c);
      break();
      \\quit();
   );

   \\print(r," ",2*(f - c));
   \\r = 2*(c - b);
   if (gcd(sqrtint(r*r + 4*n) + r,n) > 1, 
      q = sqrtint(r*r + 4*n) + r;
      print("ndif:",r," ",q," dif ans:",gcd(q,n));
      break();
      \\quit();
   );
   r+=2;

   if (issquare(n - b*b),
      bc = n - b*b;
      if (onea == 0,
         onea = b; oneb = sqrtint(bc);
         print(cnt,"1st euler found");
         ,
         twoa = b; twob = sqrtint(bc);
         eFactor = eulerg(onea,oneb,twoa,twob);
         if (eFactor > 1,
            print("Euler ans:",eFactor);
         );
         break();
         \\quit();  \\put back in 
      );
   );
);

quit();
}

