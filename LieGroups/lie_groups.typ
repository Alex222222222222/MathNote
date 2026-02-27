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
This is called the push forward of $X$ by $f$.

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

A flow of X: $forall p in X$, $exists epsilon > 0$, $exists U$ open neighbourhood of $p$,
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
  A lie algebra is a vector space $V$
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
    ],
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
    ],
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
  and $(C_g)_*$ is the push forward of $C_g$.
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
  Consider $L_g (V)$ is a open neighbourhood of $g$.
  For any $h in L_g (V)$, we have $h = g v$ for some $v in V$.
  Thus $h = v_1^plus.minus v_2^plus.minus ... v_k^plus.minus v$.
  So $h in F$.
  Thus $F$ is open.

  $F$ is closed:

  Take $g in overline(F)$. Consider $L_g (V)$ is an open neighbourhood of $g$.
  As $g$ is in the closure of $F$, then there exists $h in F inter L_g (V)$.
  So $h = g v$ for some $v in V$.
  Thus $g = h v^(-1)$.
  As $h in F$ and $v in V$, we have $g in F$.
]

#proposition[
  Let $G$ and $H$ be lie groups.
  Assume that $G$ is connected,
  then if $f_1, f_2: G to H$ both be lie group hom,
  s.t. $(d f_1)_e = (d f_2)_e$. Then $f_1 = f_2$.
]
#proof[
  Since $exp: g to G$ is a local diffeomorphism around $e$,
  then there exists an open set $U$ in $g$, $V$ open neighbourhood of $e$ in $G$,
  s.t. $exp: U to V$ is a diffeomorphism.

  Then for any $g in V$,
  exists $X in U$ s.t. $g = exp (X)$.
  Thus
  $
    f_1 (g) = f_1 (exp (X)) = exp ((d f_1)_e (X)) \
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
    ],
  )
]
#proof[
  (1) implies (2):
  $exp$ is a local diffeomorphism around $e$.
  So there exists an open set $U$ in $g$,
  $V$ open neighbourhood of $e$ in $G$,
  s.t. $exp: U to V$ is a diffeomorphism.
  For any $v in V$, exists $X in U$ s.t. $v = exp (X)$.
  Then for any $g_1, g_2 in V$,
  we have $g_1 = exp (X_1), g_2 = exp (X_2)$ for some $X_1, X_2 in U$.
  Thus
  $
    g_1 g_2 & = exp (X_1) exp (X_2) = exp (X_1 + X_2) \
            & = exp (X_2 + X_1) = exp (X_2) exp (X_1) = g_2 g_1
  $

  Since $G$ is connected, again by the previous proposition, we have $G$ is abelian.

  (2) implies (1):
  Consider the multiplication map $m: G times G to G$.
  VIew $G times G$ as a lie group in a natural way, and $m$ is a smooth map.
  And $m$ is a lie group hom since
  $
    m((g_1,g_2) (h_1, h_2)) & = m (g_1 h_1, g_2 h_2)
                              = g_1 h_1 g_2 h_2 \
                            & = g_1 g_2 h_1 h_2
                              = m (g_1, g_2) m (h_1, h_2)
  $

  Claim $(d m)_e (X, Y) = X + Y$.

  Then
  $
    exp(X) exp(Y) & = m (exp(X), exp(Y)) \
                  & = m (exp(X, Y)) \
                  & = exp ((d m)_e (X, Y)) \
                  & = exp (X + Y)
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
  such that $H$ has a lie group structure and the inclusion $H -> G$ is a lie group hom.
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
  A lie subgroup $H subset G$ is called embedded if the inclusion map $H to G$ is an embedding of manifolds.
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
  There exists an non-empty open neighbourhood of $e$ that $U subset G$ s.t. $H inter U = overline(H) inter U$.

  And we know that $U^(-1)$ is still open in $G$.
  And thus $L_y (U^(-1))$ open in G containing $y$.
  $y in overline(H)$ implies that $L_y (U^(-1)) inter H neq emptyset$.
  Take $x in L_y (U^(-1)) inter H$. Let $u = x^(-1) y$, and ti is eay to check that
  $u in overline(H)$.
  So $u in U inter overline(H) = U inter H$. Thus $y in H$.

  <=. It is enough to show that $H$ is embedded in $G$ near $e$. Then we can perform left translation.

  We know $exp: T_e G -> G$ is a locally diffeomorphism around $0$.
  Then take a small open neighbourhood $V$ of $0$ in $T_e G$,
  s.t. $exp: V to exp(V)$ is a diffeomorphism onto its image.
  Consider $U = exp (V)$ is an open neighbourhood of $e$ in $G$.
  Also consider $log: U -> V$ to be the local inverse of $exp: V to U$.

  Consider $S = {X in T_e G bar exp(t X) in H, forall t in RR}$.
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
  Consider $F: U to S^perp$ smooth, s.t. $F(phi(X, Z)) = Z$.

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

  Goal: constant $F^(-1)$. start with $cal(h) subset cal(g)$ be a lie subalgebra.
  Let $Y_1,..., Y_m$ be left left-invariant vector field on $G$,
  and form a basis of $cal(h)$.
  $
    E = union.big_(g in G) Spm((Y_1)_g, ..., (Y_m)_g) subset T G
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

$G$ lie group. $G_0$: connected component of $e in G$.

#lemma[
  $G_0$ is a normal embedded lie subgroup of $G$.
]

Then $G / G_0 iso pi_0 (G)$, and it is a group since it $G$ is a group.

#example[
  $G = O(n), G_0 = S O(n)$, $G\/ G_0 = ZZ \/ 2ZZ$
]

#example[
  Fix $p, q$ integer such that $p + q = n$.
  And $I_(p,q) = mat(
    + I_q, ;
    , - I_q
  )$

  $O(p,q) = {A in M_n (RR} bar A^T Q A = Q$.
  Then $pi_0 (O(p,q)) = ZZ \/ 2 ZZ times ZZ \/ 2 ZZ$.
  If $p,q neq 0$.
  In this case $S O(p,q)$ is not connected. and $pi_0 (S O (p,q)) = ZZ \/ 2ZZ$
]

== Covering

#definition[
  A smooth map $f: M -> N$ between manifolds is a #highlightIndex[Covering]
  if $f$ is surjective and $forall q in N$, $exists U subset N$ open s.t. $q in U$
  and $f^(-1) (U) = union.sq.big_i V_i$ where $V_i$ open in $M$,
  and $f bar_(V_i): V_i to V$ is a diffeomorphism.
]
#remark[
  If $M,N$ compact manifold, $f: M to N$ smooth surjective map. s.t.
  $d f_p$ is am iso every point. Then $f: M to N$ is a Covering,
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
  $pi: G to H$ be lie group hom. Assume that $H$ is connected.
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
  By the product topology, there exists $V$ open neighbourhood of $e$ in $G$.
  s.t. $V times V subset f^(-1) (W)$,
  we can also assume that $V subset W$.
  So $pi(V)$ open in $H$ since $pi$ is a local diffeomorphism.

  $pi^(-1) (pi (V)) = union.big_(k in ker pi) L_k (V)$.

  Why are $L_k (V)$ disjoint.
  Using left translation it is enough to argue that $L_k (V) inter V = emptyset$ if $k neq e$.
  If $g_1 in L_k(V) inter V$.
  $g_1 in V$ and $g_1 = k g_2$, $g_2 in V$.
  So $g_1 g_2^(-1) = k in W$.
  Since $pi bar_W$ is diffeomorphism, thus $g_1 g_2^(-1) = e$, and $k = e$.
]

#corollary[
  Let $pi: G -> H$ be lie group hom, and $pi$ is a covering. then
  #enum(
    enum.item[
      $ker pi$ is a normal discrete subgroup of $G$.
    ],
    enum.item[
      If $G$ is connected, then $ker pi$ is a subgroup of $Z(G)$.
    ],
  )
]


Recall that:
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

  Where $e$ is a preferred a base point.
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
  The universal cover have the universal property, that if $G, H$ be lie group.
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
  the lie algebra will be the same, as the covering is a local diffeomorphism.
  Lift a lie group to its universal covering is like ignore the local property,
  what we have is only the global property.
]
#proof[
  (2) is a direct result of (1).

  Given a lie group hom, constructing a lie algebra hom is easy.

  Given a $F: cal(g) to cal(h)$ be a lie algebra hom.
  Let $k = {(X, F(X)) bar X in cal(g)} subset cal(g) directSum cal(h)$.
  $F$ is a lie algebra hom, implies that $k$ be a lie subalgebra of $cal(g) directSum cal(h) iso lie (G times H)$.
  Then there exists a $K subset G times H$, s.t. $lie (K) = k$.

  TODO finish the proof
]

Mention without proof:
#theorem(title: [Ado's Theorem])[
  Let $cal(g)$ be a finite dimensional lie algebra over $RR$.
  Then $exists$ an injective lie algebra hom from $cal(g) to lie(GL(N, RR))$ for some $N$.
  Then there will exists a connected lie group $G subset GL(N, RR)$, s.t. $cal(g) = lie (G)$.
]
#remark[
  Not true that every lie group $G$ is a lie subgroup of $GL(N, RR)$.
  A typical example is the universal cover of $S L(2, RR)$, where $pi_1 (SL(2, RR))= ZZ$.
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
  A representation of a lie group $G$ on a finite dim vector space $V$
  is a lie group hom $rho: G to Aut(V)$.
]
#remark[
  if we have $rho$ a representation of $G$.
  Then exists an action $phi$ of $G$ on functions on $V$:
  $
    phi(g) (f) = f circ rho(g^(-1))
  $
]
#remark[
  If $V$ is a real vector space, then the representation is a real representation,
  and if $V$ is a complex vector space, then the representation is a complex representation.

  As complex number is algebraic closed, it a lot of times is simpler then the real representation theory.
]

#example[
  $G = U(1) = S^1$, for every $n in ZZ$, there is a representation $U_n$ of $G$ on $CC$:
  $rho_n (e^(i theta)) (z) = e^(i n theta) z$.
]
#example[
  $G = S U(2)$.
  $V_n = CC^(n+1) = "Span"(z_1^n, z_1^(n-1)z_2, ..., z_1 z_2^(n-1), z_2^n) subset "functions on" CC$.

  There is a obvious representation $S U(2) to Aut(CC^2)$.
  And by above discussion, $S U(2)$ act on the functions on $C^2$, and is invariant on $V_n$,
  thus become a representation on $V_n$.
]
#remark[
  $rho$ representation of $G$ on $V$.
  Then:
  $
    rho: G to Aut(V) \
    d rho_e: cal(g) to End(V) "lie algebra hom"
  $
  we called lie algebra representation of $cal(g)$.
]

#lemma[
  If $G$ os a simply connected lie group.
  Then $forall sigma: cal(g) to End(V)$ is a lie algebra hom.
  Then $exists rho: G to Aut(V)$ be a lie group representation, s.t. $d rho_e = sigma$.
]
#lemma[
  if we have representation $rho_v, rho_w$ representations of $G$ on $V$ and $W$,
  then we can build $rho_v directSum rho_w$ on $V directSum W$.
  also $tensor$, dual space, and $Hom$.
  This is similar for representation of finite group.
]

#definition[
  If we have $rho$ representation of $G$ on $V$ s.t. $V neq {0}$.
  #enum(
    enum.item[
      $V$ is irreducible if forall $W subset V$ $G$-invariant subspace then $W = {0}$ or $W = V$
    ],
    enum.item[
      $V$ is reducible if it is not irreducible.
    ],
    enum.item[
      $V$ is completely reducible if $V$ is a directSum of irreducible representation.
    ],
  )
]
#remark[
  For finite group representation, we can always found a irreducible decomposition, but for lie group,
  this is not true.
  For instance $rho(t) = mat(1, t; 0, 1)$, where $rho: RR to GL(2, RR)$ is reducible but not completely reducible.
]

#example[
  $1$-dimensional representation are irreducible.
]
#example[
  $V_n$, $(n+1)$-dim representation of $S U(2)$, and this representation are irreducible.
]
#example[
  tensor product of irreducible is not irreducible in general.
]
#example[
  A irreducible representation might become reducible for a subgroup.
  $U(1) subset S U (2), e^(i theta) mapsto mat(e^(i theta), 0; 0, e^(-i theta))$.
  $V_n$ as a representation of $U(1)$ is completely reducible.
  $
    V_n iso U_n directSum U_(n-2) directSum ... directSum U_(-n)
  $
]

#theorem(title: [Schur's Lemma])[
  $V, W$ irreducible representation of $G$.
  If $f: V to W$ $G$-invariant hom. Then
  #enum(
    enum.item[
      Either $f = 0$ or $f$ is an isomorphism.
    ],
    enum.item[
      If $V$ are complex representation,
      and if $f: V -> V$ $G$-invariant,
      then $f = lambda id$ for some $lambda in CC$.
    ],
  )
]
#proof[
  #enum(
    enum.item[
      $f: V to W$, then $ker f subset V$, is a $G$-invariant subspace.
      By $V$ irreducible, we have $ker f = 0$ or $ker f = V$.
      If $ker f = V$, then $f = 0$, we are done.
      If $ker f = 0$, then $f$ is injective.
      Consider $Img f subset W$, again by $W$ irreducible,
      we have $Img f = W$ or $Img f = 0$.
      If $Img f = W$, then it is surjective.
      If $Img f = 0$, then it is $0$.
    ],
    enum.item[
      There exists a eigenvalue $lambda in CC$, s.t.
      $ker (f - lambda I) subset V$ is a $G$-invariant subspace.
      As $lambda$ is a eigenvalue, the kernel of $f - lambda I$ must not be $0$,
      thus $f - lambda I = V$, and we are done.
    ],
  )
]

#lemma[
  If $G$ os an abelian lie group, and if $V$ is a reducible complex representation.
  Then $dim V = 1$.
]
#proof[
  $rho: G to Aut(V)$.
  Fix $g in G$.
  Define $A_g: V to V, v mapsto rho(g) v$.

  Claim: If $G$ is abelian then $A$ is a $G$-invariant homomorphism.

  By Schur's Lemma, there exists $lambda_g in CC$, s.t. $A_g = lambda_g id$.

  Consider $v in V setminus {0}$. Then $forall g in G$,
  $rho(g) v = lambda_g v$.
  So the line $CC v$ is $G$-invariant.
  As $V$ is irreducible, so $V= CC v$, and $V$ is one-dimensional.
]

A analogue for real representation is:

#lemma[
  Let $G$ be an abelian compact connected lie group.
  Let $V$ be a real irreducible representation, then:
  $V = RR$ a trivial representation.
  or $V= RR^2$ a standard representation of $U(1) = S O (2)$, which is the action by rotation.
]
#remark[
  By classification of abelian lie group,
  we have compact connected lie group is just $T^n$, for some $n$.
]

For finite representation theory, then every representation is completely reducible,
but this cannot be true for general lie group, but for compact lie group,
things become nice again.

#theorem[
  If $G$ is a compact lie group, then every representation (real or complex)
  is completely reducible.
]
#proof[
  Sketch of proof:

  The proof kind of imitate the proof fore finite group.
  What we do is to cook up a $G$-invariant inner product,
  and the representation split as a representation and its orthogonal representation.

  #definition[
    $V$ representation of $G$, $rho: G to Aut(V)$.
    An inner product $< -, - >$ is $G$-invariant if $forall g in G$,
    and $forall , v in V$,
    we have
    $
      chevron.l rho(g) u, rho(g) v chevron.r = chevron.l u, v chevron.r
    $
  ]

  #remark[
    $V$ real, if exists $G$-invariant $chevron.l -,- chevron.r$ then $V$ is orthogonal.
    If $V$ complex, if exists $G$-invariant $chevron.l -,- chevron.r$ then $V$ is unitary.
  ]

  #proposition[
    If $V$ admit a $G$-invariant inner product, then $V$ is completely reducible.
  ]
  #proof[
    Induction on $dim V$.
    $dim V = 1$, done.

    $dim V > 1$, if $V$ irreducible, done.
    If $V$ reducible, then exists $G$-invariant subspace, $W subset V$,
    s.t. $W neq V$ and $W neq 0$.
    Consider $V = W directSum W^perp$,
    because the inner product is $G$-invariant,
    we have $W^perp$ is also $G$-invariant, and we can then apply the induction hypothesis.
  ]

  Then, we cook up a $G$-invariant inner product for compact lie group representation $V$.

  Recall: If $G$ if $G$ is finite, pick any inner product $chevron.l -,- chevron.r$ on $V$,
  to modify into $G$-invariant, we define a new inner product:
  $chevron.l u,v chevron.r_G = 1/ (abs(G)) sum_(g in G) chevron.l rho(g) u, rho(g) v chevron.r$.

  For compact lie group, we will do this by a integration.
  To do this, we need a volume form.

  #theorem[
    $G$ compact lie group.
    $exists !$ map $C^0 (G) to RR, f mapsto integral_G f$, note hte integral here is purely notational.
    s.t.
    #enum(
      enum.item[
        $integral_G 1 = 1$
      ],
      enum.item[
        if $f > 0$, then $integral_G f > 0$.
      ],
      enum.item[
        $forall lambda_1, lambda_2 in RR$,
        then $integral_G (lambda_1 f + lambda_2 f) = lambda_1 integral_G f_1 + lambda_2 integral_G f_2$.
      ],
      enum.item[
        $integral_G f circ L_h = integral_G f$
      ],
      enum.item[
        $integral_G f circ R_h = integral_G f$
      ],
      enum.item[
        $integral_G f circ i = integral_G f$,
        where $i: G to G$ is the inverse of the lie group.
      ],
    )

    This is called the Haur measure.
  ]

  We pick any inner product $chevron.l -,- chevron.r$ on $V$.
  Define $chevron.l u,v chevron.r_G = integral_G chevron.l rho(g) u, rho(g) v chevron.r_G$.
  And we could check this is a $G$-invariant inner product, and we are done,
]

=== Characters of representation of lie group

#definition[
  Let $G$ be a lie group.
  And $rho: G -> Aut(V)$ some representation of $G$ over $FF = RR "or" CC$.
  Then  the Character of $rho$ is
  $
    chi_V: G to FF \
    g mapsto tr (rho (g))
  $
]
#example[
  $G = S^1$, with representation $U_n$.
  then:
  $
    chi_(U_n): S^1 to CC \
    t = e^(i theta) mapsto t^n
  $
]

#proposition[
  Given a lie group $G$,
  then a $V$ representation of $G$.
  Then,
  #enum(
    enum.item[
      $chi_V$ is a smooth function
    ],
    enum.item[
      $chi_V (e) = dim V$
    ],
    enum.item[
      $chi_V (h^(-1) g h) = chi_V (g)$
    ],
    enum.item[
      $chi_(V directSum W) = chi_V + chi_W$
    ],
    enum.item[
      $chi_(V tensor W) = chi_V chi_W$
    ],
    enum.item[
      $chi_(V^*) (g) = chi_V (g^(-1))$.
      Moreover if $V$ is orthogonal or unitary,
      we have $chi_(V^*) (g) = overline(chi_V (g))$.
    ],
  )
]

#example[
  Let $G = S U (2)$.
  $V_n$ irreducible representations of $S U(2)$.
  subgroup
  $
    U(1) subset S U(2) \
    e^(i theta) mapsto mat(e^(i theta), 0; 0, e^(-i theta))
  $

  $V_n$ as representation of $U(1)$:
  we have $V_n iso U_n directSum U_(n-2) directSum ... directSum U_(2-n) directSum U_n$.

  Thus $chi_(V_n) (t) = t^n + ... + t^(-n)$, forall $t in U(1)$.
  Since all matrix in $S U(2)$ are diagonalisable, we can easily compute the Character.
]

#definition[
  $V$ a representation of $G$, $V^G$ is the fixed space.
]

#proposition[
  Given a $G$ compact lie group.
  $
    V^G = {integral_G rho(g) w | w in V}
  $
]
#remark[
  This similar to the finite case, as the integral is similar to the average of sum over $G$.
]
#proof[
  Let $W = {integral_G rho(g) w | w in V}$.

  To prove that $W subset V^G$.
  Take $h in G, w in V$.
  we have
  $
    rho(g) (integral_G rho(g) w) = integral_G rho(h) rho(h) w\
    =integral_G rho(h g) = integral_G rho(g) w "          "("by" integral_G "is left invariant")
  $

  To prove that $V^G subset W$.
  Take $v in V^G$.
  Then
  $
    integral_G rho(g) v = v
  $
]

#lemma[
  $G$ compact.
  Then $dim V^G = integral_G chi_V (g)$
]
#proof[
  Consider the average map:
  $
    p: V to V^G\
    w mapsto integral_G rho(g) w
  $

  By the previous proposition, the map is projection.
  And by linear algebra
  $
    dim V^G = tr (p) = tr (w mapsto integral_G rho(g) w) \
    = integral_G tr(w mapsto rho(g) w) = integral_G chi_V (g)
  $
]
#definition[
  $V, W$ representation of $G$.
  $
    Hom_G (V, W) = {G"-invariant hom" V to W}
    = Hom(V, W)^G = (V^* tensor W)^G
  $
]

#theorem[
  $G$ representation $V, W$.
  then there is a natural inner product
  $
    chevron.l chi_V, chi_W chevron.r = integral_G overline(chi_V (g)) chi_W (g)
    = dim Hom_G (V, W)
  $
]
#proof[
  $
    dim Hom_G (V, W) = dim (V^* tensor W)^G
    = integral_G chi_(V^* tensor W) (g) \
    = integral_G chi_(V^*) (g) chi_W (g)
    = integral_G overline(chi_(V) (g)) chi_W (g)
  $

  The last step is because $G$ is compact, then $V$ is unitary or orthogonal.
]

#corollary[
  $G$ compact. $V, W$ irreducible representation of $G$.
  Then if $V neq W$, then $chevron.l chi_V, chi_W chevron.r = 0$.
  If $FF = CC$, then $chevron.l chi_V, chi_V chevron.r = 1$,
  if $FF = RR$, then $chevron.l chi_V, chi_V chevron.r ge 1$.
]
#remark[
  This is often refer to the orthogonality of Characters.
]
#proof[
  Use the last theorem together with Schur's Lemma.
]

Since every finite group is a compact lie group by consider it as a discrete topology space,
then the theory is a complete generalisation of the representation theory of finite group.

#theorem[
  $G$ compact, $V, W$ representation.
  Then $chi_V = chi_W$ implies $V iso W$.
  When $FF = CC$.
]
#proof[
  If $V$ and $W$ are irreducible, then this theorem
  is just a consequence of the last corollary.

  In general this follow from the fact that all representation of compact lie group
  are completely reducible.
  $
    V iso directSum.big_i V_i^(directSum n_i)
  $
  where $V_i$ is not isomorphic to $V_j$ if $i neq j$.

  If we allow some of the $n_i$, and $m_i$  to be $0$,
  we also have:
  $
    W iso directSum.big_i V_i^(directSum m_i)
  $

  To prove that $V iso W$, we only need to prove that $n_i = m_i$.

  For $FF = CC$,
  then $n_i = innerProduct(chi_V, chi_(v_i))$.
  If $chi_V = chi_W$, then $n_i = m_i$.
]
// TODO check the case for FF = RR.

#definition[
  $V$ unitary or orthogonal representation of $G$.
  Then, pick ${v_1, ..., v_n}$ unitary or orthonormal basis of $V$.
  Define #highlightIndex[matrix coefficients] of $V$.
  $
    rho_(i,j)^V: G to FF\
    g mapsto innerProduct(rho(g) v_i, v_j)
  $
]
#remark[
  This is similar to the representation matrix of finite group.
]
#theorem[
  All matrix coefficients $rho_(i,j)^V$ for all $i,j$ and for all $V$
  irreducible rep of $G$ are orthogonal.
]
This statement is like saying this map is injective:
$
  directSum.big_(V "irreducible rep of" G \/ "iso") V tensor V^* to L^2 (G) \
  v_i tensor v_j^* mapsto rho_(i,j)^V
$
#theorem(title: [Peter-Weyl Theorem])[
  the above map is a iso
]
#example[
  $G = S^1$. Then all irreducible representation are $U_n$,
  and this correspondent to Fourier series in $L^2 (S^1)$.
]

== Maximal Tori

For this section, $G$ will always be a compact connected lie group.
#example[
  $T^n = (S^1)^n$ is a compact connected lie group.
]

#definition[
  For any $G$ compact connected lie group,
  a torus in $G$ is a subgroup $T subset G$,
  which is isomorphic to some $T^n$.

  A maximal torus is a torus $T subset G$,
  s.t. for all $T' subset G$ torus, s.t. $T subset T'$, then $T = T'$.
]

#example[
  $G = U(n)$.
  $
    T = mat(
      e^(i theta_1);
      , dots.down;
      , , e^(i theta_n)
    )
  $

  Exercise: check this is a maximal torus. Hint: all matrix that commute with a diagonal matrix with distinct entries must be a diagonal matrix.
]
#example[
  $G = S U(n)$.
  $
    T = mat(
      e^(i theta_1);
      , dots.down;
      , , e^(i theta_n)
    ),
    e^(i theta_1) dots e^(i theta_n) = 1
  $

  is a maximal torus of $S U(n)$.
]

#lemma[
  Let $T$ be a torus in $G$. Then:
  #enum(
    enum.item[
      $T$ is am embedded lie subgroup.
    ],
    enum.item[
      $exists T' subset G$ maximal torus s.t. $T subset T'$
    ],
    enum.item[
      If $T$ is maximal, then $g T g^(-1)$ is also a maximal torus.
    ],
    enum.item[
      $T$ is a maximal torus iff $T$ is a "compact" maximal connected abelian subgroup of $G$.

      // TODO check if compact is needed
    ],
  )
]
#proof[
  #enum(
    enum.item[
      $T$ must be compact, thus $T$ closed in $G$,
      and by previous thm, $T$ is a embedded lie subgroup.

      // TODO ref theorem
    ],
    enum.item[
      If $T$ is maximal, we are done.

      If $T$ is not maximal.
      then $exists T'$ torus, $T subset T'$, $T neq T'$.
      We then prove that $dim T' > dim T$.

      Recall that connected lie subgroups is 1-1 correspondence with lie subalgebra.
      thus $lie(T) subset.neq lie(T')$. But lie algebra is vector space,
      thus $dim lie(T) < dim lie(T')$,
      and thus $dim T' > dim T$.

      Then by induction, we get a maximal torus, since the dimension of $G$
      is limited.
    ],
    enum.item[
      Problem sheet.
    ],
    enum.item[
      Problem sheet.
    ],
  )
]

#example[
  $G = "SO"(2n)$.
  $
    T = {
      mat(
        R_1;
        , dots.down;
        , , R_n;
      )
      bar
      R_i in "SO"(2)
    }
  $
  and will be a maximal torus.

  Also if $G = "SO"(2n+1)$
  $
    T = {
      mat(
        R_1;
        , dots.down;
        , , R_n;
        , , , 1;
      )
      bar
      R_i in "SO"(2)
    }
  $
  will be a maximal torus of $"SO"(2n+1)$.
]

#definition[
  The Weyl group of a maximal torus $T$ in $G$ is:
  $
    W = N_G (T) \/ T
  $
  where $N_G (T)$ is the normalizer of $T$ in $G$.
  And $T$ is a normal subgroup of $N_G (T)$.
]
#remark[
  We will see that all maximal torus will be conjugated.
  So $W$ up to isomorphism will only depend on $G$.
  And we call "The Weyl group of $G$".
]
#example[
  $G = "SU"(2)$.
  $
    T = {mat(
      e^(i theta),0;
      0, e^(-i theta);
    )}
  $
  what is $W$.

  Take $g in G$, s.t. $g T g^(-1) = T$.

  Since the conjugation preserve eigenvalues.
  Thus $g$ permutes diagonal elements.

  If the permutation is trivial, then $g$ commute with every $t in T$ implies $g in T$.

  If $g$ is the only non-trivial permutation, since permutation of two elements
  only have $2$ elements.
  
  Conclusion: $W = ZZ \/ 2 ZZ$.

  Exercise: $G = S U(n)$. Then $W = S_n$ the symmetric group.
]

#proposition[
  $W$ is finite.
]
#proof[
  Let $N_0$ be the connected component of the identity in $N_G (T)$.
  Then $N_G (T) / N_0$ is discrete and finite, since $G$ is a compact lie group.

  We assert that $N_0 = T$.
  Since $T$ is connected, $T subset N_0$.

  Goal $N_0 subset T$.

  $N_0$ acts by conjugation on $T$,
  so $N_0$ acts on $lie(T)$ by $Ad$ the adjoint action.
  And these two actions are compatible with
  $
    exp: lie(T) -> T
  $
  So $N_0$ acting on $lie (T)$ preserves $ker exp iso ZZ^n$.
  Since $N_0$ connected, and $ZZ^n$ discrete implies this action is trivial.

  So $N_0$ acting on $T$ acts trivially.
  That means for all $g in N_0$ and $t in T$, we have $g t = t g$.

  If $exists g in N_0$, $g notin T$,
  then we could define $T'$ as a lie subgroup of $G$ generated by $T$
  and a $1$-parameter subgroup passing through $g$.
  And we can check that $T'$ is a closed connected abelian subgroup,
  by the classification of abelian lie group, this contradicts the maximality of $T$.
]

#theorem[
  $G$ be a compact connected lie group:
  #enum(
    enum.item[
      If $T subset G$ maximal torus,
      then $G = {g t g^(-1) | g in G, t in T}$.

      If $G$ is the unitary group, then this statement is just the spectral theorem.
      If $G$ is a lie group with underlying set a matrix, then this statement is like a diagonalisable statement.
    ],
    enum.item[
      If $T$ and $T'$ are two maximal tori in $G$.
      Then $exists g in G$ s.t. $T' = g T g^(-1)$.
    ]
  )
]
#proof[
  (1) => (2).
  #definition[
    $T$ torus in $G$. $t in T$ is a generator of $T$
    if the closure of ${t^n | n in ZZ}$ is $T$.
  ]
  #example[
    If $T = S^1$, and $t = e^(i theta 2 pi)$,
    then $t$ is a generator iff $theta notin QQ$. 
  ]
  Exercise, for any torus, we can find a generator.
  And the some continuity property if it apply to the generator, then it applies to the whole torus.

  Take $T, T'$ two maximal tori.
  Take $t'$ a generator.
  Then by $(1)$, there exists $g in G, t in T$, s.t. $t'  = g t g^(-1) in g T g^(-1)$.
  And $(t')^n in g T g^(-1)$.
  And
  $
   T' = overline({t^n | n in ZZ}) subset g T g^(-1)
  $

  Since $T'$ and $g T g^(-1)$ are both maximal tori, we have $T' = g T g^(-1)$.
]

#proof[
  Sketch of proof of (1).

  First, given a maximal torus $T$, construct
  $
    tilde(F): G times T to G \
    (g, s) mapsto g^(-1) s g
  $

  Goal, prove that $tilde(F)$ is surjective.

  Claim, induced map
  $
    F: G \/ T times T to G,
    G \/ T = {g T bar g in G}
  $
  new Goal: $F$ is surjective,.

  claim:
  $G \/ T$ is naturally a compact manifold,
  fix $innerProduct(-,-)$ an inner product
  on $frak(g)$,
  s.t. $Ad$ representation of $G$ on $frak(g)$ is orthogonal over
  $innerProduct(-,-)$.

  Then $frak(g) = frak(t) directSum frak(t)^perp$, where $frak(t) = lie (T)$.
  
  Claim:
  $
    T_(e T) (G/ T) iso frak(t)^perp
  $

  $F: G\/ T times T to G$ is a smooth map between compact manifold of same dimension.

  Second step:
  $G, T, G\/ T$ are all orientable.

  Step 3:
  We want to understand the fibre of $F$.
  Take $t in T$ be a generator.
  Then this implies that
  $abs(F^(-1)(t)) = abs(W)$, where $W$ is the Weyl group.

  So $(g T, s) in F^(-1)(t))$, then $g^(-1) s g = t$,
  $s = g t g^(-1)$
  so $s^n = g t^n g^(-1)$.
  Implies $t^n in g^(-1) T g$,
  implies $T subset g^(-1) T g$,
  then $T = g^(-1) T g$,
  thus $g in W$.

  Step 4:

  Take $t in T$ generator.
  We have $t$ a regular value of $F$.
  And for all $p in F^(-1) (t)$.
  Then $sign det(d F_p)$ is independent of $p$.

  By a result of differential geometry:
  If we have a map $F: M -> N$ be maps between compact manifold,
  and 
  $
    deg(F) = sum_(p in F^(-1) (t)) sign det (d F_p)
  $
  where $t$ is regular value.
  In particular, if $deg F neq 0$, then $F$ is surjective.
]

#corollary[
  If $G$ is a compact connected lie group,
  then $exp: frak(g) to G$ is surjective.
]
#proof[
  Let $T$ be a maximal torus,
  and for $g in G$, then by previous theorem,
  we have $g = h^(-1) t h$, where $t in T$, and $h in G$.

  Also $exp: frak(t) to T$ is surjective, by the knowledge of the manifold $T^n$.
  take $t = exp(s)$, where $s in frak(t)$.
  Then $g = h^(-1) exp(s) h = exp(Ad_h (s))$.
]

== Sections

#definition[
  let $G$ be compact connected lie group.
Let rank of $G$ be the $dim T$,
for $T subset G$ a maximal torus.
]

#example[
  $rank U(n) = n$,

  $dim U(n) \/ T = n^2 - n = n(n-1)$ always even.
]

#proposition[
  $dim G \/ T$ is always even.
]
#proof[
  $G$ acts on $frak(g)$ via $Ad$.
  Then we have $T$ act on $frak(t)$ via $Ad bar _T$.

  Take $frak(t) subset frak(g)$ a invariant subspace,
  since $T$ abelian, $T$ must act trivially on $frak(t)$.

  Since $frak(g) = frak(t) directSum frak(t)^perp$
  so $T$ acts on $frak(t)^perp$,
  where $T$ as a compact connected abelian group,
  must be a torus.

  Then $frak(t)^perp$ as a representation of $T$.
  Then $frak(t)^perp iso RR^m directSum directSum.B g_n$,
  where $g_n$ are $2$-dim irreducible representation of $T$.
  $T to S^1 = S O (2)$.

  For the $RR^m$ part,
  if $x in frak(t)^perp$
  is invariant under $Ad bar _T$,
  then $exp(s x)$ commute with $T$,
  contradicts the maximality of $T$.
  So $dim frak(t)^perp$ is even.
]

In general $G$ lie group, $T subset G$ maxi torus,
then as a representation of $T$,
$
  frak(g) iso frak(t) directSum directSum.B g_a
$

where $g_a$ 2-dim irreducible representation of $T$.

$theta_a: frak(t) to RR$ linear so $theta_a in frak(t)^*$,

#definition[
  The elements $plus.minus theta_a$ in $frak(t)^*$ are the roots of $G$.
]

#example[
  $G = U(n)$,
  $T$ the diagonal matrices.
  Roots: $plus.minus (x_j - x_k), j < k$.
]

#definition[
  Root hyperplane:
  $
    ker theta_a = {
      (x_1,...,x_n) in t bar theta_a (x_1,...,x_n) = 0
    }
  $
]

Weyl group $W = N_G (T) \/ T$ finite group.

$W$ natural acts on $frak(t)$.

#theorem[
  $W$ is the group generated by orthogonal reflections respect to roots hyperplane.
]

#example[
  we can calculate using this method that the Weyl group of $SU(3)$ is just $S_3$
]

== Application of maximal tori to understand the representations

#definition[
  Let $G$ to be a connected compact lie group.
  And consider complex representations.
  Consider
  $
    R(G) = {
      sum_i n_i V_i
      bar
      V_i "are non-isomorphic irreducible of rep of" $G$,
      n_i in ZZ, "and this is a finite sum"
    }
  $

  For any representation $V$ of $G$, 
  we know it is a directSum of irreducible representation,
  thus correspondent to a unique element in $R(G)$.

  But a element in $R(G)$ like the negative integers form
  does not represent a real representation.

  $R(G)$ has a ring structure,
  where sum is induced by directSum.
  And product is induced by tensor product.

  And is called a representation ring of $G$.
]

#definition[
  Character ring
  $
    chi(R(G)) = {
      sum_i n_i chi_i
      bar
      chi_i "characters of irreducible representation",
      n_i in ZZ
    }
  $

  sum and product of functions on $G$.

  And the obvious map
  $
    R(G) to chi(R(G))
  $
  is an isomorphism of ring.
  Because lie group representation is uniquely determined by its character.
]
#example[
  $G = U(1) = S^1$.
  All the irreducible representation are 1 dimensional,
  and they are
  $
    U_n: e^(i theta) mapsto (e^(i theta))^n 
  $
  and
  $
    chi_(U_n) (t) = t^n
  $

  And $R(U(1)) = ZZ[t, t^(-1)]$.
]
#example[
  For any $G$,
  such that $V$ a irreducible representation of $G$.
  Let $T subset G$ maximal torus.
  $V$ As a representation if $T$,
  $
    V iso directSum_a V_a
  $
]

#lemma[
  The Weyl group $W$ permutes the weights.
]

#theorem[
  $
    chi(R(G)) -> chi(R(T))^W \
    chi_V mapsto chi_V bar_T
  $
  is a iso.
]