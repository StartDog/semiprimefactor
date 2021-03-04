\\allocatemem(1000000000);
default(parisizemax,10000000);
\p31;

/*  

generate OEIS sequence A075860   just 5000 of them as it is an infinite sequence

https://oeis.org


*/


radfact(x)={
   fx = factor(x);
   lfx = length(fx[,1]);
   radret = vector(lfx);
   lpd = 1;
   for (j = 1,lfx,
      radret[j] = fx[j,1];
   );
   return(radret);
}

\\ main below
{

i = 2;

while(1,
sumz4 = i;
\\print(sumz4,"->",radfact(sumz4));

while(1,
bb = radfact(sumz4);
bbl = length(bb);
sumz4 = 0;
for (i = 1,bbl,sumz4+=bb[i]);
\\print("sumz4:",sumz4," <-- ",bb);
if (bbl == 1,print(bb[1]);break(););
);

i++;
if (i > 5000, quit(););
);

}
