
\\ generate OEIS sequence A008472

{


for (i = 1,300,

   aa = factor(i);
   len = length(aa[,1]);
   \\print(i," ",len," ");
   \\print1(len,",");
   suma = 0;
   for (j=1,len,
      suma += aa[j,1];
   );
   print1(suma,",");
   );


quit();
}
