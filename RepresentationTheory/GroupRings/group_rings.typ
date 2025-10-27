#import "../../utils.typ": *

== Group Rings

#definition(title:"Group Ring")[
  Let $R$ be a ring, and $G$ be a group.
  The group ring $R G$ is a ring defined as:
  $
    R G = {
      f: G -> R | f "has finite support"
    }
  $
  which is the set of all functions from $G$ to $R$
  s.t. $f(g) neq 0$ for only finitely many $g in G$.
  The addition and multiplication are defined as follows:
  - Pointwise Addition: for $f, h in R G$, define
    $(f + h)(g) = f(g) + h(g)$ for all $g in G$.
  - Convolutional Multiplication: for $f, h in R G$, define
    $(f h)(g) = sum_(x y = g) f(x) h(y)$ for all $g in G$.

  Equivalently, the group ring $R G$ can be viewed as the set of all formal sums
  $    sum_(g in G) r_g g
  $  where $r_g in R$ and $r_g neq 0$ for only finitely many $g in G$.
  The addition and multiplication are defined as follows:
  - Pointwise Addition: for $sum_(g in G) r_g g, sum_(g in G) s_g g in R G$, define
    $    (sum_(g in G) r_g g) + (sum_(g in G) s_g g)
      = sum_(g in G) (r_g + s_g) g
  $ - Convolutional Multiplication: for $sum_(g in G) r_g g, sum_(g in G) s_g g in R G$, define
    $    (sum_(g in G) r_g g) (sum_(g in G) s_g g)
      = sum_(g in G) (sum_(x y = g) r_x s_y) g
  $
]

Note that if $R$ is a field $k$,
then the group ring $k G$ becomes a vector space over $k$.

And there is a natural embedding of $G$ into $R G$,
which sends each $g in G$ to the function $f_g in R G$ defined as
$  f_g (x) =
    cases(
      1 &"if" x = g,
      0 &"otherwise"
    )
$

And the embedding introduce a injective group homomorphism from $G$ to $R G^times$.
And from now on, we use $g$ to denote both the group element and its image in $R G$.

#proposition[
  Let $k$ be a field, and $V$ a vector space over $k$,
  and $G$ a group.
  #enum(
    enum.item[
      If we have a group representation $rho: G -> GL(V)$,
      then $V$ becomes a $k G$-module via:
      $
        f dot v = sum_(g in G) f(g) rho(g)(v)
      $
    ],
    enum.item[
      If we have a $k G$-module structure on $V$,
      then we have a group representation $rho: G -> GL(V)$ via:
      $
        rho(g)(v) = g dot v
      $
    ],
    enum.item[
      The two constructions above are inverse to each other.
    ]
  )
] <kG-module-structure-on-V>
#proof[
  The proof is straightforward verification of the definitions.
]

#definition(title: "Left Regular Representation")[
  Let $k$ be a field, and $G$ a group.
  The left regular representation of $G$ over $k$ is the group representation
  $  rho: G -> GL(k G)
  $
  defined as
  $  rho(g)(f) = g dot f
  $
  for all $g in G$ and $f in k G$.

  This is equivalent to saying that,
  the representation $rho: G -> GL(k G)$ corresponding to
  the free $k G$-module of rank $1$ in the sense of Proposition
  @kG-module-structure-on-V.
]

Since we could transfer the study of group representations
to the study of modules over group rings,
all the terminologies in group representation theory
have their analogues in module theory over group rings.
And we have some quite interesting results just by looking at the module theory.

#proposition[
  A homomorphism between two group representations
  $rho_1: G -> GL(V_1)$ and
  $rho_2: G -> GL(V_2)$
  is the same as a homomorphism between the corresponding
  $k G$-modules $V_1$ and $V_2$.
]
#proof[
  Just unwrap the definitions.
]

#definition(title: "Simple Module")[
  Let $R$ be a ring,
  and a $M$ be a left $R$-module.
  We say that $M$ is an #highlightIndex("simple module")
  (or #highlightIndex("irreducible module"))
  if $M$ has no nontrivial proper submodules,
  i.e., the only submodules of $M$ are $0$ and $M$ itself.
]

#definition(title: "Semisimple Module")[
  Let $R$ be a ring,
  and a $M$ be a left $R$-module.
  We say that $M$ is a #highlightIndex("semisimple module")
  (or #highlightIndex("completely reducible module"))
  if $M$ is the direct sum of irreducible submodules.
]

#definition(title: "Semisimple Ring")[
  Let $R$ be a ring.
  We say that $R$ is a left #highlightIndex("semisimple ring")
  if itself is semisimple as a left $R$-module.
]

And we already have Maschke's theorem about semisimplicity of group rings.
#theorem(title: "Maschke's Theorem")[
  Let $k$ be a field, and $G$ a finite group.
  If the characteristic of $k$ does not divide the order of $G$,
  then the group ring $k G$ is semisimple.
]

#definition(title:"Cyclic Module")[
  Let $R$ be a ring,
  and $M$ be a left $R$-module.
  We say that $M$ is a #highlightIndex("cyclic module")
  if there exists an element $m in M$
  such that $M = R dot m$.
]

#definition(title: "Annihilator")[
  Let $R$ be a ring,
  and $M$ be a left $R$-module.
  For any subset $S subseteq M$,
  the #highlightIndex("annihilator") of $S$ in $R$ is defined as
  $  ann_R (S) = {
      r in R | forall s in S, r dot s = 0
    }
  $
  which is a left ideal of $R$.
  In particular, for any element $m in M$,
  we define the annihilator of $m$ as
  $ann_R (m) = ann_R ({m})$.
]

#lemma[
  Let $R$ be a ring,
  and $M$ be a cyclic left $R$-module generated by $m in M$.
  Then we have an isomorphism of left $R$-modules
  $
    M iso R \/ ann_R (m)
  $
]
#proof[
  Easy verification.
]

== Semisimple Rings and Modules

Semisimple rings have very nice structures
from the viewpoint of module theory,
and we will just list some important results here.
Some of the proofs that we omitted here could be found at @AnIntroductionToHomologicalAlgebraRotman[Chapter 4.1].

#proposition[
  If $R$ is a ring,
  a left $R$-module $M$ is semisimple
  iff every submodule of $M$ is a direct summand.
]

#lemma[
  If a ring $R$ is direct sum of left ideals,
  say, $R = directSumB_(i in I) L_i$,
  then only finitely many $L_i$ are nonzero.
]
#proof[
  Just check the unit element $1$.
]

#corollary[
  Any semisimple ring $R$ is a finite direct sum of minimal left ideals.
]

#proposition[
  Every submodule and quotient module of a semisimple module is semisimple.
]

#proposition[
  The following conditions are equivalent for a ring $R$:
  + $R$ is left semisimple.
  + Every left $R$-module is semisimple.
  + Every left $R$-module is injective.
  + Every SES of left $R$-modules splits.
  + Every left $R$-module is projective.
]

#proposition[
  If $psi: V -> W$ are $R$-module homomorphism between simple $R$-modules,
  where $R$ is a ring,
  then $psi$ is either $0$ or an isomorphism.
] <Homo-Between-Simple-Modules-Must-Be-Isomorphism-or-Zero>

#proposition[
  Let $R$ be a semisimple ring,
  then there are only finitely many non-isomorphic simple left $R$-modules.
]

The above proposition already give rise to
a pretty strong result:
#corollary[
  Let $G$ be a finite group,
  s.t. $|G|$ is not divisible by the characteristic of a field $k$.
  Then the number of non-isomorphic irreducible representations of $G$ over $k$ is finite.
]

Note, $k G$ will not be semisimple
if the characteristic of $k$ divides the order of $G$.

Following this corollary,
a big part of representation theory of finite groups
is to determine all the non-isomorphic irreducible representations
of a given finite group over a given field.
And we could define:

#definition[
  Let $G$ be a finite group,
  and $k$ a field,
  s.t. the characteristic of $k$ does not divide the order of $G$.
  The #highlightIndex($r_k (G)$) of $G$ over $k$
  is defined as the number of non-isomorphic irreducible representations of $G$ over $k$.
]

== Structure of Semisimple Algebras

We begin by some preliminary ring theory definitions.

#definition(title: "Center")[
  Let $R$ be a ring.
  The #highlightIndex("center") of $R$ is defined as
  $  Z(R) = {
      z in R | forall r in R, z r = r z
    }
  $
  which is a subring of $R$.
]

#definition(title: $k"-Algebra"$)[
  Let $k$ be a field.
  A #highlightIndex($k"-Algebra"$) is a ring $R$
  s.t. $k$ is a subring of the center $Z(R)$ of $R$.
]

#theorem(title: "Schur's Lemma")[
  Let $k$ be a algebraically closed field,
  and $R$ a $k$-algebra.
  And $M$ a simple left $R$-module
  s.t. $M$ is also a finite-dimensional $k$-vector space.
  Then $k iso End_R (M)$.
  By
  $
    lambda mapsto lambda dot id_M
  $
  for all $lambda in k$.
]
#proof[
  This map is clearly a $k$-linear ring homomorphism,
  and since ideal of $k$ are only $0$ and $k$ itself,
  the map is injective.

  And take $phi in End_R (M)$.
  $phi$ is obviously a $k$-linear map.
  Since $M$ is a finite-dimensional vector space over $k$,
  and $k$ is algebraically closed,
  $phi$ has an eigenvalue $lambda in k$.
  Then $phi - lambda dot id_M$ is also an $R$-module endomorphism of $M$,
  and it has a nontrivial kernel.
  Since $M$ is simple,
  by @Homo-Between-Simple-Modules-Must-Be-Isomorphism-or-Zero,
  we must have $phi - lambda dot id_M = 0$.
  Thus the map is surjective.
]

#definition(title: "Central Character")[
  Let $k$ be a field,
  and $R$ be a $k$-algebra.
  And $M$ be a left $R$-module s.t. $End_R (M) iso k$.
  Then, for all $z in Z(R)$,
  there is $z_V in k$,
  s.t. the morphism $z dot id_M$ corresponds to $z_V$ in the isomorphism.
  We claim that this defines a ring homo $Z(R) -> k$,
  that satisfy $z mapsto z_V$.
  And this is called the #highlightIndex("central character")
  of $M$.
]

#proposition[
  Let $R$ be a finite-dimensional semisimple $k$-algebra,
  s.t. $k$ is a algebraically closed field.
  Let $r$ be the number of the simple ideals
  of $R$ that is unique up to iso.
  Then $dim Z(R) le r$.
]
#proof[
  Let ${V_1, dots, V_r}$ be the complete set of non-iso
  simple ideals of $R$.
  By Schur's Lemma, we have $End_R (V_i) iso k$ for all $i$,
  and thus the central character are defined for all $V_i$.
  Define $phi: Z(R) to k^r$ by
  $
    z mapsto (z_(V_1), dots, z_(V_r))
  $

  Clearly, $phi$ is a $k$-linear homo,
  and we prove that $phi$ is injective.
  Take $z in Z(R)$,
  assume that $phi(z) = 0$ that is $z_(V_i) = 0$ for all $i$.
  Now note that since $R$ is semisimple, $R$ is iso to is a finite and unique
  direct sums
  of simple modules as a left $R$-module, i.e.
  $
    R iso directSumB_(i in I) V_(r_i)
  $
  where $I$ is a finite index set,
  and $V_(r_i) in {1,dots,r}$.
  And thus, there is a $e_i in V_(r_i)$, $forall i in I$,
  s.t.
  $
    1 = sum_(i in I) e_(i)
  $

  And thus
  $z = sum_(i in I) z e_(i) = sum_(i in I) z_(V_(r_i)) e_(i)
  = sum_(i in I) 0 = 0$.
]