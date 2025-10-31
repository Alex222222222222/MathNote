#import "../../../utils.typ": *

=== Closed Sets and Limit Points

#definition(title: [closed])[
  #footnote[A set can be open, or closed, or both, or neither.]  
  A subset $A$ of a topological space $XX$ is said to be #highlightIndex[closed] if $XX without A$ is "open in" $XX$.
]<def:Closed>

#theorem[
  #footnote[We omit the proof of this theorem as it is obvious.]  
  Let $XX$ be a topological space. Then the following hold:
  #enum(
    enum.item[$emptyset$ and $XX$ are closed.],
    enum.item[Arbitrary intersections of closed sets are closed.],
    enum.item[Finite unions of closed sets are closed.],
  )
]

#definition(title: [closed in])[
  Let $XX$ be a topological space and $Y subset.eq XX$ a subspace.  
  A set $A$ is said to be #highlightIndex[closed in] $Y$ if $A subset.eq Y$ and $A$ is closed in the subspace topology on $Y$.
]<def:ClosedIn>

#theorem[
  Let $Y$ be a subspace of $XX$.  
  Then a set $A$ is closed in $Y$ iff it equals the intersection of a closed set of $XX$ with $Y$.
]

#proof[
  Suppose $A$ is closed in $Y$.  
  Then there exists $B subset.eq XX$ with $B inter Y = A$, and $B$ closed in $XX$.  
  Since $(XX without B) inter Y = Y without A$ is "open in" $Y$, $A$ is closed in $Y$.

  Conversely, if $B subset.eq XX$ is closed and $A = B inter Y$, then $(XX without B)$ is open in $XX$, so $(XX without B) inter Y = Y without A$ is "open in" $Y$.  
  Hence $A$ is closed in $Y$.
]

#theorem[
  #footnote[As the proof is similar to that for open sets, it is omitted.]  
  Let $Y$ be a subspace of $XX$.  
  If $A$ is closed in $Y$ and $Y$ is closed in $XX$, then $A$ is closed in $XX$.
]

#definition(title: [interior])[
  Given a subset $A$ of a topological space $XX$, the #highlightIndex[interior] of $A$ is defined as the union of all "open sets" contained in $A$, denoted $Int(A)$.
]<def:Interior>

#definition(title: [closure])[
  Given a subset $A$ of a topological space $XX$, the #highlightIndex[closure] of $A$ is the intersection of all "closed sets" containing $A$, denoted $Cl(A)$ or $overline(A)$.
]<def:Closure>

#theorem[
  #footnote[The closure of $A$ in $XX$ and in a subspace $Y$ may differ; we always use $overline(A)$ to denote the closure of $A$ in $XX$.]  
  Let $Y$ be a subspace of $XX$, and $A subset.eq XX$.  
  Let $overline(A)$ denote the closure of $A$ in $XX$.  
  Then the closure of $A$ in $Y$ equals $overline(A) inter Y$.
]

#definition(title: [intersect])[
  Two sets $A$ and $B$ are said to #highlightIndex[intersect] if $A inter B != emptyset$.
]<def:Intersect>

#theorem[
  Let $A subset.eq XX$. Then:
  #enum(
    enum.item[$x in overline(A)$ iff every "open set" $U$ containing $x$ intersects $A$.],
    enum.item[If the topology on $XX$ is given by a basis, then $x in overline(A)$ iff every basis element $B$ containing $x$ intersects $A$.],
  )
]

#proof[
  (1) If $x in overline(A)$, then every "open set" $U$ containing $x$ intersects $A$.  
  Conversely, if every "open set" containing $x$ intersects $A$, then $x in.not overline(A)$ would imply $XX without overline(A)$ is an "open set" containing $x$ disjoint from $A$, a contradiction.  

  (2) If $x in overline(A)$, then every basis element containing $x$ intersects $A$ since every basis element is "open in" $XX$.  
  Conversely, suppose every basis element containing $x$ intersects $A$ but $x in.not overline(A)$.  
  Let  
  $
  XX without overline(A) = union_(i) B_i union union_(j) B'_j,
  $
  where $B_i$ are basis elements containing $x$ and $B'_j$ are those not containing $x$.  
  Then $x in union_(i) B_i subset.eq XX without overline(A)$, but each $B_i$ fails to intersect $A$, a contradiction.  
  Hence $x in overline(A)$.
]

#definition(title: [neighbourhood])[
  #footnote[Some mathematicians define a neighbourhood $U$ of $x$ merely as a set containing an "open set" containing $x$. This book uses the simpler definition.]  
  A set $U$ is a #highlightIndex[neighbourhood] of $x$ in $XX$ if $U$ is "open in" $XX$ and contains $x$.
]<def:Neighbourhood>

#definition(title: [limit point, point of accumulation, cluster point])[
  #footnote[Note that $x$ may or may not belong to $A$; this distinction is irrelevant.]  
  If $A subset.eq XX$, a point $x$ is a #highlightIndex[limit point] of $A$ iff every "open set" $U$ containing $x$ intersects $A$ in some point other than $x$.  
  Equivalently, $x in overline(A without {x})$.
]<def:LimitPoint>

#theorem[
  #footnote[We omit the proof of this theorem as it is obvious.]  
  Let $A subset.eq XX$, and let $A'$ be the set of all limit points of $A$. Then  
  $
  overline(A) = A union A'.
  $
]

#corollary[
  #footnote[We omit the proof of this corollary as it is obvious.]  
  A subset of a topological space is closed iff it contains all its limit points.
]

#definition(title: [converge])[
  #footnote[In the real line, a sequence cannot converge to multiple points, but this may happen in general topological spaces.]  
  A sequence $x_1, x_2, x_3, ...$ is said to #highlightIndex[converge] to $x$ if for every "neighbourhood" $U$ of $x$, there exists a positive integer $N$ such that for all $n > N$, $x_n in U$.
]<def:Converge>

#definition(title: [Hausdorff space])[
  A topological space $XX$ is called a #highlightIndex[Hausdorff space] if for every pair of distinct points $x_1, x_2 in XX$, there exist disjoint neighbourhoods $U_1$ and $U_2$ of $x_1$ and $x_2$, respectively.
]<def:HausdorffSpace>

#theorem[
  #footnote[This implies that a sequence in a Hausdorff space cannot converge to multiple points.]  
  #footnote[The condition “every finite point set is closed” is weaker than Hausdorffness. For example, the finite complement topology on $RR$ satisfies it but is not Hausdorff.]  
  Every finite point set in a Hausdorff space $XX$ is closed.
]

#proof[
  Let $A$ be a finite point set in a Hausdorff space $XX$.  
  If $A$ has one element, then for every $x in XX without A$, there exists a neighbourhood of $x$ disjoint from $A$, so $A$ is closed.

  Assume all finite sets with fewer points are closed.  
  Let $x_0 in XX without A$.  
  Since finite unions of closed sets are closed, $A union {x_0}$ is closed.  
  By induction, all finite point sets in a Hausdorff space are closed.
]

#theorem[
  If $XX$ is Hausdorff, then any sequence of points in $XX$ converges to at most one point.
]

#proof[
  Suppose a sequence  
  $
  x_1, x_2, x_3, ...
  $
  converges to multiple points  
  $
  y_1, y_2, y_3, ...
  $
  in $XX$.  
  Then there exist integers $n_1, n_2, ...$ and neighbourhoods $U_1, U_2, ...$ with  
  $
  x_n in U_i, quad y_i in U_i  "for"  n > n_i.
  $
  Choosing disjoint $U_1, U_2$ (possible in a Hausdorff space) leads to a contradiction.  
  Thus, every sequence in a Hausdorff space converges to at most one point.
]

#definition(title: [limit])[
  If a sequence $x_n$ in a Hausdorff space converges to $x$, we write $x_n -> x$ and call $x$ the #highlightIndex[limit] of the sequence.
]<def:Limit>

#definition(title: [$T_1$ axiom])[
  A space satisfies the #highlightIndex[$T_1$ axiom] if every finite point set is closed.
]<def:T1Axiom>

#theorem[
  Let $XX$ satisfy the $T_1$ axiom, and let $A subset.eq XX$.  
  Then a point $x$ is a limit point of $A$ iff every "neighbourhood" of $x$ contains infinitely many points of $A$.
]

#proof[
  If every "neighbourhood" of $x$ contains infinitely many points of $A$, then each "neighbourhood" of $x$ intersects $A$ in infinitely many points other than $x$, so $x$ is a limit point.

  Conversely, if $x$ is a limit point but some "open set" $U$ containing $x$ meets $A$ in finitely many points, let  
  $
  U' = U inter (A without {x}),
  $
  so $x in.not U'$.  
  Let  
  $
  U'' = U without U' = U inter (XX without U').
  $
  Since $U'$ is a finite point set and finite sets are closed, $U''$ is open and contains $x$, yet it meets $A$ only at $x$ (or not at all), contradicting the assumption.  
  Hence, every "neighbourhood" of $x$ must meet $A$ in infinitely many points.
]

#theorem[
  #footnote[We omit the proof of this theorem as it is obvious.]  
  Every simply ordered set is Hausdorff in the order topology.
]

#theorem[
  #footnote[We omit the proof of this theorem as it is obvious.]  
  The product of two Hausdorff spaces is Hausdorff.
]

#theorem[
  #footnote[We omit the proof of this theorem as it is obvious.]  
  Any subspace of a Hausdorff space is Hausdorff.
]
