{

\\ euler factorization - eoes not always work

n1 = nextprime(2322322323233);
n2 = nextprime(3433223233423);
n = n1*n2;

i = 0;
while(1,

   i++;
   p = i*i;
   q = n - p;
 \\print(n," ",p," ",q);
   if (q < 1, print("done1");quit(););
   if (issquare(q),
      q = sqrtint(q);
      p = sqrtint(p);
      print("first:",p," ",q);
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

            d1 = q - s;
            d2 = q + s;
            d3 = r - p;
            d4 = p + r;
            k1 = gcd(d1,d3);
            k2 = gcd(d2,d4);
            s1 = gcd(k1*k1+k2*k2,n); 
            s2 = n/s1; 
            print(s1," ",s2); 
            quit();
         );
      );
   );

);

quit();

}
