#import "../utils.typ": *

= Lie Groups

#definition[
  Let $G$ be a lie group and $g in G$.
  #highlightIndex[left translation by $g$]: $L_g: G to G, x mapsto g x$.
  #highlightIndex[right translation by $g$]: $R_g: G to G, x mapsto x g$.
  #highlightIndex[conjugation by $g$]: $C_g: G to G, x mapsto g x g^{-1}$.
]
#lemma[
  Let $G$ be a lie group and $g in G$.
  Then the left translation $L_g$, right translation $R_g$ and conjugation $C_g$ are all diffeomorphisms on $G$.
]
#remark[
  The left and right translations are not group homomorphisms.
]
#lemma[
  Let $G$ be a lie group.
  Then for any $g in G$, the conjugation $C_g$ is a group isomorphism.
]

Recall that a vector field $X$ on a manifold $M$ is a smooth section of the tangent bundle $T M$.
We denote the set of vector fields on $M$ by $C^infinity (T M)$ here.

If $f: M -> N$ is a diffeomorphisms between manifolds $M$ and $N$, then for any vector field $X$ on $M$, we can define a vector field $f_* X$ on $N$.
This is called the pushforward of $X$ by $f$.

#definition[
  Let $G$ be a lie group.
  A vector field $X$ on $G$ is #highlightIndex[left-invariant] if $forall g in G$ we have $(L_g)_* X = X$.
  Similarly, we can define #highlightIndex[right-invariant] vector fields on $G$.

  Define $g = lie(G) = {
    "left-invariant vector fields"
  }$.
  This is a vector space and called the #highlightIndex[lie algebra] of the lie group $G$.
]

If a vector field is left-invariant, then it is sufficient to study its property at the identity element.

#proposition[
  Let $G$ be a lie group, with dimension $n$.
  And $e$ be the identity element of $G$.
  Then the map $phi: g to T_e G, X mapsto X_e$ is a vector space isomorphism.
  In particular, we have $dim g = n$.

  If $(X_1)_e, ..., (X_n)_e$ is a basis of $T_e G$, then for every vector field $X$ on G,
  there exists unique smooth functions $f_1, ..., f_n: G to R$ such that
  $X = sum_(i=1)^n f_i X_i$.
]
#proof[
  See problem sheet 1.
]

#example[
  $G = (0, infinity)$ with multiplication is a lie group.
  A general vector field $X$ on $(0,infinity)$ is just $f(x) d / (d x)$, where $f: (0,infinity) to R$ is a any smooth function.

  Then we have $X_s = s X_e$ if $X$ is left-invariant. Then $f(s) = c s$ for some constant $c in R$.
]

Recall that if $M$ is a manifold, $X$ a vector field, $forall p in M$,
the integral curve of $X$ starting at $p$ is a unique smooth curve $alpha_p: (-epsilon, epsilon) to M, t mapsto alpha_p (t)$
such that $alpha_p (0) = p$ and $d/ (d t) alpha_p (t) = X_(alpha_p (t))$ for all $t in (-epsilon, epsilon)$.
The existence and uniqueness check the Manifolds notes.

A flow of X: $forall p in X$, $exists epsilon > 0$, $exists U$ open neighborhood of $p$,
such that $forall t in (-epsilon, epsilon)$, we have $phi_t: U -> M, x mapsto alpha_p (t)$, where $alpha_p$ is the integral curve of $X$ starting at $p$.
Then $phi$ is called the flow of $X$.

#theorem[
  Let $G$ be a lie group, and $X in g$ a left-invariant vector field on $G$.
  Then the $forall x in G$, the integral curve $alpha_x: R to G$ of $X$ starting at $x$ is defined on the whole $R$.
  Also, the map $RR -> G, t mapsto alpha_e (t)$ is a lie group homomorphism.

  And every lie group homomorphism $phi: RR -> G$ arises in this way from a unique left-invariant vector field $X in g$,
  such that $phi(t) = alpha_e (t)$ for all $t in RR$.
]

#definition[
  A lie algebra is a vector psace $V$
  endowed with a map $[-,-]: V times V to V$ s.t.
  #enum(
    enum.item[
      $[-,-]$ is bilinear,
    ],
    enum.item[
      $forall x, y in V$, we have $[x, y] = - [y, x]$ (antisymmetry),
    ],
    enum.item[
      $forall x, y, z in V$, we have $[x, [y, z]] + [y, [z, x]] + [z, [x, y]] = 0$ (Jacobi identity),
    ]
  )
]

#example[
  $M$ a manifold.
  Let $C^infty (T M)$ be the vector space of vector fields on $M$.
  Then we can define a lie bracket on $C^infty (T M)$ as follows:
  For any $X, Y in C^infty (T M)$, define $[X, Y]$ by
  $forall f in C^infty (M)$,
  $[X, Y] (f) = X (Y (f)) - Y (X (f))$.
]

#theorem[
  $[X,Y]_p = lim_(t to 0) ((phi_(-t)_* Y_(phi_t (p)))-Y_p)/t$

  If $f: M -> N$ diffeomorphisms, then $f_* [X, Y] = [f_* X, f_* Y]$.
]

$G$ be a lie group. Let $g$ be the set of left left-invariant vector field.

#proposition[
  For any $X, Y in g$, we have $[X, Y] in g$.
  Thus the lie bracket restricts to a map $[-,-]: g times g to g$.
  With this lie bracket, $g$ is a lie algebra.
]

So $(g,[-,-])$ is a lie algebra, called the lie algebra of the lie group $G$.

#example[
  #enum(
    enum.item[
      $G= RR^n$,
      then $g = RR^n$,
      and $[X,Y] = 0$.
    ],
    enum.item[
      $G = GL_n (RR)$,
      then $g = M_n (RR)$.
      For $X,Y in g$.
      $phi_t$ flow of $X$.

      integral curves $alpha_A (t)$:
      $
        d/ (d t) alpha_A (t) = X_(alpha_A (t)) = alpha_A (t) X_I \
        alpha_A (0) = A
      $

      $alpha_t (A) = alpha_A (t) = A e^(t X_I)$.

      $Y_(phi_t (I )) = phi_t (I) Y_I = e^(t X_I) Y_I$.

      $
        (phi_(-t))_* Y_(phi_t (I )) = e^(t X_I) Y_I e^(-t X_I)\
        = Y_I + t (X_I Y_I - Y_I X_I) + O(t^2)
      $

      Thus we have $[X, Y]_I = X_I Y_I - Y_I X_I$.

      This is also true for any lie group that the under lying manifold is an open subset of $M_n (RR)$.
    ]
  )
]

=== Adjoint Representation

#definition[
  A Representation of a lie group $G$ on a finite dim real vector space $V$
  is a lie group homomorphism $phi: G to GL(V)$.
]

Any lie group have a natural Representation on its own lie algebra, called the Adjoint Representation.

#definition[
  The Adjoint Representation of $G$ is the Representation of $G$ on $g$:
  $
    Ad : G to GL(g), g mapsto (C_g)_*
  $

  where $C_g: G to G, x mapsto g x g^{-1}$ is the conjugation by $g$,
  and $(C_g)_*$ is the pushforward of $C_g$.
]
#remark[
  If $G$ is commutative, then $Ad$ is the trivial Representation.
]

#lemma[
  for all $h in G$, we have $Ad (h): g -> g$ is a lie algebra homomorphism.
  That is $forall X, Y in g$, we have
  $
    Ad (h) [X, Y] = [Ad (h) X, Ad (h) Y]
  $
]

#example[
  $G = GL_n (RR)$.
  Then $g = M_n (RR)$.
  For any $h in G$, $Ad (h): g to g$ is given by
  $
    Ad (h) X = h X h^{-1}
  $
  for all $X in g$.
]

$Ad: G to GL (g)$ is a map between lie groups.
Taking the differential at the identity element, we obtain a lie algebra homomorphism:
$
 (d Ad)_e: T_E G = g to T_I GL (g) = End (g) \
X mapsto (Y mapsto [X, Y])
$

And we denote $(d Ad)_e$ by $ad$.
And $ad$ is also a lie algebra homomorphism.

#lemma[
  Let $f: G -> H$ be a lie group hom, then $(d f)_e$ is a lie algebra homomorphism from $lie(G)$ to $lie(H)$.
]

=== Exponential Map

#definition[
  The Exponential map is:
  $
    exp: g iso T_e G to G \
    X mapsto alpha_e (1)
  $
  where $alpha_e: R to G$ is the integral curve of $X$ starting at the identity element $e$.

  And $exp$ is a smooth map.
]
#example[
  $G = GL_n (RR)$.
  Then $g = M_n (RR)$.
  For any $X in g$, the integral curve $alpha_e: R to G$ of $X$ starting at $e$ is given by
  $
    alpha_e (t) = e^(t X_I)
  $
  Thus we have $exp (X) = e^(X_I)$.
]
#example[
  $G = S^1$:
  Then $g = RR$.
  Then $exp: RR to S^1, t mapsto e^(i t)$.
  surjective but not injective.
]

#proposition[
  $
    (d exp)_0: g to T_e G = g
  $
  is the identity map.
  So by inverse function theorem $exp$ is a local diffeomorphism around $0$.
]
#proof[
  $exp (X_e) = alpha_e (1)$.

  $exp(s X_e) = alpha_e (s)$.
  $
    d / (d s) |_(s = 0): (d exp)_0 (X_e) = X_e
  $
]
#remark[
  $g$ is connected, so $exp(g) subseteq G$ is connected.
  So $exp$ is not surjective if $G$ is not connected.
]
#example[
  $SL_2 (RR)$ is connected,
  but $exp: lie (SL_2 (RR)) to SL_2 (RR)$ is not surjective.
]

#lemma[
  Let $f: G -> H$ be a lie group hom.
  Then for all $X in g = T_e G$ then
  $f(exp(X_e)) = exp (d f_e (X_e))$
]
#proof[
  $alpha_e$: integral curve of $X$ starting at $e$.
  Then $f$ being a lie group hom implies that $f circ alpha_e$
  is the integral curve of $d f_e (X)$ starting at $e$.
  Thus we have the result.
]

#proposition[
  $G$ is a connected lie group.
  Then $forall V$ open set in $G$ containing $e$
  adn $forall g in G$,
  there exists $v_1, ..., v_k in V$ s.t. $g = v_1^plus.minus v_2^plus.minus ... v_k^plus.minus$.
  Here $plus.minus$ means either multiplication or its inverse for each $v_i$.
]
#proof[
  Consider $F = {
    g in G | exists v_1, ..., v_k in V s.t. g = v_1^plus.minus v_2^plus.minus ... v_k^plus.minus
  }$.
  Goal: show that $F = G$.

  Since $G$ is connected, it suffices to show that $F$ is non-empty, open and closed in $G$.

  $F$ is non-empty since $e in F$ by taking $k = 0$.

  $F$ is open:

  Take $g in F$, s.t. $g = v_1^plus.minus v_2^plus.minus ... v_k^plus.minus$.
  Consider $L_g (V)$ is a open neighborhood of $g$.
  For any $h in L_g (V)$, we have $h = g v$ for some $v in V$.
  Thus $h = v_1^plus.minus v_2^plus.minus ... v_k^plus.minus v$.
  So $h in F$.
  Thus $F$ is open.

  $F$ is closed:

  Take $g in overline(F)$. Consider $L_g (V)$ is an open neighborhood of $g$.
  As $g$ is in the closure of $F$, then there exists $h in F inter L_g (V)$.
  So $h = g v$ for some $v in V$.
  Thus $g = h v^(-1)$.
  As $h in F$ and $v in V$, we have $g in F$.
]

#proposition[
  Let $G$ and $H$ be lie groups.
  Assume that $G$ is connected,
  then if $f_1, f_2: G to H$ both be lie grouo hom,
  s.t. $(d f_1)_e = (d f_2)_e$. Then $f_1 = f_2$.
]
#proof[
  Since $exp: g to G$ is a local diffeomorphism around $e$,
  then there exists an open set $U$ in $g$, $V$ open neighborhood of $e$ in $G$,
  s.t. $exp: U to V$ is a diffeomorphism.

  Then for any $g in V$,
  exists $X in U$ s.t. $g = exp (X)$.
  Thus
  $    f_1 (g) = f_1 (exp (X)) = exp ((d f_1)_e (X)) \
       f_2 (g) = f_2 (exp (X)) = exp ((d f_2)_e (X))
  $
  So $f_1 (g) = f_2 (g)$ for all $g in V$.

  Then by the previous proposition, we have $f_1 = f_2$.
]

#remark[
  This proposition shows that homomorphism between connected lie groups are completely determined by their differentials at the identity elements.
  Which is just the local property around the identity elements.
  And by left translations, we can extend this local information to the whole lie groups.
]

#theorem[
  Let $G$ be a connected lie group. Then the following conditions are equivalent:
  #enum(
    enum.item[
      $exp: g to G$ is a group hom.
      That is $forall X, Y in g$, we have
      $exp (X + Y) = exp (X) exp (Y)$.
    ],
    enum.item[
      $G$ is abelian.
    ],
    enum.item[
      There exists a integer $k$ s.t. $G$ is isomorphic to
      $T^k times RR^(n-k)$,
      where $T^k$ is the $k$-dimensional torus: $T^k = (S^1)^k$.
    ]
  )
]
#proof[
  (1) implies (2):
  $exp$ is a local diffeomorphism around $e$.
  So there exists an open set $U$ in $g$,
  $V$ open neighborhood of $e$ in $G$,
  s.t. $exp: U to V$ is a diffeomorphism.
  For any $v in V$, exists $X in U$ s.t. $v = exp (X)$.
  Then for any $g_1, g_2 in V$,
  we have $g_1 = exp (X_1), g_2 = exp (X_2)$ for some $X_1, X_2 in U$.
  Thus
  $
    g_1 g_2 &= exp (X_1) exp (X_2) = exp (X_1 + X_2) \
    &= exp (X_2 + X_1) = exp (X_2) exp (X_1) = g_2 g_1
  $

  Since $G$ is connected, again by the previous proposition, we have $G$ is abelian.

  (2) implies (1):
  Consider the multiplication map $m: G times G to G$.
  VIew $G times G$ as a lie group in a natural way, and $m$ is a smooth map.
  And $m$ is a lie group hom since
  $
    m((g_1,g_2) (h_1, h_2)) &= m (g_1 h_1, g_2 h_2) 
    = g_1 h_1 g_2 h_2 \
    &= g_1 g_2 h_1 h_2
    = m (g_1, g_2) m (h_1, h_2)
  $

  Claim $(d m)_e (X, Y) = X + Y$.

  Then
  $
    exp(X) exp(Y) &= m (exp(X), exp(Y)) \
    &= m (exp(X,Y)) \
    &= exp ((d m)_e (X, Y)) \
    &= exp (X + Y)
  $

  (3) implies (2):
  It is easy since $RR$ and $S^1$ are abelian and connected.

  (2) implies (3):
  $exp: g to G$ is surjective by the proof of (2) implies (1).
  Then $ker (exp) subseteq g$ is a discrete subgroup of $g$.
  And by (1), it is a group hom.
  Then $G iso g \/ ker exp$.

  We have $g iso RR^n$ since $g$ is a vector space of dimension $n$.
  Since $exp$ is a local diffeomorphism around $0$,
  which implies that $ker (exp)$ is discrete subgroup of $RR^n$.
  Then by the classification of discrete subgroup of $RR^n$,
  there exists integer $k$ s.t.
  $ker (exp) iso ZZ^k subseteq RR^n$.
  Thus we have
  $G iso RR^n \/ ZZ^k iso T^k times RR^(n-k)$
]