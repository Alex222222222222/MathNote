#import "../utils.typ": *

= Low Dimensional Topology

== General Theory

=== Topological Manifolds

#definition(title: [Topological Manifolds])[
    $n$-dimensional #highlightIndex[topological manifolds] $M$ is a topological space
    s.t.
    #enum(
        enum.item[
            $forall x in M$ has an open neighbourhood $U$ of $x$,
            that is homeomorphic to an open subset of $RR^n$.
        ],
        enum.item[
            $M$ is Hausdorff and second countable.
        ],
    )
]

#example[
    #enum(
        enum.item[
            $RR^n$, $S^n$, $RR P^n$, $CC P^n$.
        ],
        enum.item[
            Lie groups: $G L(n)$, $S L(n)$, $O(n)$, $S O(n)$, $U(n)$, $S U(n)$.
        ]
    )
]

#remark[
    The definition is different with smooth manifolds,
    which requires the transition maps between charts to be smooth.
]

// TODO manifold with boundary, and the definition of boundary

#definition(title: [Closed Manifolds])[
    A topological manifold $M$ is called closed if it is compact and $partial M = emptyset$.
]

#definition(title: [Submanifolds])[
    Let $M$ be a $n$-dimensional topological manifold.
    $N subset M$ is a #highlightIndex[submanifold] if it is a manifold with the subspace
    topology.

    $N$ is a #highlightIndex[locally flat sub manifold] if for each $x in N$,
    there exists a neighbourhood $U$ of $x$ in $M$,
    s.t. $(U, U inter N) iso (RR^n, RR^k)$ for some $k le n$.
]

#example[
    $K subset S^3$ connected locally flat $1$-dimensional submanifold is a #highlightIndex[knot].

    $K$ is a #highlightIndex[trivial knot] if $(S^3, K) iso (S^3, S^1)$.
]

#definition(title: [Orientable])[
    A compact connected $n$-dimensional topological manifold $M$ is #highlightIndex[orientable] if
    $H_n(M) iso ZZ$ if $M$ is closed  or $H_n (M) iso ZZ$ if $partial M neq emptyset$.

    The #highlightIndex[orientation] of $M$ is a choice of generator of the above $ZZ$.
]

#theorem[
    A $1$ dimensional connected manifold $M$ without boundary then 
    $M iso S^1, RR, [0, infinity), [0,1]$
]

#lemma[
    $dim (M times N) = dim(M) + dim(N)$
]

#lemma[
    $partial(M times N) = (partial M times N) union (M times partial N)$
]

#definition(title:[Connected Sum])[
    Let $M_1, M_2$ be two $n$-dimensional closed topological manifolds.
    The #highlightIndex[connected sum] $M_1 \# M_2$ is defined as follows:

    Choose two embedded $n$-balls $B_1 subset M_1$, $B_2 subset M_2$,
    then define
    $
        M_1 \# M_2 := (M_1 setminus int(B_1)) union_(partial B_1 iso partial B_2) (M_2 setminus int(B_2))
    $
    where the gluing map is a homeomorphism $partial B_1 iso partial B_2$.
]

Let $Sigma_g = T^2 \# T^2 \# ... \# T^2 (Sigma_0 = S^2)$.
$N_g = RR P^2 \# RR P^2 \# ... \# RR P^2$

#theorem(title: [Classification of Closed Surfaces])[
    Any closed connected $2$-dimensional topological manifold is homeomorphic to
    one of the following:
    #enum(
        enum.item[
            $S^2$,
        ],
        enum.item[
            $Sigma_g$ for some $g ge 1$,
        ],
        enum.item[
            $N_g$ for some $g ge 1$,
        ],
    )
]

#theorem[
    For every finitely presented group $G$, and $n > 3$, then there is a
    closed $n$-dimensional topological manifold $M$,
    s.t. $pi_1(M) iso G$.
]

#theorem[
    There is no algorithm to decide whether two finite group presentations
    give isomorphic groups.
    Thus there is no algorithm to decide whether two closed topological manifolds
    of dimension $n ge 4$ are homeomorphic.
]

==== Fibre Bundle

#definition(title: [Fibre Bundle])[
    A #highlightIndex[fibre bundle] consists of a continuous surjection $pi: E to B$,
    where $E$ is the #highlightIndex[total space], $B$ is the #highlightIndex[base space],
    and together with a topological space $F$ is the #highlightIndex[fibre],
    s.t. for each $b in B$, there exists an open neighbourhood $U$ of $b$,
    and a homeomorphism $h: pi^{-1}(U) iso U times F$ called a #highlightIndex[local trivialization],
    that the following diagram commutes:
    #align(center, commutative-diagram(
    node((0, 0), [$pi^(-1) (U)$]),
    node((0, 1), [$U times F$]),
    node((1, 1), [$U$]),
    arr((0, 0), (0, 1), [$h$], "dotted"),
    arr((0, 1), (1, 1), [$p_U$]),
    arr((0, 0), (1, 1), [$pi$], label-pos: right),
    ))
    where $p_U$ is the projection map.
]

#definition(title: [Section])[
    A #highlightIndex[section] of a fibre bundle $pi: E to B$ is a continuous map
    $s: B to E$ s.t. $pi circ s = id_B$.
]

#definition(title: [Vector Bundle])[
    A #highlightIndex[vector bundle] is a fibre bundle $pi: E to B$,
    where the fibre $F$ is a vector space over $CC$ or $RR$,
    and the local trivializations $h: pi^{-1}(U) iso U times F$
    are #highlightIndex[linear homeomorphisms] on each fibre.
]

== Morse Theory & Handle Decomposition

== Whiney Trick & $h$-cobordism Theorem

== $3$-Manifolds

== Knots

== $4$-Manifolds