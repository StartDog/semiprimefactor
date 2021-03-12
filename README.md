# semiprimefactor
Some simple programs to factor semiprimes - all written in pari gp  
github seems to think they are some other language.

Not gnuplot!!!!

language: https://pari.math.u-bordeaux.fr/

I am interested in semiprimes - mostly due to RSA encryption but 
they have an interest outside of that as well.  I am interested
in simple number factoring programs.  I have a bunch I have been
working on but am uploading them slowly.  The only really original
one is the ldnfinal.gp. That was fun. Pollard's Rho is fun as well.  
Choosing the starting 3 factors for this particular implementation is a
interesting challenge. (Sorry for using the word interesting too
much.) With the right starting factors, any number could be factored
quickly. John Pollard recommends viewing his web page. I have not 
really found good general starting factors nor any method for chosing 
good factors though I have found bad ones. The ldnfinal.gp is 
sometimes faster than John Pollard's Rho in many situations but mostly 
slower. Of course if you really want speed you want the
cado-nfs program which is not located on github but is located
on https://gitlab.inria.fr  Though it is quite hefty. All these Pari-gp
programs are intended to run on a single CPU. 

The language is Pari gp which I found to be much faster than 
Python - especially with large numbers.  I am a fan of Python
though really a fan of any language except Java.

I am of the belief that it should be possible to find an algorithm
to instantly factor semi-primes. I have been unable to find that
algorithm as yet.

A lot of help in this came From Samuel S. Wagstaff, Jr's wonderful
book called _The Joy of Factoring_ which Wright State University
wonderfully let me borrow for ever and ever.

epzsq is simply a combination of Pollard's Rho and Fermat.

epzsqa is a combination of Pollards Rho, Fermat, and Euler

efnfinal is a combination of Euler, Fermat and a brute force mechanism 
   which is faster than Euler but slower (sometimes) than Fermat, though
   sometimes faster. Euler is not always successful but Fermat is and the 
   other is.  Finding the initial parameters is the real problem.  I.e., 
   the starting point for the search.  I still think there should be a
   way to find better starting numbers and that is what I am looking for.
   
   

