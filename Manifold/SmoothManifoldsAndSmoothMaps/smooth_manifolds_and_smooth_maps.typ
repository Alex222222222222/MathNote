#import "../../utils.typ": *

== Smooth Manifolds And Smooth Maps

=== Smooth Maps

#definition(title: "smooth map")[
  A mapping $f$ from a open set $U$ of $RR^k$,
  to a open set $V$ of $RR^t$ is called #highlightIndex("smooth")
  if all of the partial derivatives
  $
    (partial f) / (partial x_(i_1) dots partial x_(i_n) )
  $
  exists and continuous.

  More generally,
  if $X subset.eq RR^k$ and $Y subset.eq RR^t$ are arbitrary subsets,
  then a mapping $f: X -> Y$ is called smooth on $x in X$,
  if there exists a open subset $U subset.eq RR^k$,
  s.t. there exists a smooth mapping $F: U -> RR^t$,
  that coincide with $f$ on $U inter X$.
]

#lemma[
  Any identity map is smooth.
]
#proof[
  Trivial.
]

#lemma[
  Given smooth maps $f: X -> Y$ and $g: Y -> G$,
  then $g circle.small f$ is also smooth.
]
#proof[
  Trivial.
]

#definition(title: "diffeomorphism")[
  A map $f: X -> Y$ is called #highlightIndex("diffeomorphism")
  if $f$ is a homeomorphism,
  and both $f$ and $f^(-1)$ are smooth.
]
#remark[
  Differential topology is mainly about studing objects
  under diffeomorphism.
]

We are going to mainly look at a particularly attractive sets:
#definition(title: "smooth manifold of dimension m")[
  A susbet $M subset.eq RR^k$ is called a
  #highlightIndex("smooth manifold") of #highlightIndex("dimension") $m$,
  if each $x in M$ have a neighbourhood $W$ such that $W inter M$
  is diffeomorphic to an open susbet $U$ of $RR^k$.

  Any particular diffeomorphism $g: U -> W inter M$
  is called a #highlightIndex("parametrization") of the region
  $W inter M$.
  The inverse diffeomorphism $g^(-1)$ is called
  a #highlightIndex("system of coordinates") on $W inter M$.
]

#example[
  The unit sphere $S^2$ is a smooth manifold of dimension $2$.
  More generally the sphere $S^m$ is a smooth manifold of dimension $m$.
]

=== Derivatives

In this section, we will define the derivatives for smooth maps
on smooth manifolds,
but we will start with general functions.
And we will see some inspirations on how the derivatives on smooth
manifolds are defined.

#definition(title: "derivative")[
  Given a map $f$ from a open subset of $U subset.eq RR^k$
  to a $V subset.eq RR^t$,
  we define the #highlightIndex("derivative") of $f$ is defined to be a
  linear function
  $D: RR^k -> RR^l$ s.t. for all $h in RR^k$,
  we have: $
    lim_(t -> 0) ((f(x+t h)- f(x)) - D h)/t = 0.
  $

  And the derivative of $f$ at $x$ as $d f_x$.

  The derivative of a general function may not exists.
  If $d f_x$ exists, then we say that
  $f$ is #highlightIndex("differentialble") at $x$.
]
#remark[
  If we regard $d f_x$ as a matrix,
  then it is just the matrix of first derivatives, namely:
  $
    mat(
      (partial f_1)/(partial x_1), dots,  (partial f_1)/(partial x_k);
      dots.v, dots.down, dots.v;
      (partial f_t)/(partial x_1), dots,  (partial f_t)/(partial x_k)
    )
  $
]

#lemma[
  Given a map $f$ from a open subset of $U subset.eq RR^k$
  to a $V subset.eq RR^t$, if $f$ is smooth,
  then $f$ is differentialble everywhere.
]
#proof[
  Could be found in the book by Munkres @AnalysisOnManifoldsMunkres.
]

#lemma[
  Given open sets $U$, $V$,
  and function $f: U -> V$ and $g: V -> W$,
  if function $f$ is differentialble at $x$,
  and $g$ differentialble at $f(x)$,
  then $g circle.small f$ is differentialble at $x$,
  and $d(g circle.small f)_x = d g_(f(x)) circle.small d f_x $.
  This is also called the #highlightIndex("chain rule").
]
#proof[
  Could be found in the book by Munkres @AnalysisOnManifoldsMunkres.
]

#lemma[
  Given open sets $U$,
  and the identity function $i: U -> U$,
  then for any $x in U$,
  $d i_x$ is the identity function.
]
#proof[
  Trivial.
]

#lemma[
  Given a linear function $f: RR^k  -> RR^l$,
  and for any $x in RR^k$,
  $d f_x = f$.
]
#proof[
  Trivial.
]

#theorem[
  If $f$ is a diffeomorphism between open sets
  $U subset.eq RR^k$ and $V subset.eq RR^l$,
  then $k = l$,
  and $d f_x$ must be non-singular for all $x in U$.
] <diffeomorphic-set-have-same-dimension>
#proof[
  Take $x in U$,
  then $d f_x$ and $d f^(-1)_x$ should both exist,
  and $d f_x circle.small d f^(-1)_x = I$
  and $d f^(-1)_x circle.small f_x  = I$.
  As $d f_x: RR^k -> RR^t$,
  and $d f^(-1)_x: RR^t -> RR^k$,
  from the knowledge of linear algebra,
  we have $k=l$ and $d f_x$ non-singular.
]

We have a partial inverse for this theorem.
#theorem(title: "Inverse Function Theorem")[
  Given a smooth function $f: U -> V$,
  where $U, V subset.eq RR^k$, and $U$ open subset.
  For $x in U$, if $d f_x$ is non-singular,
  then there exists a neighbourhood $W$ of $x$,
  s.t. $x in W$, and $f$ maps $W$ diffeomorphicly onto $f(W)$.
]

We will then start defining the derivatives on functions
on smooth manifolds.
For a general function $f: U -> V$,
where $U subset.eq RR^k$ and $V subset.eq RR^t$,
and $U$ is open, and for $x in U$,
by intuiation, we can see that the affine function $g: RR^k -> RR^t$,
defined as $g(x + h) = f(x) + d f_x (h)$ is actually
the best linear approximation of $f$ near $x$.
For functions on smooth manifold, we want to do the similar,
that is to produce a similar best linear approximation near the target point.
But note here, a smooth manifold $M$ with dimension $m$,
is locally diffeomorphic to $RR^k$ space,
which may inspired us to find linear functions from $RR^k$ as the derivative.

We first define the tangent space of a smooth manifold on some point,
which may be regard as obtained by flatten the curvy local space around $x$.
Or be regard as attaching the dimension $m$ local space that
is diffeomorphic to a neighbourhood around $x$ to $x$.
We will start the formal definition.

#definition("tangent space")[
  Given a smooth manifold $M$ with dimension $m$, and $x in M$.
  Take $U subset.eq RR^m$ and $W$ a neighbourhood of $x$,
  and $f: U -> W inter M$ 
  s.t. $f$ is a diffeomorphism.

  Define the #highlightIndex("tangent space") of $M$ on $x$
  to be $T M _x = d f_x (RR^m)$.
]
#remark[
  Note that $x$ may not in $T M_x$, and the affine space $T M_x + f(x)$,
  should be the usual geometric ideal of tangent space.
]

We still need to prove that the definition is well defined,
i.e. for different choice of $U$ and $f$, $T M_x$ is the same.
#proof[
  Assume $M subset.eq RR^k$.
  Take $U_1, U_2 subset.eq RR^m$, $W_1$ and $W_2$ neighbourhoods of $x$,
  and $f_1: U_1 -> W_1$ and $f_2: U_2 -> W_2$ s.t.
  $f_1$ and $f_2$ are diffeomorphisms.
  WLOG, we may assume that $W_1 = W_2$, since we may that $W = W_1 inter W_2$,
  and $W$ should still be a neighbourhood of $x$,
  also, we could restrict $f_1$ to $f_1^(-1)(W)$ and 
  $f_2$ to $f_2^(-1)(W)$,
  and it is easy to check that $f_1$ and $f_2$ are still
  diffeomorphism after restrictions.

  Thus, we have the following commutative diagram:
  #align(center, commutative-diagram(
    node((1, 2), [$U_2$]),
    node((1, 0), [$U_1$]),
    node((0, 1), [$W inter M$]),
    arr((1, 0), (0, 1), [$f_1$]),
    arr((1, 2), (0, 1), [$f_2$], label-pos: right),
    arr((1, 0), (1, 2), [$f_2^(-1) circle.small f_1$], label-pos: right),
  ))

  Since the derivative is natural (in the category theory sense),
  i.e. we have chain rule for derivative.
  We have the following commutative diagram:
  #align(center, commutative-diagram(
    node((1, 2), [$RR^m$]),
    node((1, 0), [$RR^m$]),
    node((0, 1), [$RR^k$]),
    arr((1, 0), (0, 1), [$d (f_1)_(f_1^(-1)(x))$]),
    arr((1, 2), (0, 1), [$d (f_2)_(f_2^(-1)(x))$], label-pos: right),
    arr((1, 0), (1, 2), [$d (f_2^(-1) circle.small f_1)_(f_1^(-1)(x))$], label-pos: right),
  ))

  Thus, $d (f_2^(-1) circle.small f_1)_(f_1^(-1)(x))$ is isomorphism.
  And $
    im d (f_1)_(f_1^(-1)(x)) = im d (f_2^(-1) circle.small f_1)_(f_1^(-1)(x))
    = im d (f_2)_(f_2^(-1)(x)),
  $
  which proves that the $T M _x$ is well defined.
]

Next, we deifine the derivative for smooth functions on smooth manifolds.

#definition[
  Given a smooth function $f$ from smooth manifold $M subset.eq RR^k$
  to smooth manifold $N subset.eq RR^l$,
  the derivative at point $x in M$ is defined as a function
  $d f_x: T M_x -> T N_(f(x))$.
  And the function is defined as follows.
  Since $f$ is smooth, there exists an open neighbourhood $W$ of $x$
  and a smooth function $g: W -> RR^l$ s.t. for all $w in W inter M$,
  $f(w) = g(w)$.
  And thus $d g_x$ is a function with domain $RR^k$,
  which contains $T M_x$,
  we define $d f_x$ as the function derived by restrict the domain of $d g_x$
  to $T M_x$.
]
We need to justify the definition:
$forall v in T M_x$, $d g_x (v)$ must be inside $T N_(f(x))$.
And we also need to prove that the definition is well-defined.
#proof[
  Choose parametrization $h: U -> M subset.eq RR^k$
  and $i: V -> N subset.eq RR^l$,
  where $U$ is a neighbourhood of $h^(-1)(x)$,
  and $V$ is a neighbourhood of $i^(-1)(f(x))$.
  WLOG, we may assume $h(U) subset.eq W$,
  and $g circle.small h (U) subset.eq i(V)$,
  since we may replace $U$ by a smaller neighbourhood of $x$.

  Since $i$ is a well-defined diffeomorphism,
  we have the following commutative diagram:
  #align(center, commutative-diagram(
    node((1, 0), [$U$]),
    node((0, 0), [$M inter W$]),
    node((0, 1), [$N inter f(W)$]),
    node((1, 1), [$V$]),
    arr((1, 1), (0, 1), [$i$], label-pos: right),
    arr((0, 0), (0, 1), [$g$]),
    arr((1, 0), (0, 0), [$h$]),
    arr(
      (1, 0), (1, 1),
      [$i^(-1) circle.small f circle.small h$],
      label-pos: right
    ),
  ))

  Assume $M$ is of dimension $m$,
  and $N$ is of dimension $n$.
  Since now all domains of the four functions are open,
  we take derivative, and have the following commutative diagram:
  #align(center, commutative-diagram(
    node((1, 0), [$RR^m$]),
    node((0, 0), [$RR^k$]),
    node((0, 1), [$RR^l$]),
    node((1, 1), [$RR^n$]),
    arr((1, 1), (0, 1), [$d i_(i^(-1)(f(x)))$], label-pos: right),
    arr((0, 0), (0, 1), [$d g _x$]),
    arr((1, 0), (0, 0), [$d h_(h^(-1)(x))$]),
    arr(
      (1, 0), (1, 1),
      [$d (i^(-1) circle.small f circle.small h)_(h^(-1)(x))$],
      label-pos: right
    ),
  ))

  It follows immediately that
  $im(d g _x circle.small d h_(h^(-1)(x)))
    subset.eq im d i_(i^(-1)(f(x))) = T N _(f(x))$,
  which finish the proof that $forall v in T M_x$,
  $d g_x (v)$ is inside $T N_(f(x))$.

  We also have the following commutative diagram,
  by restricting the domains of the above diagram:
  #align(center, commutative-diagram(
    node((1, 0), [$RR^m$]),
    node((0, 0), [$T M_x$]),
    node((0, 1), [$T M_(f(x))$]),
    node((1, 1), [$RR^n$]),
    arr((1, 1), (0, 1), [$d i_(i^(-1)(f(x)))$], label-pos: right),
    arr((0, 0), (0, 1), [$d f _x$]),
    arr((1, 0), (0, 0), [$d h_(h^(-1)(x))$]),
    arr(
      (1, 0), (1, 1),
      [$d (i^(-1) circle.small f circle.small h)_(h^(-1)(x))$],
      label-pos: right
    ),
  ))

  And since $d h_(h^(-1)(x))$ and $d i_(i^(-1)(f(x)))$
  are isomorphism,
  $d f_x$ will be simply depends on the two parametrization and $f$.
  And since if we are given another sets of two parametrization,
  there is isomorphism between them by preview proofs,
  $d f_x$ will be well-defined.
]

We will also have the following propositions:
#proposition(title: "Chain rule")[
  If $f: M->N$ and $g:N->P$ are smooth,
  then $
    d(g circle.small f)_x = d g_(f(x)) circle.small d f_x.
  $
]
#proof[
  Similar with the proof for the chain rule of derivative on
  functions on open sets.
]

#proposition[
  Given a smooth manifolds $M$ and $N$, s.t. $M subset.eq N$,
  then the inclusion map $i: M -> N$ is smooth,
  and for any $x in M$,
  $T M_x subset.eq T N_x$,
  and $d i_x: T M_x -> T N_x$ is also the inclusion map. 
]
#proof[
  Trivial.
]

We also have the a similar theorem as @diffeomorphic-set-have-same-dimension.
#theorem[
  If $f: M -> N$ is a diffeomorphism,
  then for all $x in M$, $d f_x: T M_x -> T N_f(x)$
  is an isomorphism of vector spaces.
  In particular, the dimension of $M$ must be equal to the dimension of $N$.
]
