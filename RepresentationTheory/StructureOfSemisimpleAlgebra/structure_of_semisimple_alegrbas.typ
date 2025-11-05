#import "../../utils.typ": *

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

#definition(title: [$k$-algebra])[
  Let $k$ be a field.
  A #index(display: [$k$-algebra], "k-algebra")
  #highlight[$k$-algebra]
  is a ring $R$
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
  Now note that since $R$ is semisimple, $R$ is iso to a finite and unique
  direct sums
  of simple modules as a left $R$-module, i.e.
  $
    R iso directSum.B_(i in I) V_(r_i)
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

#lemma[
  Let $R$ be a finite-dimensional left semisimple $k$-algebra,
  s.t. $k$ is a a field.
  Let ${V_1, dots, V_r}$ be the complete set of non-iso
  simple ideals of $R$.
  As $R$ is semisimple, $R$ is iso to a finite and unique
  direct sums
  of simple modules as a left $R$-module, i.e. 
  $
    R iso directSum.B_(i in I) V_(r_i)
  $
  where $I$ is a finite index set,
  and $V_(r_i) in {1,dots,r}$.

  Define $B_j = directSum.b_(i in I, r_i = j) V_j$ for all $j in {1,dots,r}$.
  Then $B_j$ is a double-side ideal of $R$.
]<lemma:BiDoubleSideIdeal>
#proof[
  Since $B_j$ can be treat as a sub left $R$-module of $R$,
  $B_j$ is already a left $R$ ideal.

  Now if $a in R$,
  and for $j in {1,dots,r}$,
  we can identity $V_j$ as a left ideal of $R$.
  Note there might be different identification,
  as there might be muiltiple $i in I$, s.t. $r_i = j$,
  but let assume we have any of the identification.

  Define $phi: V_j to R$ by $phi(v) = v a, forall v in V_j$,
  it is easy to check that this is a left $R$-module homo.

  Now take $j' in {1,dots,r}$ s.t. $j' neq j$.
  Then there is a projection $pi: R -> V_(j')$,
  as $R$ is a direct sum.
  There might also be many such projection,
  but let $pi$ be any of it.
  Then $pi circ phi: V_j -> V_(j')$ is a homo of simple modules.
  Since $V_j niso V_(j')$, $pi circ phi$ must be $0$.
  And thus the $Img(phi)$ must be inside $B_j$,
  and we are done.
]

#proposition[
  If $R$ is a $k$-algebra,
  and $R = B_1 directSum dots directSum B_r$,
  where $B_i$ are non-zero two sided ideals.
  Then $dim Z(R) >= r$.
]
#proof[
  Since $R = B_1 directSum dots directSum B_r$,
  we have $1 = b_1 + dots + b_r$ for $b_i in B_i$.
  Now non of $b_i = 0$,
  as if $b_i = 0$.
  And we take $b in B_i$ s.t. $b neq 0$.
  Then $b = b b_1 + dots + b b_r$.
  Now $b in directSum.B_(j neq i) B_j$ since $b_i = 0$,
  a contradiction.

  Also take $a in R$,
  we have $a = a b_1 + dots + a b_r$,
  and $a = b_1 a + dots + b_r a$.
  Now $a b_i = b_i a$,
  since $R$ is a direct sum,
  all $B_i$ are disjoint.
  Thus $b_i in Z(R)$.

  Define a $k$-linear map
  $phi: k^r -> R$ by
  $
    (k_1, dots, k_r) mapsto k_1 e_1 + dots k_r e_r
  $

  Also by above discussion, 
  $Img phi in Z(R)$.

  This is also injective since,
  if $k_1 e_1 + dots k_r e_r = 0 in R$,
  then $k_i e_i = 0$ for all $i$.
  If $k_i neq 0$,
  then $1/ k_i k_i e_i = 0$,
  then $e_i = 0$, contradiction.
]

#corollary[
  Let $R$ be a finite-dimensional $k$ algebra,
  s.t. $k$ algebraically closed field.
  Let $r$ be the number of unique simple modules of $R$
  up to iso.
  Then $dim Z(R) = r$.
]

#definition(title: $s(G)$)[
  For a finite group $G$,
  let $s(G)$ denote the number of
  conjugacy classes of $G$.
]

#proposition[
  Let $G$ be a finite group,
  and $k$ a algebraically closed field,
  s.t. $|G|$ is not divisible by the character of $k$.
  Let ${G_1, dots, G_(s(G))}$ be the collection of conjugacy classes
  of $G$.
  And for each $i$, define $hat(G_i): G -> k in k G$ as 
  $
    hat(G_i)(g) = cases(
      1 &"if" g in G_i,
      0 &"otherwise"
    )
  $

  Then ${hat(G_1), dots, hat(G_(s(G)))}$ forms a basis of $Z(k G)$
  as $k$-vector space.
  And $dim Z(k G) = s(G)$.
]
#proof[
  Let $phi: G -> k G$ be the embedding injection.

  First we prove that for each $i$,
  we have $hat(G_i) in Z(k G)$,
  since every element in $k G$
  has a representation of $sum_(g in G) k_g phi(g)$,
  for $k_g in k$.
  Thus, we only need to prove that $hat(G_i)$ commute with $phi(g)$
  for each $g$.
  And note that $phi(g)^(-1) hat(G_i) phi(g)$ by definition
  is equal to
  $
    phi(g^(-1)) hat(G_i) phi(g) (h) &= sum_(g_1,g_2,g_3 in G, g_1 g_2 g_3 = h)
    phi(g^(-1))(g_1) hat(G_i)(g_2) phi(g)(g_3) \
    &= sum_(g_2 in G_i, g^(-1) g_2 g = h)
    hat(G_i)(g_2)
  $
  Since $G_i$ is a finite conjugacy class,
  $g^(-1) G_i g$ is a simple reordering,
  and $phi(g^(-1)) hat(G_i) phi(g) (h) = hat(G_i)$.

  Also, it is easy to check that ${hat(G_1), dots, hat(G_(s(G)))}$
  is linear independent, since each $hat(G_i)$ has disjoint support in $G$.

  The only thing left is to check that ${hat(G_1), dots, hat(G_(s(G)))}$
  span the whole $Z(k G)$.

  Take $sum_(g in G) k_g phi(g) in k G$,
  assume that it is inside $Z(k G)$.
  Then
  $
    sum_(g in G) k_g phi(g) &= 1/(|G|) sum_(g' in G)
      phi(g')^(-1)(sum_(g in G) k_g phi(g))phi(g') \
    &= 1/(|G|) sum_(i) ((sum_(g in G_i) k_g)(sum_(g in G_i) phi(g))) \
    &= 1/(|G|) sum_(i) ((sum_(g in G_i) k_g)hat(G_i)) \
  $
]

#corollary[
  Let $G$ be a finite group,
  and $k$ be an algebraically closed field,
  s.t. the character of $k$ does not divide $|G|$.
  Then $r_k (G) = s(G)$.
] <cor:numberOfSimpleMoudlesIsConjugacyClassOfGroupForKG>

#proposition[
  Let $R$ be a semisimple ring,
  let ${V_1,...,V_r}$ be the complete set of non-isomorphic
  simple left $R$-module.
  Then $R iso directSum.B_(i=1)^r directSum.B_(j=1)^n_i L_(i,j)$
  where $L_(i,j) iso V_i$.
  Let $B_i = directSum.B_(j=1)^n_i L_(i,j)$.
  Then there exists ${e_1, ..., e_r}$
  with $e_i in B_i$,
  and $1 = e_1 + ... + e_r$.
  Then
  #enum(
    enum.item[
      Each $B_i$ is a ring with identity element $e_i$.
    ],
    enum.item[
      R is isomorphism to the product of the rings $B_i$:
      $
        R iso B_1 times ... times B_r.
      $
    ],
    enum.item[
      Each $B_i$ is itself a semisimple ring with unique simple
      module $V_i$.
    ]
  )
] <prop:BiRing>
#proof[
  By @lemma:BiDoubleSideIdeal,
  $B_i$ are ideals.
  Thus $B_i$ already have the desired additive structure,
  and $forall a,b in B_i$, $a b in B_i$ since $B_i$
  is ideal.
  And for every $a in B_i$
  $a = a(e_1 + ... + e_r) = a e_i$,
  also $a = (e_1 + ... + e_r) a = e_i a$,
  thus $e_i a = a e_i$,
  and $e_i$ is the desired muiltiplicative identity.
  Thus $B_i$ are rings with identity element $e_i$.

  $a -> (a e_1, ..., a e_n)$ is the desired isomorphism
  for $R -> B_1 times ... times B_r$.
  Thus $R iso B_1 times ... times B_r$.

  We first prove that $V_i$ is a simple $B_i$-module.
  We could define a $B_i$ module structure on $V_i$
  by restriction.
  And if $V_i$ is not simple,
  then there is a $B_i$-module $U$ s.t. $U subset.neq V_i$.
  Define a $R$ module structure on $U$ as $a v = a e_i v$,
  $forall v in U$.
  And by the simplicity of $V_i$,
  we have $U = V_i$ or $U = 0$, contradiction.

  Then $B_i = directSum.B_(j=1)^n_i L_(i,j)$
  is semisimple.
  If $U$ is a simple $B_i$-module,
  then $U iso B_i \/ ann_(B_i) (U)$.
  And define the natural projection map
  $pi_j: L_(i,j) -> B_i \/ ann_(B_i) (U)$.
  Since each $L_(i,j)$
  is simple,
  then $pi_j$ is either $0$, or iso.
  This proves that $B_i \/ ann_(B_i) (U)$ is iso
  to a direct sums of $V_i$.
  Thus the only simple $B_i$-module is $V_i$.
]

#definition(title: [Opposite Ring])[
  Let $R$ be a ring.
  The #highlightIndex[opposite ring]
  of $R$ is a ring $R^"op"$ that have the same underlying
  abelian group structure,
  but with the multiplication $*$:
  $
    a * b = b a, forall a, b in A^"op"
  $
]

#proposition[
  Let $B$ be a semisimple ring with exactly
  one simple module
  $V$,
  up to isomorphism.
  suppose that $B iso directSum.b _(i=1)^n V$
  as a left $B$-module,
  and let $D = End_B (V)$.
  Then there is a ring iso:
  $
    B iso M_n (D ^"op")
  $
  where $M_n (D ^"op")$
  is the ring of all $n times n$ matrix with entries in $D^"op"$.
] <prop:semisimpleRingWithOnlyOneSimpleModuleIsoToMatrix>
#proof[
  It is easy to check that there is a ring iso $B iso End_B (B)^"op"$,
  where $End_B (B)$ is set of all $B$-module homo from $B$ to $B$.
  And as $B iso directSum.b _(i=1)^n V$,
  $End_B (B) iso M_n (D)$.
]

#theorem(title: [Artin-Weddernburn])[
  Suppose that $k$
  is an algebraically closed field
  and that $A$ is a finite-dimensional semisimple $k$-algebra.
  Then there exists positive integers $n_1, ... , n_r$
  and a $k$-algebra iso:
  $
    A iso M_(n_1)(k) times dots times M_(n_r)(k).
  $
  where $r$ is the number of non-iso simple $A$ module.
]
#proof[
  By @prop:BiRing,
  we we could assume $r = 1$,
  and prove for each $r = 1$ rings.
  However, by @prop:semisimpleRingWithOnlyOneSimpleModuleIsoToMatrix
  we have $A iso M_n (End_A (V)^"op")$
  for some $n$ and $V$ the only simple module
  of $A$.
  And by Schur's Lemma,
  $End_A (V) iso k$,
  and $k^"op" = k$ since $k$ is a field.
  And thus, we have the desired result.
]

#corollary[
  Suppose that $k$ is algebraically closed field.
  Let $G$ be a finite group s.t. $|G| neq 0$
  in $k$
  and let $V_1, ..., v_r$ be a complete list of non-iso
  simple $k G$-modules.
  Then
  #enum(
    enum.item[
      $k G iso V_1^(dim V_1) directSum ... directSum V_r^(dim V_r)$
      as a $k G$-module.
    ],
    enum.item[
      $|G| = sum_(i=1)^r (dim V_i) ^2$.
    ],
  )
] <cor:decompositionOfKGAsSimpleModuleVectorSpace>
#proof[
  $k G$ is a semisimple ring by Maschke's Theorem.
  And by last theorem,
  we have $k g iso M_(n_1)(k) times dots times M_(n_r)(k)$.
  For each $M_(n_i)(k)$,
  it is easy to check that the vector space $k^n$
  is the only simple $M_(n_i)(k)$-module,
  and thus $M_(n_i)(k) iso V_i$,
  and thus $dim V_i = n_i$.
  Also by linear algebra, $M_(n_i)(k)$ is
  iso to $(k^n) ^n$ as a $M_(n_i)(k)$-module.
  Thus $M_(n_i)(k) iso V_i^(dim V_i)$.

  The second part is a immediate result of the first part.
]