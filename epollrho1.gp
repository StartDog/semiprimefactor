allocatemem(1000000000);
\p41;
{



\\ j = 3 for the below number





n = n1*n2;

n = nextprime(91112313123123)*nextprime(9111324234234);
n = nextprime(71112313123123)*nextprime(7111324234234);
n = nextprime(81112313123123)*nextprime(8111324234234);

n = 124620366781718784065835044608106590434820374651678805754818788883289666801188210855036039570272508747509864768438458621054865537970253930571891217684318286362846948405301614416430468066875699415246993185704183030512549594371372159029236099;

\\ rsa 100
n = 1522605027922533360535618378132637429718068114961380688657908494580122963258952897654000350692006139;

\\n1 = nextprime(8341981112313123123);
\\n2 = nextprime(7341971112124234234);

n1 = nextprime(441194465555);
n2 = nextprime(511185553333);
\\print(n1);  print(n2);
n = n1*n2;
\\n=22553282822126171062357844739894141197;

\\lim = 100000*sqrtint(sqrtint(sqrtint(sqrtint(n))));
\\print("cnt max:",lim);

lim = 10000;
cent = sqrtint(n);
print(cent);

yy =   ceil(cent/2);;
mm = random(yy);


print("n:",n);
print();

z = 0;
pp=0;
pp = cent;

while(1,
cnt = 0;

mm = random(ceil(cent/2));
m = mm; y = yy; p = pp;

\\print(mm);
/*
 Pollard's Rho below 
 what is interesting is finding
 initial parameters that find factors quickest
 unfortunately there does not seem to be 
 a decent pattern.


e.g., for 

n:225532237027274224665437

cnt=   4452 m:190085221426 y:237451172364 p:474902344727 rc:511185553369
cnt= 792546 m:1            y:1            p:1            rc:441194465573
cnt=1274624 m:1            y:1            p:2            rc:441194465573
cnt= 458068 m:2            y:2            p:2            rc:441194465573
cnt= 722180 m:2            y:2            p:474902344727 rc:441194465573

*/
while (1,
cnt++;

m = (m*m + p)%n;
y = (y*y + p)%n;
y = (y*y + p)%n;

c = y - m;
\\if (c == 0,print("zero"););
d = gcd(c,n);
if (d > 1 && d != n,
    print(cnt," m:",mm," y:",yy," p:",pp," rc:",gcd(c,n));
    quit();
    break();
);

if (cnt > lim, break(););
);

);

mm++;
quit();
}
