/*

ldnfinal.gp

language pari gp

This is a sort of brute force semiprime factoring program
It starts from the square root and goes down from there
There is a going up version too.  It does more than just 
increment. I am not sure if very useful as it is slower that
other algorithms but it was fun writing.

I also still feel there should be a way to instantaneously
find the factor of a semiprime by looking at its structure

Thomas Kellar
copyright 

10 June 2020

In this application I found parigp to be much faster than
Python

*/
\\ below three lines might be changed
\\allocatemem(1000000000);
\\default(parisizemax,8000000000);
\p40;

\\ odd fucntion for parigp
odd(xx) = xx%2;

mmod(mm,nn) = (mm - nn*floor(mm/nn));

\\ in the spirit of the program only go down
udcheck(n,vv)={
print("Check within p0...");
dch = -2;
ds = sqrtint(n);
ds++;  \\ even so add one to increment to odd
print("s:",ceil((ds-vv)/2));

while (1,
if (check(n,ds) == 1,
   print("dn:",ds);
   quit();
);
ds += dch;
if (ds < vv, break(););
);

return();
}

check(n,v)={
d = gcd(n,v);
if (d > 1 && d != n,
   print("1ans:",d);
   return(1);
);
return(0);
}


{

print();
print("Last edit 10 June 2020 Going Down Final...");

\\ test number below takes 1 minute 34 seconds on my computer
n1 = nextprime(4411944655);
n2 = nextprime(5111855533);
n = n1*n2;

lim = sqrtint(n);

print("n:",n);
print("sqrt:",lim);
print("find initial p0...");

if (check(n,sqrtint(n)) == 1,
   print("Special case!");
   quit();
);

p0 = 0;
os = lim;
of = n%lim;
print("a:",os," ",of);

ch1 = sqrtint(sqrtint(n));
ch2 = (sqrtint(n));
ch = ceil((ch1+ch2)/2.0);

ch = ch1;

print("ich:",ch);
while(1,
s = os;
ch = ch-ceil((ch^(9/10)));  \\ was 1*
\\print("ch:",ch," ",s);
if (ch == 0, break(););
while (1,
   s-=ch;
   f = n%s;
   delta = f - of;
   if (delta < 0,
      break();
   );
   of = f;
   os = s;
);
if (ch == 1, break(););
);

p0 = os;
print("lm:",lim);
print("p0:",p0);
print("Distance from lm:",abs(p0-lim));
print();

ch1 = lim - p0;
ch2 = n%(p0-1);
print(ch1," ",ch2);

forstep (i=3,-3,-1,
   \\print(p0+i," ",n%(p0+i));
   if (check(n,p0+i) == 1,
      print("2ans:",p0+i);
      quit();
   );
);

\\ need to check up and down from [lim to lim+-p0]
savep0 = p0;

print("Start large loop going down");
op = p0;
dp = n;
print(op," ",dp);

\\ below 3 all seem  to be the same speed
\\ just not large tnough for rsa100
ch = ceil((sqrtint(sqrtint(n))/5));
ch = ceil((sqrtint(sqrtint(n))));
ch = 5*ceil((sqrtint(sqrtint(n))));
print("ich:",ch);

p0 -= 10000;   \\ stupid guess
os = p0-1;

while (1,
   os--;
   of = n%os;

   while (1,
      s = os;
      ch = sqrtint(ch);
      while (1,
         s-=ch;
         f = n%s;
         if (f - of < 0, os = s+ch;  break(););
         of = f;
      );
      if (ch == 1, break(););
   );

   d = gcd(n, os-1);
   if (d >1 && d != n,
      print("1ans:",d);
      quit();
   );

   dp = op - os;
   ch = ceil((dp*dp)/5);  \\ was 5
   op = os;
   \\print("dp:",dp);
   \\if (dp < 4,break(););
);

\\udcheck(n,savep0);  \\ maybe put after dp search?

\\ currently nothing jumps down here
print("dp:",dp);
s = s+3;
print(s," jump to bottom loop");
print();

\\s = p0;
ch = -2;
ds = lim+3; \\ must be odd

if (!odd(s),
   s++;
);

while(1 == 1,
   s -= 2;
   ds -= 2;
   if (check(n,s) == 1,
      print("4ans:",s);
      quit();
   );
   if (check(n,ds) == 1,
      print("5ans:",ds);
      quit();
   );
);

quit();
}
