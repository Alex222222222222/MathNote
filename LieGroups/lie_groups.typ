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

#definition[
  A lie subgroup of $G$ is a subgroup $H subseteq G$,
  such that $H$ has a lie grou pstructure and the inlcusion $H -> G$ is a lie group hom.
]
#remark[
  The topology on $H$ may not induced by the subspace topology of $G$.
]
#example[
  $forall alpha in RR$, define $f_alpha: RR to T^2, t mapsto (e^(2pi i t, e^(2 pi i alpha t)))$
  is a lie group hom.

  Then if $alpha in QQ$, then $f_alpha (RR)$ is a torus knot.
  
  If $alpha notin QQ$, then $f_alpha (RR)$ is dense in $T^2$.
  And $f_alpha (RR) iso RR -> T^2$ is a lie group hom.
  But the topology on $f_alpha (RR)$ is clearly not the subspace topology.
  And typically $f_alpha$ is an injective immersion and not an embedding.
]

#definition[
  A lie subgroup $H subset G$ is called embedded if the inlcusion map $H to G$ is an embedding of manifolds.
]

#theorem[
  If $H$ is a subgroup of a lie group $G$. Then $H$ is an embedded lie subgroup
  of $G$ iff $H$ is closed in $G$.
]
#remark[
  This is not true for general manifolds, since closed is only a topological property,
  but embedded ask for smooth structure.

  And this is true for lie group since lie group naturally carry a smooth structure.
]
#proof[
  $=>$ is easy. From manifold theory, we know that $H subset G$ is locally closed.
  We proof that if $p in overline(H)$, then $p in H$.
  There exists an nonempty open neighborhood of $e$ that $U subset G$ s.t. $H inter U = overline(H) inter U$.

  And we know that $U^(-1)$ is still open in $G$.
  And thus $L_y (U^(-1))$ open in G containing $y$.
  $y in overline(H)$ implies that $L_y (U^(-1)) inter H neq emptyset$.
  Take $x in L_y (U^(-1)) inter H$. Let $u = x^(-1) y$, and ti is eay to check that
  $u in overline(H)$.
  So $u in U inter overline(H) = U inter H$. Thus $y in H$.

  <=. It is enough to show that $H$ is embedded in $G$ near $e$. Then we can perform left translation.

  We know $exp: T_e G -> G$ is a locally diffeomorphism around $0$.
  Then take a small open neighborhood $V$ of $0$ in $T_e G$,
  s.t. $exp: V to exp(V)$ is a diffeomorphism onto its image.
  Consider $U = exp (V)$ is an open neighborhood of $e$ in $G$.
  Also consider $log: U -> V$ to be the local inverse of $exp: V to U$.

  Consider $S = {X in T_e G bar exp(t X) in H,  forall t in RR}$.
  The ideal is to construct a tangent space $T_e H$ from $T_e G$, and that
  if we apply $exp$ for all elements in $T_e H$, we get all elements in $H$ near $e$.

  It is easy to check that $0 in S$, and $forall X in S$, and $lambda in RR$,
  we have $lambda X in S$.

  Now we show that $S$ is closed under addition.
  Goal: $forall s$ sufficiently small.
  we have $exp(s X) exp(s Y) = exp (s (X + Y) + cal(O)(s^2))$.
  This is generally not true if $G$ is non-abelian.
  This can be proved using Taylor theorem for $gamma(s) = log (exp (s X) exp (s Y))$.

  Now for a large enough integer $n$,
  we have $(exp(t/n X) exp (t/n Y))^n in H$.
  And $(exp(t/n X) exp (t/n Y))^n = (exp (t/n (X + Y) + cal(O)((t/n)^2)))^n
  = exp (t (X + Y) + cal(O)(t^2/n))$.
  Take $n to infinity$, we have $exp (t (X + Y)) in overline(H) = H$.

  So $S$ is a vector subspace of $T_e G$.
  Fix a inner product $<,>$ on $T_e G = RR^n$, decompose $T_e G = S directSum S^perp$.
  Consider $psi: T_e G = S directSum S^perp to G, (x,z) mapsto exp(X) exp(Z)$,
  is a local diffeomorphism.
  Consider $F: U to S^perp$ smooth, s.t. $F(phi(X,Z)) = Z$.

  If can prove $F^(-1) (0) = H inter U$, then done, by a theorem in manifold theory.

  TODO proof of this claim.
]

#theorem[
  Let $f: G -> H$ be a group hom between lie groups $G$ and $H$.
  Then $f$ conditions iff $f$ is smooth and $f: G->H$ is a lie group hom.
]
#proof[
  Hint: consider graph of $f$.

  TODO
]

== sub lie algebra

#definition[
  $cal(g)$ lie algebra. A sub lie algebra of $cal(g)$ is a vector subspace $cal(h) subset.eq cal(g)$,
  s.t. $forall X,Y in h, [X,Y] in h$.
]

#theorem[
  $G$ be a lie group. $cal(g) = lie(G)$.
  Then exists 1-1 correspondence:
  $
    {"Connected lie subgroup of" G} xarrow(F) {"lie subalgebra of" cal(g)} \
    (H subset G) mapsto (T_e H subset T_e G)
  $
]
#proof[
  existence of $F$ is clear.

  Goal: constant $F^(-1)$. start wirth $cal(h) subset cal(g)$ be a lie subalgebra.
  Let $Y_1,..., Y_m$ be left left-invariant vector field on $G$,
  and form a basis of $cal(h)$.
  $
    E = union.big_(g in G) Spm((Y_1)_g,..., (Y_m)_g) subset T G
  $
  And $E$ is a sub bundle of $T G$. Does it exists an "integral submanifold" $H subset G$
  s.t. $forall g in G, T_g H = E_g$

  $E$ is #highlightIndex[integral] if $forall X,Y$ section of $E$,
  $[X,Y]$ is a section of $E$.

  #theorem[
    (Frobenius Thm): IF $E$ is an integral distribution. Then $forall g in G$,
    exists unique maximal connected integral submanifold $H subset G$ s.t. $g in H$.
  ]

  Sections of $E$: $sum_(i=1)^m a_i Y_i$, $sum_(j=1)^m b_j Y_j$, $a_i, b_j$ smooth functions.
  $
    [sum a_i Y_i, sum b_j Y_j] = sum_(i,j) a_i Y_i (b_j) - b_j Y_j (a_i) Y_i + a_i b_j [Y_i, Y_j]
  $
  which is a section of $E$ by lie sub algebra property of $H$.
  By Frobenius thm, there exists $H subset G$, submanifold, s.t. $e in H$.

  Why $H$ subgroup?
  $h in H$, consider $L_(h^(-1)) (H)$ integral submanifold of $H$.
  By uniqueness of $H$: $L_(h^(-1)) (H) subset H$

  TODO check smoothness.
]

== Global theory

things that could not be detected at the level of lie algebra.

$G$ lie group. $G_0$: connnected component of $e in G$.

#lemma[
  $G_0$ is a normal embedded lie subgroup of $G$.
]

Then $G / G_0 iso pi_0 (G)$, and it is a group since it $G$ is a group.

#example[
  $G = O(n), G_0 = S O(n)$, $G\/ G_0 = ZZ \/ 2ZZ$
]

#example[
  Fix $p, q$ integer subch that $p + q = n$.
  And $I_(p,q) = mat(
    + I_q,  ;
    , - I_q
  )$

  $O(p,q) = {A in M_n (RR} bar A^T Q A = Q$.
  Then $pi_0 (O(p,q)) = ZZ \/ 2 ZZ times ZZ \/ 2 ZZ$.
  If $p,q neq 0$.
  In this case $S O(p,q)$ is not connected. and $pi_0 (S O (p,q)) = ZZ \/ 2ZZ$
]

== Convering

#definition[
  A smoth map $f: M -> N$ between manifolds is a #highlightIndex[Convering]
  if $f$ is surjective and $forall q in N$, $exists U subset N$ open s.t. $q in U$
  and $f^(-1) (U) = union.sq.big_i V_i $ where $V_i$ open in $M$,
  and $f bar_(V_i): V_i to V$ is a diffeomorphism.
]
#remark[
  If $M,N$ compact manifold, $f: M to N$ smooth surjective map. s.t.
  $d f_p$ is am iso every point. Then $f: M to N$ is a Convering,
  and $forall q in N$, $f^(-1) (q)$ finite.
  If $N$ connected, $abs(f^(-1) (q))$ is independent of $q$ and is called degree of $f$.
]
#example[
  $S U(2) xarrow(2:1) S O(3)$ a 2 to 1 covering, a degree 2 covering.
  $
    Ad: S U(2) to Aut (lie(S U(2))) iso GL(3, RR)
  $
  and the image of $Ad$ is $S O(3)$
]
#example[
  $S L (2, CC) xarrow(2:1) S O (1,3)_0$.
]

#theorem[
  $pi: G to H$ be lie group hom. Asumme that $H$ is connected.
  Then $pi$ is a covering $d pi_e$ is an iso.
]
#proof[
  => clear

  <= $d pi_e$ is an iso, then by inverse function theorem, there exists $W$ open in G,
  $U$ open in $H$, s.t. $pi bar_W : W to U$ is diffeomorphism.

  By previous result, since $H$ is connected, $H$ is generated by $U$ and $U^(-1)$.

  $pi$ group hom induce that $pi$ is surjective.

  Consider the map $f: G times G to G, (g_1, g_2) mapsto g_1 g_2^(-1)$.
  $f^(-1) (W)$ open in $G times G$ containing $(e,e)$.
  By the product topology, there exists $V$ open neighborhood of $e$ in $G$.
  s.t. $V times V subset f^(-1) (W)$,
  we can also assume that $V subset W$.
  So $pi(V)$ open in $H$ since $pi$ is a local diffeo.

  $pi^(-1) (pi (V)) = union.big_(k in ker pi) L_k (V)$.

  Why are $L_k (V)$ disjoint.
  Using left translation it is enough to argue that $L_k (V) inter V = emptyset$ if $k neq e$.
  If $g_1 in L_k(V) inter V$.
  $g_1 in V$ and $g_1 = k g_2$, $g_2 in V$.
  So $g_1 g_2^(-1) = k in W$.
  Since $pi bar_W$ is diffeo, thus $g_1 g_2^(-1)  = e$, and $k = e$.
]

#corollary[
  Let $pi: G -> H$ be lie group hom, and $pi$ is a covering. then
  #enum(
    enum.item[
      $ker pi$ is a normal discrete subgroup of $G$.
    ],
    enum.item[
      If $G$ is connected, then $ker pi$ is a subgroup of $Z(G)$.
    ]
  )
]


Rcall that:
#theorem[
  For any connected manifold $M$, there is a simply connected manifold $tilde(M)$
  admitting a covering map $pi: tilde(M) to M$,
  s.t. $tilde(M)$ is a universal cover of $M$.
  And this covering is unique up to diffeomorphism.

  $
    tilde(M) = {
      [gamma] "homotopy class of paths" gamma: [0,1] to M "with" gamma(0) = e
    }
  $

  Where $e$ is a preferred a basepoint.
  And $pi([gamma]) = gamma(1)$
]

If $M$ is a lie group $G$, then there is a natural lie group structure on $tilde(G) = tilde(M)$.

Identity: $gamma_0$ is the identity path on $e$.

multiplication: $[gamma_1 (t)][gamma_2 (t)] = [gamma_1 (t) gamma_2 (t)]$.

inverse: $[gamma(t)]^(-1) = [gamma(t)^(-1)]$.

And then $pi$ become a lie group hom.

#example[
  $G = S^1 iso S O(2) iso U(1)$ we have $tilde(G) = RR$
]
#example[
  $G = S O(3)$ we have $tilde(G) = (S U (2) iso S^3$
]
#example[
  for $n ge 3$, $G = S O (n)$, we have $pi_1 (S O(n)) = ZZ \/ 2 ZZ$, and $tilde(G) = "Spin"(G)$, the spin group.
]
#remark[
  The universla cover have the universal property, that if $G, H$ be lie group.
  And $H xarrow(f) G$, be a lie group hom and covering.
  Then there exists a $tilde(G) xarrow(F) H$ s.t. 
  $
    tilde(G) xarrow(pi) G = tilde(G) xarrow(F) H xarrow(f) G
  $

  Then $H = tilde(G) \/ ker F$.

  In particular $G = tilde(G) \/ ker pi$, where $ker pi$ is a discrete subgroup contained in $tilde(G)$.
]

#theorem[
  Let $G,H$ lie groups with $G$ simply connected. Then
  #enum(
    enum.item[
      there is a 1:1 correspondence:
      $
        {"lie algebra hom" cal(g) to cal(h)} iso {"lie group hom" G to H}
      $
    ],
    enum.item[
      If $H$ is also a simply connected and if $cal(g) iso cal(h)$, then $G iso H$.
    ],
  )
]
#remark[
  Note that 2 in general will not be true, consider the universal cover $RR to S^1$,
  the lie algerba will be the same, as the covering is a local diffeomorphism.
  Lift a lie group to its universal covering is like ignore the local property,
  what we have is only the global property.
]
#proof[
  (2) is a direct result of (1).

  Given a lie group hom, constructing a lie algebra hom is easy.

  Given a $F: cal(g) to cal(h)$ be a lie algebra hom.
  Let $k = {(X, F(X)) bar X in cal(g)} subset cal(g) directSum cal(h)$.
  $F$ is a lie algerba hom, implies that $k$ be a lie subalgebra of $cal(g) directSum cal(h) iso lie (G times H)$.
  Then there exists a $K subset G times H$, s.t. $lie (K) = k$.

  TODO finish the proof
]

Mention without proof:
#theorem(title:[Ado's Theorem])[
  Let $cal(g)$ be a finite dimensional lie algebra over $RR$.
  Then $exists$ an injective lie algerba hom from $cal(g) to lie(GL(N, RR))$ for some $N$.
  Then there will exists a connected lie group $G subset GL(N,RR)$, s.t. $cal(g) = lie (G)$.
]
#remark[
  Not true that every lie group $G$ is a lie subgroup of $GL(N, RR)$.
  A typical example is the universal cover of $S L(2, RR)$, where $pi_1 (SL(2,RR))= ZZ$.
]
#theorem(title: [Lie Third Theorem])[
  there exists $1:1$ correspondence:
  $
    ({"finite dim lie algebra over" RR} \/ "iso" )
    iso
    ({"simply connected lie groups"} \/ "iso")
  $
]

== Representation Theory of Compact Lie Groups

#definition[
  A representatiion of a lie group $G$ on a finite dim vector space $V$
  is a lie group hom $rho: G to Aut(V)$.
]
#remark[
  if we have $rho$ a representatiion of $G$.
  Then exists an action $phi$ of $G$ on functions on $V$:
  $
    phi(g) (f) = f circ rho(g^(-1))
  $
]

#example[
  $G = U(1) = S^1$, for every $n in ZZ$, there is a representatiion $U_n$ of $G$ on $CC$:
  $rho_n (e^(i theta)) (z) = e^(i n theta) z$.
]
#example[
  $G = S U(2)$.
  $V_n = CC^(n+1) = "Span"(z_1^n, z_1^(n-1)z_2, ..., z_1 z_2^(n-1), z_2^n) subset "functions on" CC$.

  Theore is a obvious representatiion $S U(2) to Aut(CC^2)$.
  And by above discussion, $S U(2)$ act on the functions on $C^2$, and is invariant on $V_n$,
  thus become a representatiion on $V_n$.
]
#remark[
  $rho$ representatiion of $G$ on $V$.
  Then:
  $
    rho: G to Aut(V) \
    d rho_e: cal(g) to End(V) "lie algerba hom"
  $
  we called lie alegra representatiion of $cal(g)$.
]

#lemma[
  If $G$ os a simply connected lie group.
  Then $forall sigma: cal(g) to End(V)$ is a lie alegra hom.
  Then $exists rho: G to Aut(V)$ be a lie group representatiion, s.t. $d rho_e = sigma$.
]
#lemma[
  if we have representatiion $rho_v, rho_w$ representatiions of $G$ on $V$ and $W$,
  then we can build $rho_v directSum rho_w$ on $V directSum W$.
  also $tensor$, dual space, and $Hom$.
  This is similar for representatiion of finite group.
]

#definition[
  If we have $rho$ representatiion of $G$ on $V$ s.t. $V neq {0}$.
  #enum(
    enum.item[
      $V$ is irreducilbe if forall $W subset V$ $G$-invariant subspace then $W = {0}$ or $W = V$
    ],
    enum.item[
      $V$ is reducible if it is not irreducilbe.
    ],
    enum.item[
      $V$ is completely reducilbe if $V$ is a directSum of irreducilbe representatiion.
    ]
  )
]
#remark[
  For finite group representatiion, we can always found a irreducilbe decomposition, but for lie group,
  this is not true.
  For instance $rho(t) = mat(1,t;0,1)$, where $rho: RR to GL(2, RR)$ is reducible but not completely reducible.
]