
\\ generate OEIS sequence A001211

{


for (i = 1,300,

aa = factor(i);
len = length(aa[,1]);
\\print(i," ",len," ");
print1(len,",");

);


quit();
}
