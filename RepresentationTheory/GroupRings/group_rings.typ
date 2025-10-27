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

== Semisimple Rings and Modules

Semisimple rings have very nice structures
from the viewpoint of module theory,
and we will just list some important results here.
The proofs could be found at @AnIntroductionToHomologicalAlgebraRotman[Chapter 4.1].

#proposition[
  If $R$ is a ring,
  a left $R$-module $M$ is semisimple
  iff every submodule of $M$ is a direct summand.
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