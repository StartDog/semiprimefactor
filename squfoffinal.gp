\\ below can have a severe impact on speed
\p40;


\\ squfof below
/* squfof or SQUare FOrms Factoring


Daniel Shanks invented

it is not very fast.  

*/

{


n1 = nextprime(312111111111111);
n2 = nextprime(412112222222222);

n = n1*n2;

print("n:",n);

s = sqrtint(n);

cmax = 9000000;

multiplier = vector(100);
multiplier[1] = 1;
multiplier[2] = 5;
multiplier[3] = 3;
multiplier[4] = 7;
multiplier[5] = 11;
multiplier[6] = 3*5;
multiplier[7] = 3*7;
multiplier[8] = 3*11;
multiplier[9] = 5*7;
multiplier[10] = 5*11;
multiplier[11] = 7*11;
multiplier[12] = 3*5*7;
multiplier[13] = 3*5*11;
multiplier[14] = 3*7*11;
multiplier[15] = 5*7*11;
multiplier[16] = 3*5*7*11;

print("Starting...",n);
k = 0;
while (1 == 1,
k++;
print("k:",k," ",multiplier[k]);
if (k > 16,
   print("beyond k range");
   quit();
);

d = multiplier[k]*n;
po = sqrtint(d); 
pp = po;
pc = po;
qp = 1;
qc = d - po*po;

bc = 3*truncate(2*sqrt(2*s));

\\
cnt = 0;

i = 2;
while (1,
cnt++;
if (cnt > cmax,
   print("cnt!");
   i = bc;
   break;
);

if (i >= bc,
   print("break one");
   break();
);
b = truncate((po + pc)/qc);
pc = b*qc - pc;
q = qc;
qc = qp + b*(pp - pc);
r = truncate(sqrt(qc)+0.5);

if (i%2 == 0 && r*r == qc, 
   print("break two");
   break();
);

qp = q;
pp = pc;

i++;
);

if (i < bc, 

b = truncate((po - pc)/r);
pp = b*r + pc;

dd = gcd(pp,n);
if (dd > 1,
   print("1ans:",dd);
   quit();
);

pc = pp;
qp = r;
qc = truncate((d - pp*pp)/qp);

i = 0;
while(1,
  b = truncate((po + pc)/qc);
  pp = pc;
  pc = b*qc - pc;
  q = qc;
  qc = qp + b*(pp - pc);
  qp = truncate(q); \\ speculate on that truncate
  if (pc == pp, 
    break();
  );
  i++;
);

r = gcd(n, qp);
if (r > 1 && r != n,
   print("2ans:",r);
   quit();
);

); \\ if (i < bc

);
quit();
}

