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