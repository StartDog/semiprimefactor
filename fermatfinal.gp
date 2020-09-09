allocatemem(1000000000);
\p21;

/* 

fermat factoring

*/


{


n1 = nextprime(335311311); n2 = nextprime(578131111);
\\n1 = nextprime(823478771111); n2 = nextprime(984572761111);
\\n1 = nextprime(8234112345111); n2 = nextprime(9745123451111);
\\n1 = nextprime(823411111111111); n2 = nextprime(974511111111111);   \\b
\\n1 = nextprime(7323411111511111); n2 = nextprime(6434531211111111); \\a
\\n1 = nextprime(73234111115131111); n2 = nextprime(64345312112111111); \\a
\\n1 = nextprime(823411111111111111); n2 = nextprime(934511111111111111); \\c
\\n1 = nextprime(82341113311111111111); n2 = nextprime(93451113311111111111);  \\d
\\n1 = nextprime(8234111331111771111111); n2 = nextprime(9345111331115511111111);
\\n1 = nextprime(95340000000); n2 = nextprime(83210000000);

\\if (n1 > 0,print("n1:",n1););
\\if (n2 > 0,print("n2:",n2););
n = n1*n2;

\\ rsa 100
\\n = 1522605027922533360535618378132637429718068114961380688657908494580122963258952897654000350692006139;
print("Fermat factor search");
print("n:",n);
print();

f = sqrtint(n); \\ used for fermat - maybe a better one??

print("starting big search");
print();

while (1,

   \\ below is fermat factoring
   f++;   \\ continues to increment evven with changes to p
   if (issquare(f*f - n),
      print("checkFermat");
      print("square found:",f);
      c = f - sqrtint(f*f - n);;
      print("ans1:",c," ans2:",n/c);
      print();
      quit();
   );

);

quit();
}
