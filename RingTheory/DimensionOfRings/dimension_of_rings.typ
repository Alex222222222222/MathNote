#import "../../utils.typ": *

== Dimension of Rings

The dimension of a ring $R$ is an invariant of a ring,
whose definition is inspired by algebraic geometry. If $R$
is the coordinate ring of an affine algebraic variety over an algebraically closed field, the dimension of $R$ is
the ordinary dimension of the variety.

#definition(title: [Dimension])[
  Let $R$ be a ring.
  The #highlightIndex[dimension] of $R$
  is
  $
    dim R := sup{
      n
      |
      frak(p)_0 supset.neq frak(p)_1 supset.neq ... supset.neq frak(p)_n,
      frak(p)_0, ... ,frak(p)_n in Spec(R)
    }
  $
  which is the supermum of the length of all the strickly descending
  prime ideal sequence.
  #index(display: [$dim R$], [dim R])

  If we are given a prime ideal $frak(p)$,
  then the #highlightIndex[codimension] or #highlight[height]
  of $frak(p)$ is
  $
    codim frak(p) := ht frak(p) := sup{
      n
      |
      frak(p) supset.neq frak(p)_1 supset.neq ... supset.neq frak(p)_n,
      frak(p)_0, ... ,frak(p)_n in Spec(R)
    }
  $
  which is the supermum of the length of all the strickly descending
  prime ideal sequence start with $frak(p)$.
  #index(display: [$codim R$], [codim R])
  #index(display: [$ht R$], [ht R])
]
#remark[
  Note that the both codimension and dimension may not be finte.
]

#lemma[
  Let $R$ be a ring,
  then for any prime ideal $frak(p)$,
  we have
  + $dim R = dim R \/ nilRadical(R)$.
  + $ht frak(p) = ht(frak(p)(mod nilRadical(R)))$
]
#proof[
  Easy check.
]
#lemma[
  Let $R$ be a ring,
  then we have
  $
    dim R = sup{
      ht frak(p) | frak(p) in Spec R
    }
  $
]
#proof[
  Easy check.
]

#lemma[
  Let $R$ be a ring and let $frak(p)$ be a prime ideal.
  Then $ht(frak(p)) = dim(R_(frak(p)))$,
  where $R_(frak(p))$
  is the localization of $R$ with the muiltiplicative set $R setminus frak(p)$.
]
#proof[
  By the localization property,
  the prime ideals in $R$ that is contained in $R$
  is in one to one correpondence with the prime ideals in $R_(frak(p))$,
  and the correpondence preserve the inclusion,
  thus by definition, $ht(frak(p)) = dim(R_(frak(p)))$.
]
Note one generalization of the lemma is:
#lemma[
  Let $R$ be a ring, and $S$ be a muiltiplicative set,
  then let $frak(p)$ be a prime ideal of $S^(-1) R$
  and let $lambda: R -> S^(-1) R$ be the localization map.
  Then $ht(frak(p))= ht(lambda^(-1) (frak(p)))$.
]

#lemma[
  Let $R$ be a ring,
  then we have
  $
    dim R = sup{
      ht frak(p) | frak(p) in Spm R
    }
  $
]
#proof[
  One direction is easy, since $Spm R subset.eq Spec R$,
  and we have $dim R ge sup{
    ht frak(p) | frak(p) in Spm R
  }$.

  For the other direction.
  Take $frak(p)_0 in Spec(R) setminus Spm(R)$.
  Then there is a maximal ideal $frak(p)$ such that
  $frak(p) supset.neq frak(p)_0$.
  And for any sequence of strickly descending
  chains of prime ideals
  $
    frak(p)_0 supset.neq frak(p)_1 supset.neq dots supset.neq frak(p)_n
  $
  The chains below is also a strickly descending
  chains of prime ideals
  $
    frak(p) supset.neq
    frak(p)_0 supset.neq frak(p)_1 supset.neq dots supset.neq frak(p)_n
  $
  Thus $ht frak(p)_0 le ht frak(p)$.
  And thus $dim R = sup{
      ht frak(p) | frak(p) in Spec R
    } le sup{
      ht frak(p) | frak(p) in Spm R
    }$.
    And we are done.
]

#definition(title: [Codimension and Height])[
  Let $R$ be a ring, and $I$ be an ideal,
  we generalise the definition of codimension of prime ideals
  to $I$
  as
  the #highlightIndex[codimension] or #highlightIndex[height]
  of $I$ is defined as
  $
    ht(I) := min{
      ht(frak(p)) | frak(p) in Spec(R), I subset.eq frak(p)
    }
  $
]
#remark[
  If $I$ is a prime ideal, then this definition
  just coincide with the previous definition.
  And if $J$ is another ideal and $I subset.eq J$,
  then $ht(I) le ht(J)$.
]

=== Transcendence Bases

#definition(title:[$k[S]$])[
  Let $k$ be a field, and $K$ be another field,
  that contains $k$,
  and let $S subset.eq K$ be a finite subset.
  We define $k[S] subset.eq K$
  to the smallest $k$-algebra that contains $k$ and $S$.
  #index(display: [$k[S]$], [k[S]])
]
#definition(title:[$k(S)$])[
  Let $k$ be a field, and $K$ be another field,
  that contains $k$,
  and let $S subset.eq K$ be a finite subset.
  We define $k(S) subset.eq K$
  to the smallest subfield of $K$ that contains $k$ and $S$.
  #index(display: [$k(S)$], [k(S)])
]
#remark[
  It is easy to check that $k(S)$ is isomorphic to hte field
  of fractions of the $k$-algebra $k[S]$,
]

#definition(title:[Algebraic])[
  If given $k$ a field,
  and any ring $R$ that is a $k$-algebra,
  then $r in R$ is called #highlightIndex[algebraic]
  if there exists a polynomial $P(t) in k[t]$,
  s.t. $P(r) = 0 in R$.
]
#definition(title:[Algebraic])[
  If given $k$ a field,
  and any ring $R$ that is a $k$-algebra,
  then $R$ is called #highlightIndex[algebraic]
  if all elements of $R$ is algebraic.
]

#lemma[
  Let $k$ be a field, and $K$ be another field,
  that contains $k$,
  and let $S subset.eq K$ be a finite subset.
  The elements of $S$ are algebraic iff
  $k(S) = k[S]$.
]
// TODO proof.

#definition(title:[Finitely Generated])[
  Let $k$ be a field, and $K$ be another field,
  that contains $k$,
  and let $S subset.eq K$ be a finite subset.
  If $k(S) = K$,
  then we say that $K$ is
  #highlightIndex[finitely generated]
  over $k$ as a field.
]
#remark[
  This is not the same as finitely generated as a $k$-algebra,
  there is subtle difference.
]

#definition(title:[Finite Transcendence Basis])[
  Let $k$ be a field, and $K$ be another field,
  that contains $k$.
  We say that $S subset.eq K$ is a
  #highlightIndex[finite transcendence basis] of $K$ over $k$ if
  + $S$ is finite.
  + the elements of $S$ are algebraically independent over $k$.
  + $K$ is algebraic over the field $k(S)$.
]