default(parisizemax,4000000000);
/*
Pollard P minus one

Kind of slow
*/

{

n1 = nextprime(1195595344);
n2 = nextprime(1185584355);

n = n1*n2;

   print(n1); print(n2); 

   print("n:",n);

   k = 1;

   cnt = 0;
   while (1 == 1,
   k = k*25;
   print("k:",k);
   a = 2;
   p = 1;
   b = nextprime(k+1);
   bl = log(b);
   for (i=1, k,
      cnt++;
      p = p+1;
      p = nextprime(p);
      e = floor((bl)/log(p));
      if (e == 0,break(););
      f = p^e;
      a = (a^f)%n;
      d = gcd(a-1,n);
      if (d != 1 && d != n,
         print("cnt:",cnt," 1ans:",d);
         quit();
      );
      if (a == 1, 
         print("k too high");
         quit();
      );
   );
   \\print("a:",a);
   d = gcd(a-1,n);
   if (d != 1 && d != n, 
       print("2ans:",d);
       quit();
   ); 
   \\print("k too low");
   );

quit();
}

