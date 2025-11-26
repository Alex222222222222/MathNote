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

#definition(title: [$k[S]$])[
  Let $k$ be a field, and $K$ be another field,
  that contains $k$,
  and let $S subset.eq K$ be a finite subset.
  We define $k[S] subset.eq K$
  to the smallest $k$-algebra that contains $k$ and $S$.
  #index(display: [$k[S]$], [k[S]])
]
#definition(title: [$k(S)$])[
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

#definition(title: [Algebraic])[
  If given $k$ a field,
  and any ring $R$ that is a $k$-algebra,
  then $r in R$ is called #highlightIndex[algebraic]
  if there exists a polynomial $P(t) in k[t]$,
  s.t. $P(r) = 0 in R$.
]
#definition(title: [Algebraic])[
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

#definition(title: [Finitely Generated])[
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

#definition(title: [Finite Transcendence Basis])[
  Let $k$ be a field, and $K$ be another field,
  that contains $k$.
  We say that $S subset.eq K$ is a
  #highlightIndex[finite transcendence basis] of $K$ over $k$ if
  + $S$ is finite.
  + the elements of $S$ are algebraically independent over $k$.
  + $K$ is algebraic over the field $k(S)$.
]

#proposition[
  Let $K$ be a field and $k subset.eq K$ a subfield.
  Suppose that $K$ is finitely generated over $k$
  as a field.
  Let $S$ and $T$ be two finite transcendence bases of $K$
  over $k$.
  Then $abs(S) = abs(T)$.
]
// TODO proof by induction on $min(abs(S), abs(T))$

#definition(title: [Transcendence Degree $tr(K | k)$])[
  Let $K$ be a field and $k subset.eq K$ a subfield.
  Suppose that $K$ is finitely generated over $k$
  as a field.
  Then by last proposition,
  we could define the
  #highlightIndex[transcendence degree] $tr(K | k)$
  #index(display: [$tr(K | k)$], [tr(K | k)])
  as the cardinality of any transcendence basis of $K$ over $k$.
]

=== The Lemma of Artin-Rees and Krull's Theorem

#definition(title: [Ring Grading])[
  Let $R$ be a ring.
  A #highlightIndex[ring grading]
  on $R$ is the datum of sequence ${R_i}_(i in NN)$
  of additive subgroup of $R$,
  s.t.
  #enum(
    enum.item[
      $R = directSum.B_(i in NN) R_i$.
    ],
    enum.item[
      $R_i R_j subset.eq R_(i+j)$,
      that is if $a in R_i, b in R_j$, then $a b in R_(i+j)$.
    ],
  )
]
#remark[
  #enum(
    enum.item[
      It is easy to check that $R_0$ carries a subring structure of $R$.
      And $1_(R_0) = 1_R$.
    ],
    enum.item[
      $directSum.B_(i ge i_0) R_i$ is an ideal of $R$, for all $i_0 in NN$.
    ],
    enum.item[
      Each $R_i$ is naturally a $R_0$ module.
    ],
    enum.item[
      $R_0 -> R \/ (directSum.B_(i ge 1) R_i)$
      is a ring iso.
    ],
    enum.item[
      $R_(i_0) -> R \/ (directSum.B_(i ge 1) R_(i_0 + 1))$
      is a $R_0$ module iso.
    ],
    enum.item[
      If $r in R$,
      we write $[r]_i$ #index(display: [$[r]_i$], [[r]\_i])
      fir the projection of $r$ to $R_i$,
      and we call it the
      #highlight[$i$-th graded componnent of $r$].
      #index(
        display: [$i$-th graded componnent of $r$],
        [i-th graded componnent of r],
      )
    ],
  )
]
#example[
  #enum(
    enum.item[
      If $R$ is a ring,
      then the ring $R[x]$
      has a natural grading given by
      $(R[x])_i = {a x^i | a in R}$.
    ],
    enum.item[
      Any ring $R$ have a #highlightIndex[trivial grading],
      that is $R_0 = R$,
      and $R_i = 0, forall i > 0$.
    ],
  )
]

#definition[
  Let $R$ be a graded ring.
  Let $M$ be a $R$-module.
  Then we call $M$ a #highlight[graded $R$-module]
  #index(display: [graded $R$-module], [graded R-moudle])
  if there is
  a grading on $M$ (relative to the grading on $R$)
  is the datum of a sequence $M_0, M_1, ...$ if additive
  subgroups of $M$,
  s.t.
  #enum(
    enum.item[
      $M = directSum.B_(i ge 0) M_i$.
    ],
    enum.item[
      $R_i M_j subset.eq M_(i+j)$.
      That is $r m subset.eq M_(i+j), forall r in R_i, m in M_j$.
    ],
  )
]

#lemma[
  Let $R$ be a graded ring with grading ${R_i}_(i in NN)$.
  The following are equivalent:
  #enum(
    enum.item[
      The ring $R$ is noetherian.
    ],
    enum.item[
      The ring $R_0$ is noetherian
      and $R$ is finitely generated as a $R_0$-algebra.
    ],
  )
]
// TODO proof

#definition(title: [Descending Filtration])[
  let $R$ be a ring and let $M$ be a $R$ mod.
  A #highlightIndex[descending filtration] or just #highlightIndex[filtration]
  $M_*$ of $M$ is a sequence of $R$ mod
  $
    M = M_0 supset.eq M_1 supset.eq M_2 ...
  $
  If $I$ is an ideal of $R$,
  then $M_*$ is said to be a $I$-filtration
  #index(display: [$I$-filtration], [I-filtration])
  if $I M_i subset.eq M_(i+1)$.
  A $I$-filtration is said to be #highlightIndex[stable]
  if $I M_i = M_(i+1)$
  for all $i$ larger than some fixed natural numbering.
]

#definition[
  Let $R$ be a ring,
  and $I$ be an ideal.
  Let ${M_i}_(i in NN)$ be a $I$-filtration of $M$.
  Then $R^\# = directSum.B_(i in NN) I^i$,
  with $I^0 = R$
  has a natural $R$-algebra structure,
  and $R^\#$ is called the #highlightIndex[blow up algebra]
  associated with $R$ and $I$.

  Then $M^\# = directSum.big_(i in NN) M_i$
  carries a natural graded $R^\#$ module structure.
  #index(display: [$R^\#$],[R^\#])
  #index(display: [$M^\#$],[M^\#])
]