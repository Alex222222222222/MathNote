#import "../utils.typ": *

= Differentialble Manifold

== Manifolds

=== Topological Manifold

#definition(title: "Paracompact Space")[
  A topological space $X$ is #highlightIndex[paracompact],
  if every open conver of $X$,
  has a locally finite open sub cover.
]

#definition(title: "Second Countable Space")[
  A topological space $X$ is #highlightIndex[second countable],
  iff $X$ has a contable basis.
]

#definition(title: "Topological Manifold")[
  A topological space $X$ be a topological manifold of #highlightIndex[dimension]
  $n in NN$,
  iff
  #enum(
    enum.item[
      $X$ is Hausdorff
    ],
    enum.item[
      $X$ is second countable
    ],
    enum.item[
      For all $x in X$, there is $(U, phi)$
      s.t. $U$ is an open subset of $RR^n$,
      and $phi: U -> X$ is a homeomorphism from $U$ to $phi(U)$
    ],
  )
]

=== Smooth Manifolds

#definition(title: "Chart")[
  Let $X$ be a topological space,
  A #highlightIndex("chart") on $X$,
  of #highlightIndex[dimension] $n in NN$,
  is the pair $(U, phi)$,
  where  $U$ is a open subset of $RR^n$,
  and $phi: U -> X$ is a continuous map,
  s.t. $phi(U)$ is open, and
  is a homeomorphism from $U$ to $phi(U)$.
]

#definition(title: [Compatible Chart])[
  Tow chart $(U, phi)$ and $(V, psi)$ on topological space $X$
  with dimension $n$,
  are #highlightIndex[compatible],
  iff
  #enum(
    enum.item[
      They are of the same dimension
    ],
    enum.item[
      The map
      $
        psi^(-1) circ phi: phi^(-1)(psi(V)) -> psi^(-1)(phi(U))
      $
      is a smooth map of open sets of $RR^n$,
      with smooth inverse.
    ],
  )
]

#definition(title: [Atlas])[
  An #highlightIndex[atlas] on a topological space $X$,
  is a collection of charts ${(U_i, phi_i) | i in I}$,
  for some index set $I$,
  s.t.
  #enum(
    enum.item[
      For each $i neq j in I$,
      $(U_i, phi_i)$ and $(U_j, phi_j)$ are compatible.
    ],
    enum.item[
      ${phi(U_i) | i in I}$ is an open cover of $X$.
    ],
  )
]

#definition(title: [Maximal Atlas])[
  An atlas on a topological space $X$ is called a
  #highlightIndex[maximal atlas],
  if for any chart $(U, phi)$ on $X$,
  s.t. $(U,phi)$ is compatible with all chart in the atlas,
  then $(U,phi)$ is in the atlas.
]

#proposition[
  Given a atlas on a topological space $X$,
  there exists a unique maximal atlas that contains
  the atlas.
]

#definition[title: [Smooth Manifolds]][
  A topological space $X$ is called a #highlightIndex[smooth manifold]
  or just #highlightIndex[manifold],
  with #highlightIndex[dimension] n,
  if $X$ is Hausdorff,
  and second countable.
  And there exists a maximal atlas $cal(A)$ on $X$ with dimension n.

  A #highlightIndex[chart] $(U, phi)$ on the manifold $X$,
  is simply an element in the atlas $cal(A)$.
  A #highlightIndex[local coordinate]
  is then the funciton
  $
    phi^(-1) = (x_1, dots, x_n): phi(U) -> U subseteq RR^n
  $
]

=== Smooth Maps Between Manifolds

#definition(title: [Smooth Maps])[
  Let $X$ and $Y$ be manifolds,
  and $f: X -> Y$ continuous.
  $f$ is called #highlightIndex[smooth],
  if for every chart $(U,phi)$ on $X$,
  and $(V,psi)$ on $Y$,
  the map
  $
    psi^(-1) circ f circ phi: (f circ phi)^(-1)(psi(V)) -> V
  $
  is a smooth map.
]

#definition[title: [Diffeomorphism]][
  Let $X$ and $Y$ be manifolds,
  and $f: X -> Y$ smooth.
  $f$ is called a #highlightIndex[diffeomorphism]
  if $f$ have a smooth inverse,
  and the two manifolds $X$ and $Y$ are called #highlightIndex[diffeomorphic].
]

#lemma[
  Composition of smmoth maps between manifolds are smooth.
]

#definition(title: [Product Manifold])[
  Let $X$ and $Y$ be manifolds,
  and let $cal(A)$ and $cal(B)$ be atlas on $X$ and $Y$ resp.
  Then ${(U times V, phi times psi) | (U, phi) in cal(A), (V, psi) in cal(B)}$
  defines an atlas on $X times Y$,
  and gives $X times Y$ a manifold structure,
  we call the #highlightIndex[product manifold].
]

#lemma[
  Let $X$, $Y$, $Z$ be manifolds,
  and $f: X -> Y$, $g: X -> Z$ be smooth,
  then the map $(f,g): X -> Y times Z$ by
  $(f,g)(x) = (f(x), g(x))$ is also smooth.
]

#lemma[
  Let $W$, $X$, $Y$, $Z$ be manifolds,
  and $f: W -> Y$, $g: X -> Z$ be smooth,
  then the map $f times g: W times X -> Y times Z$ by
  $f times g(w,x) = (f(w), g(x))$ is also smooth.
]

== Tangent and Cotangent

#definition(title: [$C^infinity (X)$])[
  Let $X$ be manifold,
  define #index(display: [$C^infinity (X)$], "C^infinity (X)")
  #highlight[$C^infinity (X)$]
  to be the set of all smooth functions $X -> RR$.
  Note that $C^infinity (X)$ is naturally a $RR$-algebra,
  under pointwise addition, muiltiplication,
  and scalar muiltiplication.
]
#remark[
  $C^infinity (X)$ is quite large, if $dim X > 0$,
  then $C^infinity (X)$ have infnity dimension,
  and we can recover the manifold structure on $X$,
  just from $C^infinity (X)$.
]

=== Bump function

Given a manifold $X$,
we can construct some pretty good smooth maps on $X$,
by using #highlightIndex[bump funciton],
on a local coordinate of $X$.
We beging by construct functions on $RR^n$.

Define $a: RR -> RR$ as
$
  a(t) = cases(
    e^(-1/t) & "if" t >0,
    0 & "if" t le 0
  )
$
Then it is easy to verify that $a$ is smooth.

Define $b: RR -> RR$ as $b = a(t) / (a(t) + a(1-t))$,
then $b$ has the property that
$
  b(t) = cases(
    0 & "if" t le 0,
    1 & "if" t ge 1,
  )
$

By muiltiplication and moving and pasting of $b$,
we could define a smooth function $f: RR^m -> RR$,
that have the property that $f(x) = 0$, $forall x in.not B(0,1)$
and $f(x) = 1$, $forall x in B(0,1/2)$,
which is like a bump.

=== Partition of Unity

Using the bump function,
we could prove a big theorem,
called partition of unity.
This theorem is often used to construct good smooth functions,
with desired properties.

#theorem(title: [Partition of Unity])[
  #index[partition of unity]
  Given a manifold $X$,
  and an open cover ${U_i | i in I}$ of the manifold,
  then there exists a collection of functions ${eta_i: X -> [0,1] | i in I}$
  s.t.
  #enum(
    enum.item[
      $supp eta_i = overline({x in X | eta_i(x) > 0}) subseteq U_i$.
    ],
    enum.item[
      ${eta_i: X -> [0,1] | i in I}$ is locally finite,
      that is for any $x in X$,
      there exists an open neighbourhood $U$ of $x$,
      s.t. $eta_i |_U neq 0$ for only finitly many $i$.
    ],
    enum.item[
      $sum_(i in I) eta_i = 1$
    ],
  )
]

=== Tangent Vectors and Tangent Spaces

#definition(title: "Tangent Vector and Tangent Space")[
  A #highlightIndex[tangent vector]
  at $x$ is a linear map $v: C^infinity (X) -> RR$
  satisfy
  $
    v(a b) = a(x) v(b) + v(a) b(x), forall a, b in C^infinity (X)
  $
  And this above equation is called #highlightIndex[Leibnitz Rule]
  (similar to product rule of derivative)

  Tangent vectors form a vector space $T_x X$,
  a subspace of $Hom(C^infinity (X), RR)$,
  which is called #highlightIndex[tangent space].
]
#remark[
  A tangent vector works similar with derivative,
  and given a function in $C^infinity (X)$,
  applying the tangent vector on the funciton
  gives how fast the function goes in the direction of the tangent vector.
]

#proposition[
  Let $X$ be $n$-dimensional manifold,
  let $u in X$.
  And let $(U,phi)$ be a chart around $u$.
  And $phi(u_1, ..., u_n) = u$.
  Let $(x_1,...,x_n)= phi^(-1): X -> U$ be local coordinates
  of the chart.
  Then for each tangent vector $v in T_u X$,
  there unique $v_1, ..., v_n$ s.t.
  $
    v(a) = sum_(i=1)^k v_i partial/(partial x_i)(a circ phi)
    |_((u_1,...,u_n)) , forall a in C^infty (X)
  $

  Then whenever after we choose a chart, and local coordinates,
  ${partial/(partial x_1),...,partial/(partial x_n)}$
  form a basis of $T_u X$.
  And $T_u X$ is of dimension $n$.
]

#definition(title: [Covariantly Functorial])[
  Let $f: X->Y$ be a smooth map for manifolds
  and $x in X$ with $f(x) = y$.
  Define $T_x f: T_x X -> T_y Y$
  by $(T_x f)(v): a mapsto v(a circ f)$,
  for $v in T_x X$, and $a in C^infty (Y)$.
  This is a well-defined linear map.
  If $g: Y -> Z$ is smooth
  with $g(y) = z$.
  Then
  $
    T_X (g circ f) = T_y g circ T_x f: T_x X -> T_z Z.
  $
  So tangent spaces are #highlightIndex[covariantly functorial].
]

=== Cotangent Spaces and $1$-forms

#definition(title: [Cotangent Space and $1$-forms])[
  Let $X$ be a manifold with dimension $n$
  and $x in X$.
  Define the #highlightIndex[cotangent space] $T^*_x X$
  to be the dual vector space $(T_x X)^*$.
  Elements of $T^*_x X$ are called #highlight[$1$-forms]
  #index(display: [$1$-forms], "1-forms").

  If $(x_1,...,x_n)$ are local coordinates on $X$,
  near $x$.
  Then ${partial/(partial x_1),...,partial/(partial x_n)}$
  is a basis of $T_x X$.
  We write the corresponding
  ${d x_1, ... , d x_n}$
  as a basis for the dual space $T^*_x X$.

  If $f: X-> Y$ is smooth
  and $x in X$
  with $f(x) = y$,
  we write $T^*_x f: cotangentSpace(y, Y) -> T^*_x X$,
  for the linear map dual to $T_x f: tangentSpace(x, X) -> tangentSpace(y, Y)$.
  For $g: Y -> Z$
  smooth with $g(y) = z$,
  we have
  $T^*_x (g circ f) = T^*_x f circ T^*_y g$,
  so cotangent spaces are
  #highlightIndex[contravariantly functorial].
]

#remark[
  There is an equivalence definition for the cotangent space,
  and tangent space,
  which we will defines as follows.

  Given a manifold $X$ with dimension $n$,
  and a point $x in X$,
  with a chart $(U, phi)$ around $x$.
  And also a function $f: X -> RR$.
  Then $phi circ f: U -> RR$,
  is a continuous map between Euclidean spaces.
  And $d (phi circ f)$ is defined.
  Define $Z_x = {f in C^infty (X) | d(phi circ f) = 0}$.
  Note that the definition of $Z_x$ is independent of the choice of
  the chart by simple verification.
  And we define the cotangent space by
  $cotangentSpace(x, X) = C^infty (X) \/ Z_x$.
  And $tangentSpace(x, X) = (cotangentSpace(x, X))^*$.

  This definition is coherent with the the first definition we
  use, since the spaces are isomorphic,
  and maps between them are preserved.

  And this definition of cotangent space
  is based on the simple idea,
  that if two funciton $f, g$ that is similar around a small space
  around $x$, i.e. there exists a open neighbourhood $U$ of $x$,
  that $f|_U = g|_U$,
  then there derivative should be the same,
  that is they should be the same in the cotangent space.
  And they are actually being identified since $d (phi circ (f-g)) = 0$.
  And if two functions $f, g$ have the same derivative $d (phi circ f)$,
  and $d (phi circ g)$,
  then they should behave similar on a small neighbourhood of $x$,
  by the Taylor's theorem.

  While $Z_x$ have another identification,
  which we will state as follows.
  Let $I_x = {a in C^infty (X) | a(x) = 0}$.
  Then $I_x^2 = {a b | a, b in I_x}$.
  Then $Z_x = chevron.l 1 chevron.r directSum I_x^2$.
  Where $chevron.l 1 chevron.r$ is the subspace of $C^infty (X)$
  generated by all constant functions.
]

#definition(title: "Derivative")[
  Let $X$ be a manifold with dimension $n$,
  $x in X$,
  and $a in C^infty (X)$.
  Define the #highlightIndex[derivative] of $a$ at $x$,
  to be $d_x a in cotangentSpace(x, X)$
  the linear map $d_x a: tangentSpace(x, X) -> RR$
  s.t. $d_x a: v mapsto v(a), forall v in tangentSpace(x, X)$.
  Alternatively, under the isomorphism $cotangentSpace(x, X) = C^infty (X) \/ Z_x$,
  $d_x a$ is just $a + Z_x$.

  If we have choosen a local coordinate $(x_1,..., x_n)$ around $x$.
  Then $d_x a$ can be also represent by the natural basis of
  $cotangentSpace(x, X)$:
  $
    d_x a = (partial a)/(partial x_1)|_x d_(x_1) + dots
    + (partial a)/(partial x_n)|_x d_(x_n)
  $
]

=== Vector Bundles

#definition(title: [Vector Bundle])[
  Let $X$ be a manifold with dimension $n$.
  A #highlightIndex[vector bundle]
  $E -> X$ of #highlightIndex[rank] $k$,
  consists of:
  #enum(
    enum.item[
      A manifold $E$, of dimension $n+k$.
    ],
    enum.item[
      A smooth map $pi: E -> X$.
    ],
    enum.item[
      For each $x in X$,
      there is a structure of a $RR^k$ vector space on
      the #highlightIndex[fibre] $E_x = pi^(-1) (x) subset.eq E$,
      s.t. for every $x in X$,
      there s a open neighbourhood $x in V subset.eq X$
      and a diffeomorphism $phi: pi^(-1)(V) -> V times RR^k$,
      s.t. given the natural projection $psi: V times RR^k -> V$,
      we have $pi|_(pi^(-1)(V)) = psi circ phi$.
      And for each $v in V$,
      $phi|_(E_(v))$ defines a linear isomorphism
      $E_(v) iso {v} times RR^k$.
      #align(center, commutative-diagram(
        node((0, 0), [$E$]),
        node((0, 1), [$pi^(-1) (V)$]),
        node((0, 2), [$V times RR^k$]),
        node((1, 2), [$V$]),
        node((1, 1), [$V$]),
        node((1, 0), [$X$]),
        arr((0, 0), (1, 0), [$pi$]),
        arr((0, 1), (1, 1), [$pi|_(pi^(-1) (V))$]),
        arr((0, 2), (1, 2), [$psi$]),
        arr((0, 1), (0, 2), [$phi$]),
        arr((1, 1), (1, 2), [$id$]),
        arr((0, 1), (0, 0), [$"inclusion"$], label-pos: right, "inj"),
        arr((1, 1), (1, 0), [$"inclusion"$], "inj"),
      ))
    ]
  )
]
#example[
  The #highlightIndex[trivial vector bundle]
  is $pi: X times RR^k -> X$,
  where $pi$ is the natural projection.
]

#definition(title: "Section")[
  Let $X$ be a manifold,
  and $pi: E -> X$ a vector bundle.
  A #highlightIndex[section] of $E$ is a smooth map $s: X -> E$
  s.t. $pi circ s = id$.
  We write $gamma^infty (E)$
  #index(display: [$Gamma^infty (E)$], "Gamma^infty (E)")
  for the set of all sections of $E$.

  Take $x in X$, with the vector space structure on $E_x$,
  and local diffeomorphism of $pi^(-1) (V)$ with $V times RR$,
  where $V$ is a neighbourhood of $x$.
  We can define a vector space structure on $Gamma^infty (E)$,
  by:
  $
    (lambda s + beta t)(x) = lambda s(x) + + beta t(x)
  $
  where $lambda, beta in RR$,
  and $s,t in Gamma^infty (E)$.
]
#remark[
  In general given topological spaces $X, Y$,
  and a function $pi: X -> Y$,
  then a function $s: Y -> X$,
  s.t. $pi circ s = id$
  is always called a #highlightIndex[section],
  and the set of all sections is written as $Gamma(X, Y)$.
]

=== Tangent and Cotangent Bundles

#definition[
  Let $X$ be manifold with dimension $n$.
  As sets, define
  $
    T X &= {(x,v) | x in X, v in tangentSpace(x, X)}\
    T^* X &= {(x,v) | x in X, v in cotangentSpace(x,X)}
  $
  Also define maps:
  $
    &pi: T X -> X, &pi: (x, v) mapsto x, &forall (x, v) in T X\
    &pi: T^* X -> X, &pi: (x, v) mapsto x, &forall (x, v) in T^* X\
  $

  Let $(U, phi)$ be a chart on $X$,
  given local coordinates $(x_1,..., x_n)$ defined by the chart.
  Then we have basis ${partial/(partial x_1),...,partial/(partial x_n)}$
  for $tangentSpace(x, X)$
  and basis ${d x_1, ..., d x_n}$ for $cotangentSpace(x, X)$,
  for all $x in phi(U)$.
  Define $T phi: U times RR^n -> T X$,
  $T^* phi: U times RR^n -> T^* X$ by
  $
    &T phi: &((u_1,...,u_n),(v_1,...,v_n)) &mapsto
      (
        phi(u_1,...,u_n),
        v_1 partial/(partial x_1)+...+v_n partial/(partial x_n)
      ) \
    &T^* phi: &((u_1,...,u_n),(w_1,...,w_n)) &mapsto
      (
        phi(u_1,...,u_n),
        w_1 d x_1+...+w_n d x_n
      )
  $
  Then all $(U times RR^n, T phi)$ and $(U times RR^n, T^* phi)$
  defined like this, defines a atlas on $T X$ and $T^* X$,
  with the topology induced by the atlas.
  And this defines manifold structures on $T X$ and $T^* X$.

  Clearly $pi: T X -> X$ and $pi: T^* X -> X$
  are smooth, this makes $T X$ and $T^* X$ into vector bundles.
  Sections in $Gamma^infty (T X)$ are called #highlightIndex[vector fields].
  Sections in $Gamma^infty (T^* X)$ are called #highlight[$1$-forms]
  #index(display: [$1$-forms], "1-forms").
]

#proposition[
  Let $f: X -> Y$ be a smooth map of manifold.
  Then there is induced smooth map $T f: T X -> T Y$
  by
  $
    T f: (x, v) mapsto (f(x), T_x f (v)), forall (x,v) in T X
  $
  where $T_x f$ is the induced map
  $tangentSpace(x, X) -> tangentSpace(f(x), Y)$.

  If there is another smooth map $g: Y -> Z$,
  then the map $T g circ f = T g circ T f$ is also smooth.
]
#remark[
  If we are given a map $f: X -> Y$, then $f$ does not induce a map
  $T^* X -> T^* Y$,
  since if $f$ does induce a map,
  then the first part on $T^* X$
  is covariant,
  but the second part on $T^* X$
  is contravariant,
  which is kind of in different direction.
]

== Submersions, Immersions and Embeddings

#definition(title: "Submersion")[
  Let $f: X to Y$ be a smooth map
  of manifolds.
  We call $f$ a #highlightIndex[submersion]
  if for all $x in X$,
  $T_x f: T_x X -> T_(f(x)) Y$
  is surjective.
]
#definition(title:[Immersion])[
  Let $f: X to Y$ be a smooth map
  of manifolds.
  We call $f$ a #highlightIndex[immersion]
  if for all $x in X$,
  $T_x f: T_x X -> T_(f(x)) Y$
  is injective.

  And we call $X$ a #highlightIndex[immersed submanifold]
  of $Y$.
]
#definition(title: [Embedding])[
  Let $f: X -> Y$ be a smooth map if manifolds.
  We call $f$ a #highlightIndex[embedding],
  if $f$ is immersion,
  and the map $f: X -> f(X)$
  is a homeomorphism.

  And we call $X$ a #highlightIndex[embedded submanifold]
  of $Y$.  
]
#remark[
  Embeddings are injective immersions,
  but not all injective immersions are embeddings.
]

#proposition[
  If $f: X -> Y$ is a smooth map
  of manifolds.
  + If $f$ is a submersion, then $dim X ge dim Y$.
  + If $f$ is an immersion, then $dim X le dim Y$.
]

=== Fibres of Submersions are Submanifolds

#theorem[
  Let $f: X -> Y$ be a submersion of manifolds.
  Then for each $y in Y$,
  the #highlightIndex[fibre] $X_y = f^(-1) (y)$
  has a uniuqe structure of a manifold
  od dimension $dim X - dim Y$,
  s.t. the injection
  $i: X_y -> X$ is an embedding.
]
#remark[
  There is a similar theorem for topological manifold,
  however, with less condition on the map $f: X -> Y$.
]

// TODO proof

By investigating the proof,
we notice that for a fixed $y in Y$,
the proof only needs $T_x f$ surjective for all $x in X_y$,
then $X_y -> X$ will become a embedding.
We do not need for all $x in X$,
$T_x f$ to be surjective.

#corollary[
  Suppose $X$ is a manifold with dimension $n$,
  and $k$ s.t. $n ge k$.
  Also $(f_1, ...,f_k): X -> RR^k$
  smooth s.t. ${d_x f_1, ... ,d_x f_2}$
  linear independent in $cotangentSpace(x, X)$
  for all $x in X$ with $(f_1, ...,f_k)(x) = (0,...,0)$.

  Then $Y = {x in X | (f_1, ...,f_k)(x) = (0,...,0)}$
  is an embedded submanifold of $X$
  with dimension $n - k$.
]

// TODO proof

This corollary allows us to build examples of manifolds.
#example[
  Define $f: RR^(n+1) -> R$ by
  $
    f: (x_1, ..., x_(n+1)) mapsto x_1^2 + ... + x_(n+1)^2 - 1
  $
  Then $f^(-1) (0)$
  is the classical example of $S^n$.
]

#theorem(title: [Sard's Theorem])[
  Let $f: X -> Y$ be a smooth map,
  s.t. $dim X ge dim Y$.
  Then there is a dense subset $S subset.eq Y$
  (in fact, we have $Y \\ S$ measure zero,
  if measure is defined properly on $Y$, for instance,
  $Y$ is a subspace of $RR^n$),
  s.t. for all $y in Y$,
  and all $x in X_y$,
  we have $T_x f: tangentSpace(x, X) -> tangentSpace(y, Y)$
  surjective.
  So that $X_y =  f^(-1) (y)$
  is an embedded submanifold of $X$,
  of dimension $dim X - dim Y$.
  #index[Sard's Theorem]
]

=== Embeddings and Embedded Submanifolds

A embeding is kind of unique in the categorical sense,
which we will state as the following proposition.

#proposition[
  Let $f: X -> Y$ be a embedding between manifolds,
  if there is another embedding $f': X' -> Y$,
  s.t. $f(X) = f'(X')$
  then there exists a unique diffeomorphism between $phi: X -> X'$
  s.t. the diagram commute.
  #align(center, commutative-diagram(
    node((0, 0), [$X$]),
    node((1, 0), [$X'$]),
    node((0, 1), [$Y$]),
    arr((0, 0), (0, 1), [$f$]),
    arr((1, 0), (0, 1), [$f'$], label-pos: right),
    arr((0, 0), (1, 0), [$phi$], label-pos: right, "dotted"),
  ))
]
#remark[
  It is easy to check that the inclusoin $i: f(X) -> X$,
  is a embedding,
  and $i$ is uniuqe up to diffeomorphism sense.
  And thus, from now on we could asuume all embedding $X -> Y$
  as $X$ be a subset of $Y$.

  However, note that not all subsets of $Y$ is a embedded submanifold
  of $Y$.
]

#theorem(title: [Whitney Embedding Theorem])[
  Let $X$ be a manifold of dimension $n$.
  Then there exists embeddings $f: X -> RR^(2n+1)$,
  s.t. $f(X)$ is closed in $RR^(2n+1)$.
  #index[Whitney Embedding Theorem]
]

// TODO proof

== Vector Fields

#definition(title:[Vector Field])[
  Let $X$ be a manifold,
  with tangent bundle $T X$.
  A #highlightIndex[vector field]
  is a section $v in Gamma^infty (T X)$.
]

#remark[
  For each $x in X$, $v(x) in {x} times tangentSpace(x, X)$,
  we write $v_x$ to be the second part of $v(x)$,
  and $v_x in tangentSpace(x,X)$.
  And $v_x$ varying smoothly with $x$.
  We could think the filed as a velocity of partical on the manifold.
  For instance, the wind velocity on the surface of the earth.
]

=== Vector Fields as Derivations and Lie Bracket

#proposition[
  Let $X$ be a manifold.
  Then there is a natural bijection between vector fields
  $Gamma^infinity (T X)$,
  and linear maps $delta: C^infty (X) -> C^infty (X)$
  satisfying
  $
    delta(a b) = a delta(b) + delta(a) b, forall a,b in C^infty (X)
  $ <eqn:vectorFieldLeibnitzRuleDerivation>

  And given $v in Gamma^infinity (T X)$,
  and a corresponding $delta$ in the above sense,
  we have
  $
    v_x (a) = (delta(a))(x), forall a in C^infty (X), x in X
  $

  A map $delta: C^infty (X) -> C^infty (X)$
  that satisfies @eqn:vectorFieldLeibnitzRuleDerivation
  is called a #highlightIndex[derivation].
] <def:vectorFieldCorrespondDerivation>

// TODO proof

#proposition[
  Given a manifold $X$ with dimension $n$,
  a vector field $v in Gamma^infinity (T X)$,
  and a chart $(U, phi)$.
  Let $(x_1,..., x_n)$ be a lcoal coordinate on $phi(U)$,
  then the corresponding derivation $delta$ of $v$
  satisfies
  $
    delta(a)(x) = v_1(x) (partial a)/(partial x_1) |_x +
    ... + v_n (x) (partial a)/(partial x_n) |_x,
    forall x in phi(U), a in C^infty (X)
  $
  where $v_1, ..., v_n in C^infty (X)$.
]

// TODO proof

#lemma[
  Let $X$ be a manifold,
  and given derivations $delta, epsilon: C^infty (X) -> C^infty (X)$
  then $lambda delta + beta epsilon$ where $lambda, beta in RR$
  is still a derivation.
]

// TODO proof

#definition(title:[Lie Bracket])[
  Given a ring $R$,
  and $a, b in R$,
  we define $[a,b] = a b - b a$
  #index(display: [$[a,b]$], "[a,b]")
  to be the #highlightIndex[Lie bracket]
  or #highlightIndex[commutator]
]

#proposition[
  Let $delta, epsilon:  C^infty (X) -> C^infty (X)$
  be derivations,
  then $[delta, epsilon]$ is also a derivation.
]
#proof[
  Take
  $a, b in C^infty (X)$.
  Then
  $
    & delta circ epsilon(a b)
    = delta(a epsilon(b) + epsilon(a) b)
    = delta(a) epsilon(b) + a (delta circ epsilon (b))
      + (delta circ epsilon(a)) b + epsilon(a) delta(b) \
    & epsilon circ delta(a b)
    = epsilon(a delta(b) + delta(a) b)
    = epsilon(a) delta(b) + a (epsilon circ delta (b))
      + (epsilon circ delta(a)) b + delta(a) epsilon(b)
  $

  Substracting,
  we get
  $
    [delta,epsilon](a b) = a ([delta, epsilon](b))
    + ([delta, epsilon](a)) b
  $
]

#definition(title:[Lie Bracket])[
  Let $X$ be a manifold and $v, w in Gamma^infty (T X)$
  be vector fields.
  Then $v,w$ corresponds to derivations
  $delta, epsilon: C^infty (X) -> C^infty (X)$
  by @def:vectorFieldCorrespondDerivation.
  Then again by @def:vectorFieldCorrespondDerivation,
  $[delta, epsilon]$ corresponds to a unique
  $[v, w] in Gamma^infty (T X)$.
  And we define the #highlightIndex[Lie bracket]
  of $v,w$ to be $[v,w]$.
]

#remark[
  Given a manifold $X$ with dimension $n$,
  vector fields $v,w in Gamma^infinity (T X)$,
  and a chart $(U, phi)$.
  Let $(x_1,..., x_n)$ be a lcoal coordinate on $phi(U)$,
  then the corresponding derivation $delta, epsilon$ of $v,w$ 
  satisfy
  $
    delta(a)(x) &= v_1 (partial a)/(partial x_1) |_x +
    ... + v_n (partial a)/(partial x_n) |_x,
    forall x in phi(U), a in C^infty (X) \
    epsilon(a)(x) &= w_1 (partial a)/(partial x_1) |_x +
    ... + w_n (partial a)/(partial x_n) |_x,
    forall x in phi(U), a in C^infty (X) \
  $

  Thus $forall x in phi(U), a in C^infty (X)$
  $
    [delta, epsilon](a)
    &= delta circ epsilon (a) - epsilon circ delta(a) \
    &= delta(
      w_1 (partial a)/(partial x_1)+...+w_n (partial a)/(partial x_n)
    )
    - epsilon(
      v_1 (partial a)/(partial x_1)+...+v_n (partial a)/(partial x_n)
    ) \
    &= sum_(i,j in {1,...,n})
      v_i partial/(partial x_i)(w_j (partial a)/(partial x_j))
    - sum_(i,j in {1,...,n})
      w_i partial/(partial x_i)(v_j (partial a)/(partial x_j)) \
    &= sum_(i,j)
      v_i (
        (partial w_j)/(partial x_i)(partial a)/(partial x_j)
        + w_j partial/(partial x_i)(partial a)/(partial x_j)
      )
      - sum_(i,j)
      w_i (
        (partial v_j)/(partial x_i)(partial a)/(partial x_j)
        + v_j partial/(partial x_i)(partial a)/(partial x_j)
      )\
    & = sum_(i,j)
      (
        v_i (partial w_j)/(partial x_i)
        - w_i (partial v_j)/(partial x_i)
      )(partial a)/(partial x_j)
  $

  Note that this is a equivalence definition of derivations,
  but the more abstract version of the derivation
  gives us the power to omit the proof of "when we are using
  different chart, the defition is coherent"
  and the proof that "we can pasting derivation on charts that
  is adjacent".
]

#proposition(title: [Jacobi Identity])[
  Let $u, v, w$ be vector fields on $X$.
  Then we have
  $
    [u, v, w] + [v, w, u] + [w, u, v] = 0
  $
  where $[u,v,w] = [u,[v,w]]$.
]
#proof[
  This proof is just a short exercise of algebraic manipulation.
]

=== Flowing Along a Vector Field

#definition(title: [$1$-parameter group of diffeomorphism])[
  Let $X$ be a manifold.
  A #highlight[$1$-parameter group of diffeomorphism]
  #index(
    display: [$1$-parameter group of diffeomorphism],
    "1-parameter group of diffeomorphism"
  )
  is a smooth map $phi: RR times X -> X$.
  s.t.
  #enum(
    enum.item[
      $phi_t: X-> X$ and $phi_t(x) = phi(t,x)$
      for all $t in RR, x in X$.
    ],
    enum.item[
      $phi_t$ is a diffeomorphism for all $t in RR$.
    ],
    enum.item[
      $phi_0 = id$.
    ],
    enum.item[
      $phi_(s+t) = phi_s circ phi_t$ for all $s,t in RR$.
    ]
  )
]
#remark[
  $t mapsto phi_t$ now become a group homomorphism of $RR -> op("Diff")(X, X)$,
  where $op("Diff")(X,X)$ is the group of all diffeomorphism from
  $X$ to $X$,
  and the group action is composition.

  Also note that the condition that $phi_0 = id$
  and the condition that "$phi_(s+t) = phi_s circ phi_t$ for all $s,t in RR$"
  actually implies "$phi_t$ is a diffeomorphism for all $t in RR$"
]

#proposition[
  Given a manifold $X$,
  and a $1$-parameter group of diffeomorphism
  $phi: RR times X -> X$,
  and define $delta: C^infinity (X) -> C^infinity (X)$
  by
  $
    delta(a)(x) = d/(d t) (a circ phi_t (x))|_(t=0),
    forall a in C^infty (X), x in X
  $
  where $a circ phi_t(x)$ is treat as a funciton $RR -> RR$
  on $t$ for fixed $x$.
  Then $delta$ is a derivation.
]<prop:defineVectorFieldFrom1ParamGroupOfDiffeomorphism>
#remark[
  Given a manifold $X$,
  and a $1$-parameter group of diffeomorphism
  then we have a corresponding derivation
  $delta: C^infinity (X) -> C^infinity (X)$
  by past proposition.
  And $delta$ corresponding to a vector field $v in Gamma_infinity (X)$
  by @def:vectorFieldCorrespondDerivation,
  and we have
  $
    v_x (a) = d/(d t) (a circ phi_t (x))|_(t=0),
    forall a in C^infty (X), x in X
  $
  
  Thus, for each $1$-parameter group of diffeomorphism
  $phi$ of $X$ gives a vector field $v in Gamma^infty (T X)$.
  We will show that under additional conditions
  (for instance X compact),
  each $v$ corresponds to a unique $phi$.

  We can under stand the relationship of $v$ and $phi$
  as,
  given a $v$,
  and a partical at $x$ at time $0$,
  then $phi_t (x)$ is the position of the partical at time $t$,
  and $phi_t (x), t in RR$ is the trajectory.
]

If we are given a vector field $v$,
we now defines a $1$-parameter group of diffeomorphism
from $v$ by "intergrations".

#definition(title: [Integral Curve])[
  Let $X$ be a manifold and $v in Gamma^infty (T X)$.
  And #highlightIndex[integral curve]
  of $v$ is a smooth map
  $gamma : I -> X$
  where $I subset.eq RR$
  is an open interval,
  s.t.
  $
    (T_t gamma)(partial/(partial t)) = v_(gamma(t)),
    forall t in I
  $
  where $T_t gamma: tangentSpace(t, I) -> tangentSpace(gamma(t), X)$.

  And integral curve is called #highlight[maximal]
  #index[maximal integral curve]
  if it cannot be extended to another integral curve
  $gamma': I' -> X$
  with $I subset.eq I'$.
]
#remark[
  Note that by the definition of $T_t gamma$,
  and with a standard choice of chart for $I$,
  then
  $
    v_(gamma(t_0))(a) = (T_(t_0) gamma)(partial/(partial t))(a)
    = d/(d t) (a circ gamma)|_(t = t_0),
    forall t_0 in I, a in C^infty (X)
  $
  which agrees with the definition in
  @prop:defineVectorFieldFrom1ParamGroupOfDiffeomorphism.
]

#theorem[
  Let $X$ be a manifold,
  $v in Gamma^infty (T X)$,
  and $x in X$.
  Then there exists a unique maximal
  integral curve $gamma: I -> X$ of $v$
  with $0 in I$,
  amd $gamma(0) = x$.
  If $X$ is compact,
  then $I = R$.
]
#remark[
  This theorem cam be proved using existence and uniqueness
  of solotions
  of ODES.

  It is well know that euqations of the form
  $
    &(d) / (d t) x_i= f_i (x_1(t), ..., x_n (t)),& &i in {1,...,n}\
    &x_i (0) = tilde(x)_i,& &i in {1,...,n}
  $
  for $f_1, ..., f_n : RR^n -> RR$ smooth,
  and $tilde(x)_1,...,tilde(x)_n in RR$
  have unique solutions
  for $t in (-epsilon, epsilon), epsilon > 0$.

  In lcoal coordinates on $X$,
  the equations for an integral curve
  become ODES of this form.

  The maximal interval $I subset.eq RR$
  can have $I neq RR$
  only if the curve "reach the edge of $X$ (for instance $X$ is an interval in $RR$)" or "goes to infinity in $X$ (for instance the function $1/t: (0,infinity) -> (0,infinity)$".
  If $X$ is compact,
  then both of the case can not happen.
]

#definition(title: [Complete])[
  A vector field $v$ on a manifold $X$
  is called #highlightIndex[complete]
  if in the previous theorem,
  we have $I = RR$
  for all $x in X$.
]
#remark[
  If $X$ is compact,
  then any vector field is complete.
]

#theorem[
  Let $X$ be a manifold,
  and $v in Gamma^infty (X)$
  a complete vector field.
  Define $phi: RR times X -> X$
  s.t. for each $x in X$,
  $t -> phi(t,x)$
  is the unique maximal integral curve
  with $phi(0, x) = 0$.
  Then $phi$ is smooth,
  and is a $1$-parameter group of diffeomorphism of $X$.

  Also, the vector field defined by $phi$
  as in @prop:defineVectorFieldFrom1ParamGroupOfDiffeomorphism
  is exactly $v$.

  This gives a bijection between
  all complete vector filed in $Gamma^infty (X)$,
  and $1$-parameter group of diffeomorphisms of $X$.
]

// TODO proof

== Tensor Products and Exterior Algebras

Note by convention,
if $V$ is a $RR$-vector,
by convention,
we write $tensor.B^0 V = RR$.

#definition(title:[Tensor Algebra])[
  If given $RR$-vector space,
  we define the #highlightIndex[tensor algebra]
  as
  $
    T(V) = directSum.B_(k=1)^infty tensor.B^k V.
  $

  It is an $R$-algebra,
  with product $tensor$:
  $
    (v_1 tensor ... tensor v_k)
    tensor
    (w_1 tensor ... tensor w_l)
    = v_1 tensor ... tensor v_k
    tensor w_1 tensor ... tensor w_l
  $
  where $v_1 tensor ... tensor v_k in tensor.B^k V$,
  $w_1 tensor ... tensor w_l in tensor.B^l V$,
  and $v_1 tensor ... tensor v_k tensor
  w_1 tensor ... tensor w_l in tensor.B^(k+l) V$.
  And with the identification $RR subset.eq T(V)$
  by $tensor.B^0 V = RR$.
]

#definition[
  The symmetric group $S_k$ of permutations
  of ${1,...,k}$
  acts on $tensor.B^k V$ by permuting the $k$
  factors of $V$,
  so that we have a representation
  $rho: S_k -> GL(tensor.B^k V)$,
  and if we are given
  $sigma in S_k$,
  we have:
  $
    rho_k (sigma): tensor.B^k V -> tensor.B^k V,
    v_1 tensor ... tensor v_k
    mapsto v_(sigma(1)) tensor ... tensor v_(sigma(k))
  $
  #index(display: [$rho_k$], [rho_k])

  Define $and.big^k V$ to be the vector subspace
  of $tensor.B^k V$
  s.t. $S_k$ acts anti-symmetrically, that is
  $
    and.big^k V = {
      alpha in tensor.B^k V |
      rho_k (sigma) (alpha) = sign(sigma) alpha,
      forall sigma in S_k
    }
  $
  #index(display: [$and^k V$], [and^k V])

  There is a projection $pi: tensor.B^k V -> and.big^k V$
  by
  $
    pi: alpha mapsto 1/(k!)
    sum_(sigma in S_k) (sign(sigma)) rho_k (sigma)(alpha)
  $
  It is easy to check that it is surjective,
  and $pi circ pi = pi$.

  The #highlightIndex[exterior product]
  $and: and.big^k times and.big^l V -> and.big^(k+l) V$
  is the composition:
  #align(center, commutative-diagram(
    node((0, 0), [$and.big^k V directSum and.big^l V$]),
    node((0, 1), [$and.big^(k+l) V$]),
    node((1, 0), [$tensor.big^k V directSum tensor.big^l V$]),
    node((1, 1), [$tensor.big^(k+l) V$]),
    arr((0, 0), (0, 1), [$and$]),
    arr((0, 0), (1, 0), [], "inj"),
    arr((1, 0), (1, 1), [$tensor$], label-pos: right),
    arr((1, 1), (0, 1), [$pi$]),
  ))
]

We have $and.big^0 V = RR = tensor.big^0 V$
and $and.big^1 V = V$.
And example of this is given in the representation theory
@def:alternatingSquare.

If ${v_1, ..., v_n}$
is a basis for $V$.
then
we have:
$
  {
    v_(i_1) and ... and v_(i_k)
    = pi(v_(i_1) tensor ... tensor v_(i_k)) |
    1 le i_1 < ... < i_k le n
  }
$
is a basis for $and.big^k V$,
and $dim and.big^k V = binom(n,k)$.

And it is easy to check that
if $alpha in and.big^k V$, $beta in and.big^l V$, then
$alpha and beta = (-1)^(k l) beta and alpha in and.big^(k+l) V$.

#definition(title: [Exterior Algebra])[
  Given $V$ a finite dimensional vector space,
  the #highlightIndex[exterior algebra]
  is $and.big^* V = tensor_(k=0)^infty V$.
]
#remark[
  Note that $and.big^k V = 0$,
  if $k > dim V$.
  So we also have
  $and.big^* V = tensor.big_(k=0)^(dim V) V$

  It is an $RR$-algebra with identification
  $RR = tensor.big^0 V = and.big^0 V$.

  And it have deimension
  $dim V^* = sum_(k=0)^(n) binom(n,k) = 2^n$.
]

Note that the $and.big^k$ is a functor,
that is, we have $and.big^k: Vect -> Vect$,
that is if we have $alpha: V -> W$,
then there is a natural map:
$and.big^k alpha: and.big^k V -> and.big^k W$.

=== Algebraic Operations on Vector Bundles

#definition[
  Let $E -> X$, $F -> X$ be vector bundles on a manifold $X$.
  Then there are natural vector bundles $E^*$,
  $E directSum F$, $E tensor F$,
  $tensor^k E$,
  $and^k E$ on $X$ where the fibres
  satisfy
  $E^*_x = (E_x)^*$,
  $(E directSum F)_x = E_x directSum F_x$,
  $(E tensor F)_x = E_x tensor F_x$,
  $(tensor.big^k E)_x = tensor.big^k E_x$,
  and $(and.big^k E)_x = and.big^k E_x$,
  at each $x in X$.
  Where $E^*$ means dual space here.
]

#example[
  The dual of the tangent bundle $T X$ is $(T X) = T^* X$,
  which is the cotangent bundle.
]

== Differrential Forms

#definition(title: [Tensor, Exterior Form and $k$-form])[
  Given a manifold $X$,
  a #highlightIndex[tensor] is a section
  $T in Gamma^infty (tensor.big^j T X tensor tensor.big^k T^* X)$
  for $j,k ge 0$.
  
  An #highlightIndex[exterior form],
  or $k$-form
  #index(display: [$k$-form], [k-form]) 
  is $alpha in Gamma^infty (and.big^k T^* X)$.
  And we denote it by $Omega^k (X) = Gamma^infty (and^k T^* X)$.
  #index(display: [$Omega^k (X)$], [Omega^k (X)])
]
#remark[
  Exterior forms are examples of tensors.
  Tensors are very general,
  for instance functions are the case $j = k =0$,
  vector fields are the case $j=1,k=0$,
  Riemannian metrics are the case $j=0,k=2$.

  Note that when $k=1$,
  this is consistent with our previous definition of $1$-forms.
]

#definition(title: [Wedge Product])[
  Given a manifold $X$,
  a #highlightIndex[wedge product]
  is $and: Omega^k (X) times Omega^l (X)-> Omega^(k+l) (X)$.
  That satisfies:
  $
    (u and v)_x = u_x and v_x \
    u and v = (-1)^(k l) (v and u) \
    u and (v and w) = (u and v) and w
  $
  for all $u in Omega^k (X), v in Omega^l (X), w in Omega^m (X)$.
]