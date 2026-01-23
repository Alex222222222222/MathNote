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