#import "../../../utils.typ": *

=== Continuous Function

#definition(title: [continuous])[
  #footnote[As the continuity of a function depends on the topologies chosen on the domain and codomain, one may say that $f$ is continuous "relative" to specific topologies on $XX$ and $YY$.]  
  Let $XX$ and $YY$ be topological spaces.  
  A function $f: XX -> YY$ is #highlightIndex[continuous] if for each "open subset" $V$ of $YY$, the set $f^(-1)(V)$ is "open in" $XX$.
]<def:Continuous>

#theorem[
  Let $XX$ and $YY$ be topological spaces, and let $f: XX -> YY$.  
  The following are equivalent:
  #enum(
    enum.item[$f$ is continuous.],
    enum.item[For every subset $A subset.eq XX$, one has $f( overline(A) ) subset.eq overline( f(A) )$.],
    enum.item[For every closed set $B$ of $YY$, the set $f^(-1)(B)$ is closed in $XX$.],
    enum.item[For each $x in XX$ and each neighbourhood $V$ of $f(x)$, there exists a neighbourhood $U$ of $x$ with $f(U) subset.eq V$.],
  )
]

#proof[
  — 1 -> 3:  

  If $f$ is continuous and $B$ is closed in $YY$, then $YY without B$ is open so $f^(-1)(YY without B)$ is open in $XX$. But $f^(-1)(YY without B) = XX without f^(-1)(B)$, hence $f^(-1)(B)$ is closed.

  — 3 -> 1:

  Conversely, if preimages of closed sets are closed, then for any open $V subset.eq YY$ the complement $YY without V$ is closed, so $f^(-1)(YY without V)$ is closed and thus $XX without f^(-1)(V)$ is closed. Therefore $f^(-1)(V)$ is open; $f$ is continuous.

  — 1 -> 2:

  Suppose $f$ is continuous. Let $x in overline(A)$. For any open neighbourhood $U$ of $f(x)$, $f^(-1)(U)$ is an open neighbourhood of $x$ and therefore meets $A$, so $U$ meets $f(A)$. Hence $f(x) in overline( f(A) )$. This shows $f( overline(A) ) subset.eq overline( f(A) )$.

  — 2 -> 3:

  Assume item (2) holds. Let $B$ be closed in $YY$ and set $A = f^(-1)(B)$. Then $f(A) subset.eq B$, so by (2) $f( overline(A) ) subset.eq overline( f(A) ) subset.eq overline(B) = B$. Thus $overline(A) subset.eq f^(-1)(B)$ and hence $A$ is closed. (This gives that preimages of closed sets are closed.)

  — 1 -> 4:

  If $f$ is continuous and $V$ is a neighbourhood of $f(x)$, then $f^(-1)(V)$ is a neighbourhood of $x$ and $f( f^(-1)(V) ) subset.eq V$.

  — 4 -> 1:

  Suppose the local condition (4) holds. Fix an open set $V subset.eq YY$. Let $S$ be the collection of all open $U subset.eq XX$ such that $f(U) subset.eq V$. If $f^(-1)(V) = emptyset$ the claim is trivial. Otherwise let $U_0 = union.big_{U in S} U$ (the union of all such $U$). Clearly $U_0 subset.eq f^(-1)(V)$. Conversely, if $x in f^(-1)(V)$ then $f(x) in V$ so by (4) there exists a neighbourhood $U_x$ of $x$ with $f(U_x) subset.eq V$; thus $U_x in S$ and $x in U_0$. Hence $U_0 = f^(-1)(V)$. Since $U_0$ is a union of open sets it is open, so $f^(-1)(V)$ is open. Therefore $f$ is continuous.
]

#definition(title: [homeomorphism])[
  #footnote[Equivalently: $f$ is a homeomorphism iff $f$ is a bijection and for every open $U subset.eq XX$ we have $f(U)$ open in $YY$.]  
  Let $XX$ and $YY$ be topological spaces and let $f: XX -> YY$ be a bijection.  
  If both $f$ and its inverse $f^(-1): YY -> XX$ are continuous, then $f$ is a #highlightIndex[homeomorphism].
]<def:Homeomorphism>

#definition(title: [topological imbedding])[
  Suppose $f: XX -> YY$ is an injective continuous map. Let $ZZ = f(XX)$ be the image, viewed as a subspace of $YY$. The restricted map $f': XX -> ZZ$ is bijective. If $f'$ is a homeomorphism onto $ZZ$ then $f$ is a #highlightIndex[topological imbedding] (or #highlightIndex[imbedding]) of $XX$ in $YY$.
]<def:TopologicalImbedding>

#theorem(title: [Rules for constructing continuous functions])[
  Let $XX$, $YY$, and $ZZ$ be topological spaces.
  #enum(
    enum.item[(Constant function) If $f: XX -> YY$ maps all of $XX$ to a single point $y_0 in YY$, then $f$ is continuous.],
    enum.item[(Inclusion) If $A subset.eq XX$ and $j: A -> XX$ is the inclusion, then $j$ is continuous.],
    enum.item[(Composites) If $f: XX -> YY$ and $g: YY -> ZZ$ are continuous, then the composite $g ∘ f : XX -> ZZ$ is continuous.],
    enum.item[(Restricting the domain) If $f: XX -> YY$ is continuous and $A subset.eq XX$, then the restriction $f|A : A -> YY$ is continuous.],
    enum.item[(Restricting or expanding the range) If $f: XX -> YY$ is continuous and $ZZ subset.eq YY$ contains $f(XX)$, then $h: XX -> ZZ$ (range restricted) is continuous. If $YY subset.eq ZZ$ and $f: XX -> YY$ is continuous, then viewing $f$ as a map into $ZZ$ (range expanded) is continuous.]
    ,
    enum.item[(Local formulation) If $XX = union.big_(alpha) U_(alpha)$ with each $U_(alpha)$ open and each restriction $f|U_(alpha)$ continuous, then $f$ is continuous on $XX$.]
  )
]

#proof[
  (1) Constant: $f^(-1)(U)$ is either $XX$ or $emptyset$ for any open $U$, hence open.

  (2) Inclusion: For open $U subset.eq XX$, $j^(-1)(U) = U inter A$ is open in $A$.

  (3) Composites: If $U$ is open in $ZZ$ then $(g∘f)^(-1)(U) = f^(-1)( g^(-1)(U) )$, which is open.

  (4) Restricting domain: If $U$ is open in $YY$, then $(f|A)^(-1)(U) = f^(-1)(U) inter A$, open in $A$.

  (5) Restricting/expanding range: If $ZZ subset.eq YY$, an open subset of $ZZ$ is $U inter ZZ$ for some open $U subset.eq YY$, and $h^(-1)(U inter ZZ) = f^(-1)(U)$ is open in $XX$. If $YY subset.eq ZZ$, then for open $U subset.eq ZZ$ we have $h^(-1)(U) = f^(-1)(U inter YY)$, open in $XX$.

  (6) Local formulation: If $U subset.eq YY$ is open then
  $
  U = union.big_(alpha) ( U inter U_(alpha) ).
  $
  Hence
  $
  f^(-1)(U) = union.big_(alpha) (f|U_(alpha))^(-1)( U inter U_(alpha) ),
  $
  which is a union of open sets, so open.
]

#theorem(title: [Pasting lemma])[
  #footnote[The proof is similar to the local formulation above, so it is omitted.]  
  Let $XX = A union B$ with $A$ and $B$ closed in $XX$. If $f: A -> YY$ and $g: B -> YY$ are continuous and $f(x) = g(x)$ for all $x in A inter B$, then the function $h: XX -> YY$ defined by $h(x)=f(x)$ for $x in A$ and $h(x)=g(x)$ for $x in B$ is continuous.
]

#theorem(title: [Maps into products])[
  #footnote[The component maps $f_1,f_2$ are called the #highlightIndex[coordinate functions] of $f$.]  
  Let $f: A -> XX times YY$ be given by $f(a) = ( f_1(a), f_2(a) )$.  
  Then $f$ is continuous iff both $f_1: A -> XX$ and $f_2: A -> YY$ are continuous.
]

#proof[
  Let $\pi_1,\pi_2$ be the projection maps $\pi_1: XX times YY -> XX$ and $\pi_2: XX times YY -> YY$.

  For any subset $U subset.eq XX times YY$ we have
  $
  f^(-1)(U) = f_1^(-1)( \pi_1(U) ) inter f_2^(-1)( \pi_2(U) ).
  $
  Indeed, if $a in f^(-1)(U)$ then $f(a) in U$, so $f_1(a) in \pi_1(U)$ and $f_2(a) in \pi_2(U)$. Conversely, if $a$ lies in both preimages then $(f_1(a),f_2(a)) in U$ so $a in f^(-1)(U)$.

  If $f_1$ and $f_2$ are continuous then the right-hand side is an intersection of open sets for every open $U$, hence $f$ is continuous. Conversely, if $f$ is continuous then composing with projections shows each $f_i = \pi_i ∘ f$ is continuous.
]
