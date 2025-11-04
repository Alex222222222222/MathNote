#import "../../utils.typ": *

== Muiltilinear Algebra

#lemma[
  Let $G$ be a finite group.
  Let $V$ be a $k$-vector space and let $G times V -> V$
  be a $G$-action on the set $V$.
  Then this extends to a
  $k G$-module structure on $V$
  if and only if the $G$-action on $V$
  is linear, which means that the following condition holds:
  $
    g(lambda v + gamma w) = lambda (g v) + gamma (g w),
    forall g in G,
    v,w in V, lambda,gamma in k.
  $
]
#remark[
  If a $G$-action is linear,
  then $G$ naturally defines a $G$-representation.
]

#definition(title: [Direct Sum of Representation])[
  Let $G$ be a finite group.
  And $V, W$ be $G$-representations.
  The #highlightIndex[direct sum]
  is the vector space
  $V directSum W$,
  which is a $G$-representation via
  $
    g(v,w) = (g v , g w), forall g in G, v in V, w in W
  $
]
#remark[
  Note that this is equivalent with the idea that
  we could define $k G$-modules $V,W$,
  and the $k G$-modules $V directSum W$
  is just the $k G$-module defined by the direct sum of
  representation $V directSum W$.
]

#definition[
  Let $G$ be a finite group.
  Let $V, W$ be $G$-representations.
  Then vector space $Hom (V, W)$
  of all linear maps from $V$ to $W$
  admits a linear $G$-action by
  $
    (g f)(v) = g f (g^(-1 ) v), forall g in G, f in Hom(V, W)
    v in V.
  $
]

#definition(title: [Dual Representation])[
  Let $G$ be a finite group.
  Let $V$ be a $G$-representation. The
  #highlightIndex[dual representation]
  is the space $dualSpace(V)$
  of all linear functions $f : V-> k$ on $V$ . The group $G$ acts on
  $dualSpace(V)$
  via
  $
    (g f) (v) = f (g^(-1) v) forall g in G, f in dualSpace(V),
    v in V
  $
]

#definition(title: [Tensor Product Representation])[
  Let $G$ be a finite group.
  Let $V, W$ be finite dimensional $k G$-modules.
  Define a linear $G$-action on the tensor product $V tensor W$ by setting
  $
    g (v tensor w) := (g v) tensor (g w) forall g in G,
    v in V, w in W.
  $
  This defines the
  #highlightIndex[tensor product representation]
  $V tensor W$ .
]

#lemma[
  Let $V$ and $W$ be finite dimensional kG-modules.
  Then there is an isomorphism of $k G$-modules
  $
    dualSpace(V) tensor W iso Hom(V, W)
  $
]
#proof[
  Just the Tensor-Hom adjunction.
]

It turns out that the tensor square $V tensor V$
is reducible whenever $dim V ge 2$.

#definition(title: "Symmetric and Alternating Square")[
  Suppose that $char(k) neq 2$
  and let $V$ be a finite dimensional vector space.
  #enum(
    enum.item[
      For each $v, w in V$, define
      $
        v w := 1/2 (v tensor w + w tensor v) in V tensor V.
      $
      
      The #highlightIndex[symmetric square]
      of $V$ is the subspace of $V tensor V$:
      $
        S^2 V := chevron.l
          {
            v w | v,w in V
          }
        chevron.r
      $
      Which is the subspace of $V tensor V$
      geneated by the set ${v w | v,w in V }$.
    ],
    enum.item[
      For each $v, w in V$, define
      $
        v and w := 1/2 (v tensor w - w tensor v) in V tensor V.
      $
      
      The #highlightIndex[alternating square]
      of $V$ is the subspace of $V tensor V$:
      $
        and^2 V := chevron.l
          {
            v and w | v,w in V
          }
        chevron.r
      $
      Which is the subspace of $V tensor V$
      geneated by the set ${v and w | v,w in V }$.
    ],
  )
]

#lemma[
  Let $dim V = n$
  and suppose that $char(k) neq 2$.
  Then
  #enum(
    enum.item[
      $V tensor V = S^2 V directSum and^2 V$.
    ],
    enum.item[
      $dim S^2 V = (n(n+1))/2$
      and $dim and^2 V = (n(n-1))/2$.
    ],
    enum.item[
      If $V$ is a $G$-representation,
      then $S^2 V$ and $and^2 V$
      are $G$-stable,
      and $S^2 V$ and $and^2 V$ are $G$-representation
      via the subspace representation.
    ]
  )
]
#proof[
  Straightforward verifications.
]
#remark[
  Using similar ideas,
  it is possible to find proper $k G$-submodules of the tensor cube
  $V tensor V tensor V$, one for each irreducible representation of
  $k S_3$. Similarly we obtain a
  decomposition of the $n$th tensor power $tensor.b _n V$ of
  $V$ as a direct sum of $k G$-submodules
  $S^lambda V$,
  one for each irreducible representation $lambda$ of the
  symmetric group $S_n$.
]
