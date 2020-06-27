# semiprimefactor
some simple programs to factor semiprimes

I am interested in semiprimes - mostly due to RSA encryption but 
they have an interest outside of that as well.  I am interested
in simple number factoring programs.  I have a bunch I have been
working on but am uploading them slowly.  The only really original
one is the ldnfinal.gp.  Pollard's Rho is fun as well.  Chosing 
the starting 3 factors for this particular implementation is a
interesting challenge. (Sorry for using the word interesting too
much.) With the right starting factors, any number could be factored
quickly.  But I have not really found good general starting factors 
nor any method for chosing good factors - have found bad ones.
The ldnfinal.gp is actually faster than pollard's rho in many
situations. Of course if you really want speed you want the
cado-nfs program which is not located on github but is located
on https://gitlab.inria.fr

the language is Pari gp which I found to be much faster than 
Python - especially with large numbers.  I am a fan of Python
though really a fan of any language except java.



