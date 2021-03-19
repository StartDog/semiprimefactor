
\\ generate OEIS sequence A008475

{


for (i = 1,300,

   aa = factor(i);
   len = length(aa[,1]);
   \\print(i," ",len," ");
   \\print1(len,",");
   suma = 0;
   for (j=1,len,
      zed = aa[j,1];
      zed = zed^aa[j,2];
      suma += zed;
   );
   print1(suma,",");
   );


quit();
}
