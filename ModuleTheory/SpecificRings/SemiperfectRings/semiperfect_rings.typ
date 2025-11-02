#import "../../../utils.typ": *

=== Semiperfect Rings

#definition(title: "Jacobson radical")[
  If $R$ is a ring, the #highlightIndex("Jacobson radical") $J(R)$ is the intersection of all maximal left ideals of $R$.
]

#remark[
  The Jacobson radical may also be defined as the intersection of all maximal right ideals, but we may prove that the left and right Jacobson radicals coincide.
]

#remark[
  If $R$ is a field, then $R$ have no maximal ideals,
  thus the Jacobason radical is not defined.
  And follow this point, in this section,
  we assume that $R$ is not a field.
  And as long as $R$ is not a field,
  the Jacobson radical is non-empty and not the whole ring.
]

#example[
  The Jacobson radical of $ZZ$ is the zero ideal.
]

The elements in the Jacobson radical can be characterized:

#proposition[
  If $x$ is an element in a ring $R$,
  then $x in J(R)$ if and only if
  for each $a in R$,
  the element $1 - a x$ has a left inverse $R$.
] <x-in-Jacoboson-radical-1-ax-has-inverse>
#proof[
  We first show that for all $x in J(R)$,
  for all $a in R$, the element $1 - a x$ has a left inverse.
  Let $x in R$.
  Let $M$ be any maximal ideal of $R$.
  If $x$ is not in $M$, then
  as $M$ is a maximal left ideal,
  $M + (x)$ must be the whole ring $R$.
  Thus, there exists $m in M$ and $r in R$ such that
  $m + r x = 1$.
  Then by the hypothesis, $1 - r x$ has a left inverse $u$.
  That is, $u m = u(1 - r x) = 1$,
  which means $M$ is the whole ring $R$,
  a contradiction.

  Conversely, take $x in J(R)$, we show that for all $a in R$,
  the element $1 - a x$ has a left inverse.
  If $R(1 - a x)$ is not the whole ring,
  then by Zorn's lemma, there exists a maximal left ideal
  $M$ that contains $R(1 - a x)$.
  However, $x in M$ by hypothesis,
  thus $1 = 1 - a x + a x in M$,
  which means $M$ is the whole ring $R$,
  a contradiction.
  If $R(1 - a x)$ is the whole ring,
  then there exists $u in R$ such that
  $u(1 - a x) = 1$.
  Thus, $1 - a x$ has a left inverse.
]

#proposition(title: "Nakayama's Lemma")[
  #index("Nakayama's Lemma")
  If $R$ is a ring,
  and $J = J(R)$ is the Jacobson radical,
  and $M$ be a finitely generated left $R$-module,
  then if $J M = M$, then $M = 0$.
]
#proof[
  Let $\{m_1, dots, m_n \}$ be a minimal generating set of $M$,
  that is no proper subset of $\{m_1, dots, m_n \}$ generates $M$.
  Since $1 in.not J(R)$, and $m_1 in M$,
  we have non-trivial $j_1, dots, j_n in J$ such that
  $ m_1 = j_1 m_1 + dots + j_n m_n . $
  Thus, we have $(1-j_1)m_1 = j_2 m_2 + dots + j_n m_n$.
  And by preview proposition, $1 - j_1$ has a left inverse,
  say $u$.
  Then we have $m_1 = u(j_2 m_2 + dots + j_n m_n)$.
  Thus, $m_1$ is in the submodule generated
  by $\{m_2, dots, m_n\}$,
  which contradicts the minimality of $\{m_1, dots, m_n\}$.
  Thus, $M = 0$.
]

#remark[
  The finitely generated condition in the Nakayama's lemma is essential.
  If $M$ is not finitely generated,
  counter examples can be constructed.
  However, if we pose extra conditions on $R$,
  and $M$,
  the Nakayama's lemma can be generalized.
]

#lemma[
  If $R$ is a left artinian ring,
  and $J = J(R)$ is the Jacobson radical,
  and $M$ be a left ideal of $R$,
  then if $J M = M$, then $M = 0$.
]
#proof[
  If $M eq.not 0$,
  Then, take $cal(F) = \{
      I "left ideal of" R | J I eq.not 0
  \}$.
  We may assume that $cal(F)$ is non-empty,
  since $M in cal(F)$

  Since $R$ is left artinian,
  we may assume that $cal(F)$ have a minimal element,
  say $I$. Then $J I eq.not 0$.
  And we could take $x in I$ such that $J x eq.not 0$.
  Also $J x subset.eq I$,
  and by the condition that $I$ is minimal,
  we have $J x eq I$.
  Thus, $I$ is finitely generated,
  and by the Nakayama's lemma, $I = 0$,
  a contradiction.
]


#proposition[
  Let $R$ be a left artinian ring, then
  + $J = J(R)$ is nilpotent; that is there is $n > 0$ with $J^n = 0$.
  + If $a in J$, then $a^n = 0$ for some $n > 0$.
] <Jacobason-of-artinian-ring-is-nilpotent>
#proof[
  #enum(
    enum.item[
      Since $J^(n+1) subset.eq J^n$,
      we may create a descending sequences of ideals of $R$:
      $
        J^1 supset.eq J^2 supset.eq dots supset.eq J^n supset.eq dots.
      $
      As $R$ is left artinian,
      the sequences must stablize, which means there exists $n$
      such that $J^n = J^(n+1)$.
      And by previous lemma, we have $J^n = 0$.
    ],
    enum.item[
      As we already prove part 1.
      Choose $n$ such that $J^n = 0$.
      Then for all $a in J$,
      $a^n in J^n = 0$.
      Thus $a^n = 0$.
    ]
  )
]

#definition[
  An #highlightIndex("idempotent") in a ring $R$
  is an element $e$ with $e^2 = e$.
  If $I$ is a two sieded ideal in a ring $R$,
  then an idempotent $g + I in R\/I$ can be #highlightIndex("lifted mod") $I$
  if there is an idempotent $e in R$
  such that $e + I = g + I$.
]

#remark[
  $I$ is required to two sided, since if not, then $R\/I$ may not exist. 
]

#proposition[
  If $R$ is left artinian with $J = J(R)$ be the Jacobason radical,
  then all idempotent in $R\/J$ can be lifted mod $J$.
] <R-artinian-J-Jacobason-radical-all-idempotent-can-be-lifted-mod-J>
#proof[
  Since $R$ is left artinian,
  by previous proposition, there exists $n$ such that $J^n = 0$.
  Take a idempotent $g + J in R\/J$.
  We have $g + J = (g + J)^2 = g^2 + J$.
  Thus $g - g^2 in J$.
  Thus:
  $
    0 &= (g-g^2)^n \
      &= sum_(i=0)^n (-1)^(n-i) binom(n,i) g^(i + 2(n-i)) \
      &= sum_(i=0)^n (-1)^(n-i) binom(n,i) g^(2n-i) \
      &= g^n + sum_(i=0)^(n-1) (-1)^(n-i) binom(n,i) g^(2n-i) \
      &= g^n - g^(n+1) sum_(i=0)^(n-1) (-1)^(n-i-1) binom(n,i) g^(n-i -1).
  $

  Take $h = sum_(i=0)^(n-1) (-1)^(n-i-1) binom(n,i) g^(n-i -1)$,
  then $g^n = g^(n+1)h$ and $g h = h g$.

  Define $e = g^n h^n$.
  Then $g^n h^n = g^(n+1)h^(n+1)$.
  And thus by induction,
  we have $g^n h^n = g^(2n)h^(2n)$.
  Thus, $e^2 = g^(2n)h^(2n) = g^n h^n = e$.

  Next, we prove $g + J = e + J$.
  Since $g + J = g^2 + J$,
  by induction, we have $g + J = g^n + J$.
  Thus, $
    g + J &= g^n + J \
      &= g^(n+1)h + J \
      &= (g^(n+1) + J)(h+J) \
      &= (g+J)(h+J) \
      &= g h + J.
  $

  Therefore: $
    g + J &= g^n + J \
      &= (g + J)^n \
      &= (g h + J)^n \
      &= g^n h^n + J \
      &= e + J.
  $
]

#definition(title: "local")[
  A (not necessarily commutitve ring) is called
  #highlightIndex("local ring")
  if it has a unique maximal left ideal.
]
#remark[
  I appears that local ring should be called left local ring,
  but it can be proved that if a ring have a unique maximal left ideal,
  then it must have a unique maximal right ideal,
  and these two ideals coincide as the Jacobason radical.
  Thus, the left local and right local coincide.
]

#proposition[
  Let $R$ be a local ring with maximal left ideal $J$.
  If $r in R$ and $r in.not J$, then $r$ has a left inverse in $R$.
] <proposition-r-not-in-J-inverse>
#proof[
  Let $I = R r$ be a left ideal.
  If $I = R$, then the proposition have already been proved.
  If not, then by Zorn's Lemma,
  there exists a maximal left ideal $M$ such that $I subset.eq M$.
  As $R$ is local, $M = J$, thus $I subset.eq J$, contradicts $r in.not J$.
]

#proposition[
  Let $R$ be a local ring with maximal left ideal $J$,
  then $J$ is a two-sided ideal and $R \/ J$ is a division ring.
]
#proof[
  We first prove that $J$ is a two sided ideal.
  If $J$ is not a right ideal,
  then there exists $r in R$ and $j in J$ such that $j r in.not J$.
  Then by previous proposition $j r$ has a left inverse, say $a$.
  Now $a j r = 1$.
  Take finitely generated left $R$-module $I = R r$.
  Then $I = R$ since $a j r = 1$.
  Also $J I = R$ also since $a j i = 1$.
  Therefore $J I = I$, and by Nakayama's Lemma,
  $I = 0$, contradicts $I = R$.

  Next, we prove that $R \/ J$ is a division ring.
  For $a + J in R \/ J$ such that $a in.not J$,
  then $a + J eq.not 0 + J$.
  Then by previous lemma, there exists $b$ such that $b a = 1$.
  Then $(b + J)(a + J) = 1 + J$,
  which proves that $R \/ J$ is a division ring.
]

#theorem[
  Given a local ring with maximal left ideal $J$.
  And a finitely generated left $R$ module $M$,
  that have a minimal set of generaters $\{
    m_1, m_2, dots, m_n
  \}$.
  And a free left $R$ module $F$ that has generaters
  $\{
    x_1, x_n, dots, x_n  
  \}$.
  Define $phi: F arrow M$ by:
  $phi(x_i) = m_i$ for all $i$.
  Then $ker phi subset.eq J F$.
] <theorem-local-ring-F-to-finitely-generated-module>
#proof[
  If $ker phi subset.not.eq J F$, then there exists
  $sum r_i x_i in ker phi$ s.t. $sum r_i x_i in.not J F$. 
  And at least one of $\{r_1, r_2, dots, r_n\}$ is not in $J$.
  WLOG, we assume that $r_1 in.not J$.
  Then by @proposition-r-not-in-J-inverse,
  there exists $a$ s.t. $a r_1 = 1$.
  Then:
  $
    a sum r_i x_i &= sum a r_i x_i \
    &= x_1 + sum_(i=2)^n a r_i x_i .
  $

  Also:
  $
    0 &= a phi(sum r_i x_i) \
    &= phi(a sum r_i x_i) \
    &= phi(x_1 + sum_(i=2)^n a r_i x_i) \
    &= m_1 + sum_(i=2)^n a r_i m_i.
  $
  
  Thus $m_1 = - sum_(i=2)^n a r_i m_i$.
  And this contradicts the minimality of $\{m_1, dots, m_n\}$.
] 

#theorem[
  If $R$ is a local ring,
  then any finitely generated projective module of $R$ is free. 
]
#proof[
  Let $F$ and $phi$ be defined similar to
  @theorem-local-ring-F-to-finitely-generated-module.
  Let $K = ker phi$. And we have the following commutative diagram:
  #align(center, commutative-diagram(
    node((0, 1), [$K$]),
    node((0, 2), [$F$]),
    node((0, 3), [$M$]),
    node((0, 0), [$0$]),
    node((0, 4), [$0$]),
    arr((0, 1), (0, 2), []),
    arr((0, 2), (0, 3), []),
    arr((0, 0), (0, 1), []),
    arr((0, 3), (0, 4), []),
    arr((0, 2), (0, 3), [$phi$]),
  ))

  As $M$ is projective, we may assume that $F = K directSum M$.
  Thus $J F = J K directSum J M$, also we have $K subset.eq J F$.
  Thus $J K subset.eq K subset.eq J F$.
  Thus, by knowledge in module theory,
  we have $K = J K directSum (K inter J M)$.
  However,$K inter M = 0$ by hypothesis,
  thus, $K inter J M = 0$.
  And thus $K = J K$.
  As $K$ is a summand of free module, it must be finitely generated.
  Thus, by Nakayama's Lemma,
  we have $K = 0$, and thus $M = F$ is a free module.
]
#remark[
  Further knowledge in the module theory may give
  "projective module of a local ring is free.".
]

#definition(title: "superfluous")[
  A submodule $S$ of a module $M$ is
  #highlightIndex("superfluous")
  if whenever $L subset.eq M$ and $L + S = M$,
  then $L = M$.
]
#remark[
  Superfluous module is also called
  #highlightIndex("nongenerators"),
  for if $S$ is superfluous submodule of $M$,
  and $M = chevron.l x_1, dots, x_n, s_1, dots, s_k chevron.r$
  s.t. $s_1, dots, s_K in S$,
  then $M = chevron.l x_1, dots, x_n chevron.r$.
]

#lemma[
  If $S$ is a superfluous submodule of $M$,
  then any submodule of $S$ is a superfluous submodule of $M$.
]
#proof[
  Trivial.
]

#lemma[
  Let $S$ be superfluous in $M$.
  If $M subset.eq N$, then $S$ is superfluous in $N$.
]
#proof[
  Take $L subset.eq N$ s.t. $L + S = N$.
  As $M = M inter (L + S) = M inter L + S$,
  and $S$ superfluous in $M$,
  we have $M inter L = M$,
  and thus $M subset.eq L$.

  Now, $S subset.eq M subset.eq L$,
  thus $L + S = L$, and we have $L = N$.
]

#lemma[
  If $S_i$ is superfluous in $M_i$ for $i = 1, dots, n$,
  then $directSum.B S_i$ is superfluous in
  $directSum.B M_i$.
] <sum-of-superfluous-is-superfluous>
#proof[
  We prove the case for $n = 2$,
  and all the other cases should follow by induction.

  Take $N subset.eq M_1 directSum M_2$ s.t. 
  $N + S_1 directSum S_2 = M_1 directSum M_2$.
  As now $S_1 inter S_2 = 0$,
  we have $S_1 directSum S_2 = S_1 + S_2$.
  And $N + S_1 + S_2 = M_1 directSum M_2$.
  By previous lemma, $S_2$ is superfluous in
  $M_1 directSum M_2$,
  thus $N + S_1 = M_1 directSum M_2$.
  And again by previous lemma,
  $S_1$ is superfluous in $M_1 directSum M_2$,
  thus $N = M_1 directSum M_2$.
]

#lemma[
  Let $R$ be a ring with Jacobason radical $J$,
  if $M$ is a finitely generated left $R$-module,
  then $J M$ is superfluous in $M$.
] <J-Jacobason-M-finitely-generated-JM-superfluous>
#proof[
  Take $N$ be a submodule of $M$ s.t. $N + J M = M$.
  And we have $
    M \/ N &= (N + J M ) \/ N \
    &= J (M \/ N).
  $

  Also, $M \/ N$ is finitely generated,
  as it is a quotient of finitely generated module.
  Then by Nakayama's Lemma,
  $M \/ N = 0$, and we have $M = N$.
]


#definition[
  A #highlightIndex("projective cover")
  of a module $B$ is an ordered pair $(P, phi)$,
  where $P$ is projective and $phi: P -> B$
  is a surjective map with $ker phi$
  a superfluous submodule of $P$.
]
#remark[
  The projective cover is kind of dual with injective envelope.
]
#example[
  The $ZZ$-module $II_2$ does not have a projective cover.
  If $(F,phi)$ is a projective cover of $II_2$,
  and $II_2 = \{0,1\}$.
  Then take $x in F$ s.t. $phi(x) = 1$.
  Then $phi(x) = phi(3x)$,
  and it is easy to verify that $F = ker phi + chevron.l 3x chevron.r$.
  As $ker phi$ is now superfluous,
  $chevron.l x chevron.r subset.eq F 
    = chevron.l 3x chevron.r subset.eq chevron.l x chevron.r$,
  which is not possible, as $F$ is projective.
]

#theorem[
  If $R$ is a local ring with a maximal left ideal $J$,
  and $M$ is a finitely generated left $R$-module,
  then $M$ have a projective cover $(P, phi)$,
  such that $P$ is finitely generated free,
  and $ker phi subset.eq J F$.
]
#proof[
  Let $F$ and $phi$ be defined similar to
  @theorem-local-ring-F-to-finitely-generated-module.
  Let $K = ker phi$.
  Then $K subset.eq J F$
  And we have the following commutative diagram:
  #align(center, commutative-diagram(
    node((0, 1), [$K$]),
    node((0, 2), [$F$]),
    node((0, 3), [$M$]),
    node((0, 0), [$0$]),
    node((0, 4), [$0$]),
    arr((0, 1), (0, 2), []),
    arr((0, 2), (0, 3), []),
    arr((0, 0), (0, 1), []),
    arr((0, 3), (0, 4), []),
    arr((0, 2), (0, 3), [$phi$]),
  ))

  Now $phi$ is surjective.
  And by @J-Jacobason-M-finitely-generated-JM-superfluous
  $J F$ is superfluous in $F$,
  and $K subset.eq J F$,
  thus $K$ is superfluous in $F$.
  And this proves $(F, phi)$ is the desired projective cover.
]

#definition[
  A ring $R$ is called #highlightIndex("left perfect")
  if every left $R$-module has a projective cover.
  A ring $R$ is called #highlightIndex("semiperfect")
  if every finitely generated left $R$-module has a projective cover.
]
#remark[
  A left perfect ring may not be right perfect.
  But a left semiperfect ring is right semiperfect,
  so we will just use semiperfect.
]

#lemma[
  Let $(P, phi)$ be a projective cover of a module $B$.
  If $Q$ is projective and $psi: Q -> B$ is surjective,
  then any lifiting $sigma: Q -> P$ is surjective.
  Moreover, $P$ is isomorphic to a direct summand of $Q$.
  #align(center, commutative-diagram(
    node((1, 1), [$B$]),
    node((1, 2), [$0$]),
    node((1, 0), [$P$]),
    node((0, 1), [$Q$]),
    arr((0, 1), (1, 1), [$psi$]),
    arr((1, 1), (1, 2), []),
    arr((1, 0), (1, 1), [$phi$], label-pos: right),
    arr((0, 1), (1, 0), [$sigma$], label-pos: right, "dotted"),
  ))
]
#proof[
  Since $Q$ is projective,
  a lifting $sigma: Q -> P$ that make the diagram commut
  is always exists,
  and give any such lifiting $sigma$.
  We prove that $im sigma = P$, than is $sigma$ is surjective.
  Take $p in P$,
  since $psi$ surjective,
  there exists $q in Q$ s.t. $psi(q) = phi(p)$.
  As the diagram is commutative, we have
  $psi(q) = phi sigma (q)$.
  Thus $phi(p) = phi sigma (q)$,
  so $p - sigma(q) in ker phi$.
  Therefore we can represent any $p in P$ by sum of
  a element in $im sigma$ and a element in $ker phi$.
  Thus $P = im sigma + ker phi$.
  As $(P, phi)$ is a projective cover,
  we have $P = im sigma$.

  Now, we also have the following diagram:
  #align(center, commutative-diagram(
    node((0, 2), [$Q$]),
    node((0, 3), [$P$]),
    node((0, 4), [$0$]),
    node((0, 1), [$ker sigma$]),
    node((0, 0), [$0$]),
    arr((0, 0), (0, 1), []),
    arr((0, 1), (0, 2), []),
    arr((0, 2), (0, 3), [$sigma$]),
    arr((0, 3), (0, 4), []),
  ))
  As $P$ is projective,
  $Q = ker sigma directSum P$.
]
#remark[
  By this lemma, we can derive that the projective cover is unique
  up to isomorphism.
]

#proposition[
  Given module $P$ and $Q$,
  if $P$ have either chain condition.
  And $P$ is isomorphic to a summand of $Q$,
  and $Q$ isomorphic to a summand of $P$,
  then $P$ and $Q$ are isomorphism.
]
#proof[
  Let $P tilde.rev.equiv Q_1 directSum A_1$
  and $Q tilde.rev.equiv P_1 directSum B_1$,
  where $P tilde.rev.equiv P_1$ and 
  $Q tilde.rev.equiv Q_1$.
  Then $
    P
    &tilde.rev.equiv Q_1 directSum A_1 \
    &tilde.rev.equiv P_1 directSum B_1 directSum A_1 \
    &tilde.rev.equiv Q_1 directSum A_1 directSum B_1 directSum A_1 \
    &tilde.rev.equiv P_1 directSum B_1
    directSum A_1 directSum B_1 directSum A_1
  $

  And through induction, we could get,
  for $n in NN$
  $
    P tilde.rev.equiv P_n directSum.B_(i=1)^n (
      B_1 directSum A_1
    )
  $
  where $P_n tilde.rev.equiv P$.
  And it is easy to check that $P_n subset.eq P_(n-1)$.

  If $P$ has DCC, then
  $
    P tilde.rev.equiv P_1 supset.eq P_2
    supset.eq P_3 supset.eq dots
  $
  As $P$ have DCC, the sequences must end, which gives
  $P_n = P_{n-1}$ for some $n$,
  and that applies $B_1 directSum A_1 = 0$.
  Thus $P$ is isomorphic to $Q$.

  If $P$ has ACC, then
  $
    0 subset.eq B_1 directSum A_1
    subset.eq directSum.B_(i=1)^2 (
      B_1 directSum A_1
    ) subset.eq dots subset.eq P
  $
  As $P$ has ACC, the sequence must ends,
  and that applies $B_1 directSum A_1 = 0$.
  Thus $P$ is isomorphic to $Q$.
]
#proposition[
  Given projective cover $(P, phi)$ cover of a finitely generated
  module $M$, then $P$ must also be finitely generalized.
]
#proof[
  If $P$ is not finitely generated,
  assume $cal(P)$ is a generating set of $P$,
  and $\{m_1,m_2,dots,m_n\}$ is a generating set of $M$.
  As $phi$ is surjective, take $\{p_1,p_2,dots,p_n\}$ such that
  $phi(p_i) = m_i$ for all $i$.
  As $\{p_1,p_2,dots,p_n\}$ is a finite subet of $P$,
  there must be a finite subset $cal(P)_1$ of $cal(P)$
  s.t. $chevron.l cal(P)_1 chevron.r supset.eq \{p_1,p_2,dots,p_n\}$.

  We assert that $P = chevron.l cal(P)_1 chevron.r + ker phi$.
  Given any $p in P$,
  then exists $\{r_1,r_2,dots,r_n\}$ s.t.
  $phi(p) = r_1m_1 + r_2m_2 + dots + r_n m_n$.
  Also $r_1p_1 + r_2p_2 + dots + r_n p_n in chevron.l cal(P)_1 chevron.r$,
  and $phi(r_1p_1 + r_2p_2 + dots + r_n p_n) = phi(p)$,
  thus $r_1p_1 + r_2p_2 + dots + r_n p_n - p in ker phi$.
  Thus $p in chevron.l cal(P)_1 chevron.r + ker phi$.
  As $ker phi$ is superfluous $P = chevron.l cal(P)_1 chevron.r$,
  which contradicts that $P$ is not finitely generated.
]
#proposition[
  Let $R$ have either chain condition on left ideals.
  If $(P, phi)$ and $(Q, psi)$ are two projective covers
  of finitely generated left $R$ module $M$,
  then $P$ is isomorphic to $Q$.
]
#proof[
  By previous proposition, $P$ is finitely generated.
  And all finitely generated module of a ring that have either
  chain condition,
  must have either chain condition.
  And by previous lemma,
  $P$ is a summand of $Q$, and $Q$ must be a summand of $P$,
  then $P$ is isomorphic to $Q$.
]

#lemma[
  Let $R$ be an artinian ring with Jacobason radical $J$,
  and if $I$ is an nilpotent left ideal
  (there exists $n$ s.t. $I^n = 0$),
  then $I subset.eq J$.
]
#proof[
  Take $x in I$,
  then for any $r in R$,
  since $r x in I$,
  there exists $n$ s.t. $(r x)^n = 0$.
  Then $
    (1+ r x + (r x)^2 + dots + (r x)^(n-1))(1- r x) = 1- (r x)^n  = 1.
  $
  Then by @x-in-Jacoboson-radical-1-ax-has-inverse,
  $x in J$.
]

#lemma[
  Given a ring $R$,
  with Jacobason radical $J = 0$,
  if $S$ is a simple left ideal of $R$,
  then there exists $e in S$,
  s.t. $e$ is idempotent,
  and $e eq.not 0$.
] <there-exists-idempotent-in-simple-module>
#proof[
  We have $S^2$ a submodule of $S$,
  since $S$ is simple,
  $S^2 = 0$ or $S^2 = S$.
  If $S^2 = 0$, then $S subset.eq J = 0$, contradiction.
  Thus $S^2 = S$.
  We assert that there exists $a in S$,
  s.t. the homomorphism $phi: S -> S$,
  defined by $phi_a (x) = x a$ is a surjection.
  As for any $a in S$,
  we have $im phi_a$ as a submodule of the simple module $S$,
  thus $im phi_a = 0$ or $im phi_a = S$.
  If $im phi_a = S$ for some $a$, then we get the desired $a$,
  otherwise, if $im phi_a = 0$ for all $a$, then $S^2 = 0$,
  contradiction.

  Take $a$ s.t. $phi_a$ is a surjection.
  Then $phi_a$ is also a injection,
  since again $ker phi_a$ is a submodule of $S$,
  and $ker phi_a = S$ will lead to $im phi_a = 0$.
  Thus $ker phi_a = 0$.

  And therefore, there exists $0 eq.not e in S$ s.t. $phi_a (e) = a$,
  i.e. $e a = a$. Thus $phi_a (e^2 - e) = e e a - e a = e a - e a = 0$.
  And we get $e^2 = e$.
]

#lemma[
  Given a ring $R$,
  if $e in R$ is an idempotent,
  then $R e$ is a direct summand of $R$.
] <e-idempotent-Re-direct-summand>
#proof[
  We have $R = R e directSum \{
    r divides r e = 0
  \}$.
  As for any $r in R$,
  we have $r = r e + (r - r e)$.
  And $r e in R e$,
  and $(r - r e) e = r e - r e = 0$.
  Also $
  R e inter \{
    r divides r e = 0
  \} = \{
    r e divides r e e = 0
  \} = \{
    r e divides r e = 0
  \} = 0.
  $
  Thus $R e$ is a summand of $R$.
]

#lemma[
  A artinian ring $R$ is semisimple if and only if the Jacobason radical $J$
  of $R$ is trivial.
]
#proof[
  If $R$ is a semisimple ring,
  then $
    R = directSum.B_(alpha in A) S_alpha
  $
  where $S_alpha$ are simple left ideals of $R$.
  Then the maximal ideals of $R$ are
  $
    \{
      directSum.big_(beta in A without \{alpha\}) S_beta
      divides alpha in A
    \},
  $
  and it should be obvious that $J = 0$.

  If $J = 0$, take any simple left ideal $S$ of $R$,
  by @there-exists-idempotent-in-simple-module, there exists $e in S$,
  s.t. $e^2 = 0$.

  It is also easy to derive that $R e= S$.
  And finally, by @e-idempotent-Re-direct-summand
  $S$ is a direct summand of $R$.

  Take $\{
    S_alpha divides alpha in A  
  \}$, to be the collection of all simple submodule.
  It is easy to check that $S_alpha inter S_beta = 0$ if $alpha eq.not beta$.
  And it is also easy to check that $R = directSum.b_(alpha in A) S_alpha$.
  Thus $R$ is semisimple.
]

#corollary[
  Given a artinian ring $R$,
  and the Jacobason radical $J$ of $R$,
  then $R \/ J$ is semisimple.
]
#proof[
  It is easy to check that $R \/ J$ is artinian,
  and the maximal left modules of $R \/ J$ is in correspondence
  with the maximal left modules of $R$,
  and the Jacobason radical of $R \/ J$ is $0$.
]

#lemma[
  Given a artinian ring $R$,
  and the Jacobason radical $J$ of $R$,
  and a simple ideal $S$ if $R \/ J$,
  then $S$ is a $R$ module, and there exists
  a $R$ projective cover of $S$.
] <R-artinian-simple-module-of-R-quotient-J-have-projective-cover>
#proof[
  The statement that $S$ is a $R$ module is trivial.

  Also, by @there-exists-idempotent-in-simple-module,
  there exists $0 eq.not e + J in R \/ J$ s.t. $e + J$ is an idempotent.
  And by @R-artinian-J-Jacobason-radical-all-idempotent-can-be-lifted-mod-J,
  $e$ can be lifted s.t. there exists idempotent $e' in R$,
  s.t. $e' + J = e + J$.
  And by @e-idempotent-Re-direct-summand
  $R e'$ is a direct summand of $R$, thus projective.
  Define $phi: R e' -> S$ by $phi(x) = x + J$.
  We assert that $(R e', phi)$ is a projective cover of $S$.

  The submodule $R(e' + J)$ of $S$ is either trivial or $S$,
  since $e' + J = e + J eq.not 0$, we have $R(e' + J)$ not trivial.
  Thus $R(e' + J) = S$, and $forall s + J in S$,
  there exists $r in R$ s.t. $r e' + J = s + J$,
  and obviously $r e' in R e'$, and $phi(r e') = r e' + J$.
  Thus $phi$ is surjective.

  And it is easy to verify that $ker phi = J e'$.
  Since $J e' = J R e'$ and also by
  @J-Jacobason-M-finitely-generated-JM-superfluous,
  we have $J e'$ superfluous in $R e'$.
  Thus $(R e', phi)$ is a projective cover of $S$.
]

#theorem[
  Every left artinian ring $R$ is semiperfect.
]
#proof[
  Given a finitely generated module $M$.
  The module $M \/J M$ is a $R \/ J$ module.
  Since $R \/ J$ is semisimple by previous corollary,
  we have $M \/J M$ semisimple.
  And thus $M \/J M$ is a sum of simple $R \/ J$-modules, i.e.
  $
    M \/ J M = directSum.b_(alpha in A) S_alpha .
  $

  Note that $M \/ J M = directSum.b_(alpha in A) S_alpha$
  is also true, if we regard $M \/ J M$ and $S_alpha$ as $R$-module,
  since every $R \/ J$ module and homomorphism can be naturally regarded
  as $R$ module and homomorphism.

  Since every simple ideal of a ring is isomorphic to a simple
  left ideal of the ring,
  by @R-artinian-simple-module-of-R-quotient-J-have-projective-cover
  each $S_alpha$ have a projective cover
  $(P_alpha, phi_alpha)$.
  Define $P = directSum.b_(alpha in A) P_alpha$,
  and $phi: P -> M \/ J M$ by $
    phi(r_1 + r_2 + dots + r_n) =
    phi_(alpha_1)(r_1) + phi_(alpha_2)(r_2) + dots + phi_(alpha_n)(r_n)
  $
  where $r_i in P_alpha$ for each $i$.
  It is easy to verify that $phi$ is surjective.
  And easy to verify that
  $ker phi = directSum.b_(alpha in A) ker phi_alpha$
  and by @sum-of-superfluous-is-superfluous
  $directSum.b_(alpha in A) ker phi_alpha$ is superfluous.
  Thus $(P, phi)$ is a projective.

  We also have the following commutative diagram:
  #align(center, commutative-diagram(
    node((1, 4), [$0$]),
    node((1, 3), [$M \/ J M$]),
    node((1, 2), [$M$]),
    node((0, 3), [$P$]),
    node((1, 1), [$J M$]),
    node((1, 0), [$0$]),
    arr((1, 2), (1, 3), [$"nat"$], label-pos: right),
    arr((1, 3), (1, 4), []),
    arr((0, 3), (1, 3), [$phi$]),
    arr((0, 3), (1, 2), [$psi$], label-pos: right, "dotted"),
    arr((1, 0), (1, 1), []),
    arr((1, 1), (1, 2), [$i$], label-pos: right),
  ))
  where $"nat"$ is the natural homomorphism,
  and $i$ is the injection.

  Since $"nat"$ is surjective,
  and $P$ projective, the homomorphism $phi$
  can be lifted to $psi$.
  We assert that $(P, psi)$ is a projective cover of $M$.

  It is easy to verify that $M = im psi + J M$,
  and by @J-Jacobason-M-finitely-generated-JM-superfluous
  $J M$ is superfluous, and thus $im psi = M$.
  Also $ker psi subset.eq ker phi$ and thus superfluous.
]