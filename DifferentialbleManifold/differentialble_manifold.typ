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
    ]
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
    ]
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
    ]
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

== Tangent and Cotangent Bundles

#definition(title: [$C^infinity (X)$])[
  Let $X$ be manifold,
  define #index(display: [$C^infinity (X)$], "C^infinity (X)")
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
    e^(-1/t) &"if" t >0,
    0 &"if" t le 0
  )
$
Then it is easy to verify that $a$ is smooth.

Define $b: RR -> RR$ as $b = a(t) / (a(t) + a(1-t))$,
then $b$ has the property that
$
  b(t)  = cases(
    0 &"if" t le 0,
    1 &"if" t ge 1,
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
      $supp eta_i = overline(
        {x in X | eta_i(x) > 0}
      ) subseteq U_i$.
    ],
    enum.item[
      ${eta_i: X -> [0,1] | i in I}$ is locally finite,
      that is for any $x in X$,
      there exists an open neighbourhood $U$ of $x$,
      s.t. $eta_i | _U neq 0$ for only finitly many $i$.
    ],
    enum.item[
      $ sum_(i in I) eta_i = 1$
    ]
  )
]

