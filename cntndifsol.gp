
\\allocatemem(1000000000);
\\default(parisizemax,8000000000);
\p41;


\\ odd fucntion for parigp
odd(xx) = xx%2;

mmod(mm,nn) = (mm - nn*floor(mm/nn));


\\ main below
{

print();
print("-------------------------------------");

n1 = nextprime(8138); 
n2 = nextprime(9147);

n = n1*n2;

c = sqrtint(n);

r = c;
s = n;
acnt = 0;
print();
print("n1:",n1," n2:",n2," d:",abs(n1-n2));
print("n:",n," sqrtn:",c," begin:",r," end:",s);
while(1,
   r++;

   if (gcd(sqrtint(r*r + 4*n) + r,n) > 1, 
      q = sqrtint(r*r + 4*n) + r;
      a = gcd(q,n);
      if (a != n,
         \\print("rndif:",r," ",q," dif-ans:",gcd(q,n));
         acnt++;
      );
   );
   if (r > n,
      print("  2*sqrtn:",2*c);
      print("cnt solutions:",acnt);
      quit(););

);

quit();
}






