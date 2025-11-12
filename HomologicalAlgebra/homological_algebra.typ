#import "../utils.typ": *

= Homological Algebra

Ab-enriched -> additive -> pre-abelian -> abelian

$cal(A)$ abelian cat,
$P$ is proj. if $Hom _cal(A)(P, square)$ is exact.
$I$ is inj. if $Hom_cal(A)(square, I)$ is exact.

$cal(A)$ have enough proj.
if for each object $X in cal(A)$,
there exists an epi $P -> X -> 0$
with $P$ proj.

Enough injective is just dual of enough projective.
$cal(A)$ have enough inj.
if for each object $X in cal(A)$,
there exists an monic $0 -> X -> I$
with $I$ injective.

$Mod_R$ is enough projective and enough injective.

Replace a not good enough object by resolution,
sicne projective and injective object is kind of good.

Assume that $cal(A)$ have enough proj.
Let $M in cal(A)$.
Then exists $P_0 xarrow(phi_0) M -> 0$,
but $phi_0$ have kernel, and it may not be proj.
We could assume $P_1 xarrow(phi_1) ker phi_0 -> 0$,
and derive exact $P_1 -> P_0 -> M -> 0$.

In $Mod_R$, we could replace $P_i$ with free modules,
and $dots -> P_1 -> P_0 -> M -> 0$
is called a free resolution.
If $P_i$ is just projective,
it is called projective resolution.

By dual, we have the injective resolution
$0 -> M -> I_0 -> I_1 -> dots$

reslutions are exact.

== limits and colimits

limits = inverse limits
colimit = direct limits

Let $cal(I)$ be a small category,
$F: cal(I) -> cal(A)$ be a functor,
the limit, of $F$ is an object $L in cal(A)$
with maps $pi_i: L -> F -> F(i) , i in I$
s.t. for any $alpha in Hom(j, i), j , i in I$
the diagram commut:
#align(center, commutative-diagram(
  node((0, 0), [$L$]),
  node((1, 1), [$F(j)$]),
  node((2, 1), [$F(i)$]),
  node((0, 2), [$L'$]),
  arr((0, 0), (1, 1), [$pi_j$]),
  arr((0, 0), (2, 1), [$pi_i$], label-pos: right),
  arr((1, 1), (2, 1), [$F(alpha)$], label-pos: right),
  arr((0, 2), (0, 0), [$exists !$], "dashed"),
  arr((0, 2), (1, 1), [$pi'_j$]),
  arr((0, 2), (2, 1), [$pi'_i$]),
))

And this is universal s.t. if there exists $L'$ and $pi_i: L' -> F(i)$,
and everything commuts,
then there exists unique map $L' -> L$.
$L$ is kind of final object in category of cone.

A commutative diagram:
#align(center, commutative-diagram(
  node((0, 2), [$L$]),
  node((1, 0), [$F(i)$]),
  node((1, 1), [$F(j)$]),
  node((1, 2), [$F(k)$]),
  node((1, 3), [$...$]),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((0, 2), (1, 0), []),
  arr((0, 2), (1, 1), []),
  arr((0, 2), (1, 2), []),
  arr((0, 2), (1, 3), []),
  arr((1, 2), (1, 3), []),
))
is called a cone.

If $I$ is discete, then the limit is the products of $F(i)$,
$lim F = product_i F(i)$.

colimit is the dual of limit,
and the diagram for colimit is called cocone,
and $colim F$ is is kind of initial object for the cocone.
If $I$ is discete,
then $colim F$ is the coproduct.

equalizer is a limit,
coequalizer is a colimit.

The category Set have all limit and colimit.

#theorem[
  $C$ have all limits
  iff $C$ have all products and equalizers.
  Dually
  $C$ have all colimits
  iff $C$ have all coproduct and coequalizers.
]

$Hom_cal(A) (X, lim_I F(i)) iso lim_I Hom_cal(A) (X, F(i))$

$Hom_cal(A) (colim_I F(i), X) iso lim Hom_cal(A) (F(i), X)$


#theorem[
  $L: A -> B$, $R: B -> A$,
  and $L$ is the left adjoint of $R$,
  then $L$ preserves colim,
  and $R$ preserves lim.
]
#proof[
  $
    Hom_A (X, R(lim_i B_i))
    = Hom_B (L X, lim_I B_i)
    iso lim_I Hom_B (L(x), B_i)\
    iso lim_I Hom_A (X, R(B_i))\
    iso Hom_A (X, lim R(B_i))
  $
]
#corollary[
  Left adjoint preserve cokernel,
  thus is right exact.
  RIght adjoint preserve kernel,
  thus left exact.
]

Given $A in cal((A))$,
we have the constant functor $A -> "Func" (I, cal(A))$
limit is right adjoint to diagonal functor,
colim is left adjoint to diagonal functor.

colimit is right exact,
limit is left exact.

Tensor Product $square tensor_R M$
is left adjoint,
and it commut with all colim
thus direct sums (coproduct)
and coker

want to calculate $N tensor M$,
find presentations
$
  R^(directSum J) -> R^(directSum I) -> N -> 0
$

tensor with $M$,
and since tensor preserve coker thus right exact:
$
  R^(directSum J) tensor M-> R^(directSum I) tensor M -> N tensor M-> 0
$
As tensor commut with coproduct
$
  (R tensor M)^(directSum J)-> (R tensor M)^(directSum I) -> N tensor M-> 0
$

As $R tensor M = M$
$
  M^(directSum J)-> M^(directSum I) -> N tensor M-> 0
$

Thus, tensor product on free module,
we could calculate this.

#example[
  Let $I$ be an ideal of $R$,
  assume $I$ geneated by ${x_i}_(i in J)$
  $
    R^(directSum J) -> R -> R \/ I -> 0 \
    e_j mapsto x_j
  $

  $
    R^(directSum J) tensor M -> R tensor M -> R \/ I tensor M-> 0
  $

  $
    M^(directSum J) -> M -> R \/ I tensor M-> 0
  $

  and thus $R \/ I tensor M = M \/ (I M)$
]

If $R$ is not commutative,
we still have functor $square tensor_R M$
from right $R$ module to abelian group
this is left adjoint to $Hom_("Ab")(M, square)$
which is a functor from abelian group to right $R$ module.

#proposition[
  If $B$ is a $R-S$ bi mod
  and $C$ a right $S$ mod
  then $Hom_S (B,C)$ is a right $R$-mod
  $
    (f r)(b) = f(r b)
  $

  $
    Hom_S (B, square): mod -S -> mod -R
  $
  is right adjoint to
  $
    square tensor_R B : mod -R -> mod -S
  $
]

So also in the non commutative case
$square tensor_R B$ is right exact
and commut with all colim

#remark[
  $
    M tensor_R N = "coeq"(M tensor_ZZ R tensor_ZZ N => M tensor_ZZ N)
  $
  we know all tensor as sonn as we know tensor for abelian group
]

$P in A$ proj,
$Hom_A(P, square)$ is exact

$I in A$ inj $Hom_A(square, A)$ is exact.

#lemma[
  If $P$ is proj iff
  #align(center, commutative-diagram(
    node((1, 0), [$B$]),
    node((1, 1), [$C$]),
    node((1, 2), [$0$]),
    node((0, 1), [$D$]),
    arr((1, 0), (1, 1), [$"epi"$]),
    arr((1, 1), (1, 2), []),
    arr((0, 1), (1, 1), []),
    arr((0, 1), (1, 0), [], "dashed"),
  ))

  If $I$ inj iff
  #align(center, commutative-diagram(
    node((0, 0), [$0$]),
    node((0, 1), [$A$]),
    node((0, 2), [$B$]),
    node((1, 1), [$I$]),
    arr((0, 1), (1, 1), []),
    arr((0, 2), (1, 1), [], "dashed"),
    arr((0, 0), (0, 1), []),
    arr((0, 1), (0, 2), [$"monic"$]),
  ))
]

$P$ proj iff $P$ is a direct summand of a free mod.

#proposition(title:[Baer Criterion])[
  A right $R$ mod $E$ is injective iff 
  for every righ ideal $J$ of R
  and every $J -> E$ can be extended
    If $I$ inj iff
  #align(center, commutative-diagram(
    node((0, 0), [$0$]),
    node((0, 1), [$J$]),
    node((0, 2), [$R$]),
    node((1, 1), [$E$]),
    arr((0, 1), (1, 1), []),
    arr((0, 2), (1, 1), [], "dashed"),
    arr((0, 0), (0, 1), []),
    arr((0, 1), (0, 2), [$"inclusion"$]),
  ))
]
#corollary[
  If $R$ is a PID,
  and $R$ mod is inj iff it is divsible.
]
#example[
  in $"Ab" = ZZ$-mod
  $QQ$

  $ZZ_(p^infty)$
  
  and $QQ \/ ZZ$ are inj

  every injective abelian group have torsion part
  and free part.
  The free part is iso to a direct sum of $QQ$,
  the torsion part is a directSum of $ZZ_(p^infty)$
  (maybe for different $p$).
]

The category of abelian group have enough projective.

Let $A$ be a abelian group.
$
  I (A)= product_(Hom(A, QQ \/ ZZ)) QQ \/ ZZ
$
This is injective, as it is a product of injective.
And there is a canonical map $A -> I (A)$
where the $phi$ component of the map,
where $phi in Hom(A, QQ \/ ZZ)$
is $a mapsto phi(a)$.
And $A -> I (A)$ is injective.
As we can always find $f: A -> QQ \/ ZZ$
with $f(a) neq 0$ for any $a in A$,
using the fact that $QQ \/ ZZ$ is injective.

#proposition[
  If an additive functor $R: B -> A$
  where $B, A$ additive
  is right adjoint to an exact functor,
  and $I$ is injective in $B$,
  then $R(I)$ is injective in $A$.

  Dually,
  if $L: A-> B$
  is left adjoint to an exact functor,
  it sends proj to proj.
]
#proof[
  $Hom_A (square, R I) iso Hom_B (L square, I)$
  is a composition of two exact functors,
  so exact.
]

by adjunction
$
  Hom_"Ab" (M, A) = Hom_(mod-R) (M, Hom_"Ab" (R, A))
$

if $I$ is an inj abelian group,
then $Hom_"Ab" (R, I)$
is an injective $R$-module.

Let $M$ be an $R$-mod,
$
  I (M) = product_(Hom_R (M, Hom_("Ab") (R, QQ \/ ZZ))) Hom_("Ab") (R, QQ \/ ZZ)
$
this is injective as product of injective
is inj.
and also the canonical map $M -> I(M)$.
category of $R$-mod have enough injective.

== Chain Complexes

Let $A$ be an abvelina category
a chain complex is a family of objects
${C_n | n in ZZ}$ in $A$
with morphisms $d_n: C_n -> C_(n-1)$
s.t. $d^2 = 0$

$Z_n = ker d_n$ n-cycles
$B_n = im d_(n+1)$ n-boundaries

$B_n in Z_n$

$H_n (C) = coker (B_n -> Z_n) = Z_n \/ B_n$

We can construct a category
of chain complexes,
where morphism:
$
  u: C -> D
$
consists of $u_n : C_n -> D_n$ for all $n in Z$,
and comute
#align(center, commutative-diagram(
  node((0, 0), [$C_n$]),
  node((0, 1), [$C_(n-1)$]),
  node((1, 0), [$D_n$]),
  node((1, 1), [$D_(n-1)$]),
  arr((0, 0), (0, 1), [$d$]),
  arr((1, 0), (1, 1), [$d$]),
  arr((0, 0), (1, 0), [$u_n$]),
  arr((0, 1), (1, 1), [$u_(n-1)$]),
))

And $u$ induce a morphism $H_n (C) xarrow(u^*) H_n (D)$

$H_n: "Ch" (A) -> A$ a functor,
where $"Ch" (A)$ is the category of chain complexes

#definition[
  $u: C ->D$ is called a quasi-iso
  if the induced-maps $H_n (C) xarrow(u^*) H_n (D)$ are iso 
]

#remark[
  Homological Algebra is the study of the category
  $
    D(A) = "Ch" (A)["quasi iso"^(-1)]
  $
  we are localizing or try do define a inverse of a quasi iso.

  This is called derived category.
]
#remark[
  $f:(X,*) -> (Y, *)$
  induce $f^*:pi_n (X, *) -> pi_n (Y, *)$

  $f$ is a weak eq. if $f^*$ is an iso,
  this is homotopy algebra.
]

Excercise:
the following are eq:
+ the chain complex $C$ is exact
+ $C$ is cyclic, i.e. $H_n (C) = 0, forall n$
+ chain complex category have a $0$ object, $0 -> C$ is a quasi iso.

The dual concept

cochain complex. is a colelction ${C^n | n in ZZ}$
$d^n: C^n -> C^(n+1)$, $d circ d =0 $

$Z^n = ker d^n$ cocycles
$B^n = im d^(n-1)$ coboundaryies
$H^n (C) = Z^n \/ B^n$
cochain complex are kind of reindex of chain complex.

Bounded chain or cochain complex
are chains that is not 0 on only finite place in $ZZ$.

#example[
  Let $X$ be a top.
  $R$ ring.

  $S_k (X)$ the free $R$ module on the basis given by continuous maps
  $Delta^k -> X$.

  The map $S_k xarrow(partial_k) S_(k-1)$
  is the normal singular boundary map.

  Singualr homology

  Space homotopy $mapsto$ chain homotopy
]
#remark[
  $(S,partial)$ is a simplicial object,
  we have the Dold-Kan equavalence,
  $"simplicial objects in A" xarrow(N) "Ch"_(ge 0) (A)$
]

#definition[
  A chain map $f: C -> D$
  is a null homotopic if there are maps
  $s_n: C_n -> D_(n+1)$
  s.t. $f - 0 = s d + d s$
  #align(center, commutative-diagram(
    node((0, 1), [$C_n$]),
    node((0, 2), [$C_(n-1)$]),
    node((1, 1), [$D_n$]),
    node((1, 2), [$D_(n-1)$]),
    node((0, 0), [$C_(n+1)$]),
    node((1, 0), [$D_(n+1)$]),
    arr((0, 1), (0, 2), [$d$]),
    arr((1, 1), (1, 2), [$d$]),
    arr((0, 1), (1, 1), []),
    arr((0, 2), (1, 2), []),
    arr((0, 0), (0, 1), [$d$]),
    arr((1, 0), (1, 1), [$d$]),
    arr((0, 0), (1, 0), []),
    arr((0, 1), (1, 0), [$s$], label-pos: right),
    arr((0, 2), (1, 1), [$s$], label-pos: right),
  ))

  Two morphism $f, g: C -> D$
  are chain homotopic if $f-g$ is null homotopic.
]
#proposition[
  If $f: C-> D$ is a null homotopic,
  then $0 = f^*: H_* (C) -> H_* (D)$,
  if $f$ is chain homotopic with $g$,
  then $f_* = g_*: H_* (C) -> H_* (D)$
]
// TODO proof

#proposition[
  $"Ch" (A)$
  is an abelina category.
  ker and coker are computed level wise.

  chain complexes $A, B,C$
  are exact
  $0 -> A -> B -> C -> 0$

  iff each level exact
  $0 -> A_n -> B_n -> C_n -> 0$
]
// TODO proof

long exact seq.

If we have a SES of chain complex
$0 -> A -> B -> C -> 0$
there is a natural map
connecting homomorphism
$
  partial: H_n (C) -> H_(n-1) (A)
$
and long exact seq
$
  ... -> H_(n+1) (C) xarrow(partial)
  -> H_n (A) -> H_n (B)
  -> H_n (C)
  xarrow(partial) H_(n-1) (A) -> ...
$
#proof[
  Straightforward application of snake lemma.

  Apply snake lemma twice.

  #align(center, commutative-diagram(
    node((0, 1), [$A_n \/ d A_(n+1)$]),
    node((0, 2), [$B_n \/ d B_(n+1)$]),
    node((0, 3), [$C_n \/ d C_(n+1)$]),
    node((0, 4), [$0$]),
    node((1, 0), [$0$]),
    node((1, 1), [$Z_(n-1) (A)$]),
    node((1, 2), [$Z_(n-1) (B)$]),
    node((1, 3), [$Z_(n-1) (C)$]),
    arr((1, 0), (1, 1), []),
    arr((1, 1), (1, 2), []),
    arr((1, 2), (1, 3), []),
    arr((0, 1), (0, 2), []),
    arr((0, 2), (0, 3), []),
    arr((0, 3), (0, 4), []),
    arr((0, 1), (1, 1), [$d$]),
    arr((0, 2), (1, 2), [$d$]),
    arr((0, 3), (1, 3), [$d$]),
  ))
]
#remark[
  we have functor:
  $
    "catgegory of SES of chains" -> "category of long SES in A"
  $

  morphism in catgegory of SES of chains are just morphism
  in each column that make the diagram commute.
]

== proj. resolutions

Let $A$ be an abelian category.
#definition[
  Let $M$ be an object of $A$.
  A left resolution of $A$
  is a complex $P$,
  which is $P_i = 0$, $i < -1$,
  with map $epsilon: P_0 -> M$,
  s.t.
  $
    ... -> P_2 -> P_1 -> P_0 xarrow(epsilon) M -> 0
  $

  if all $P_i$
  is proj, then it is called projective resolution

  equavatenly, it is said that the diagram commut, and the two chain are quasi-iso
  #align(center, commutative-diagram(
    node((0, 0), [$...$]),
    node((0, 1), [$P_1$]),
    node((0, 2), [$P_0$]),
    node((0, 3), [$0$]),
    node((1, 0), [$...$]),
    node((1, 1), [$0$]),
    node((1, 2), [$M$]),
    node((1, 3), [$0$]),
    arr((0, 0), (0, 1), []),
    arr((1, 0), (1, 1), []),
    arr((0, 1), (0, 2), []),
    arr((1, 1), (1, 2), []),
    arr((0, 2), (0, 3), []),
    arr((1, 2), (1, 3), []),
    arr((0, 3), (1, 3), [$0$]),
    arr((0, 2), (1, 2), [$epsilon$]),
    arr((0, 1), (1, 1), [$0$]),
  ))

  We have right resolution,
  injective resolution.
  Which is duall.
  #align(center, commutative-diagram(
    node((0, 0), [$...$]),
    node((0, 1), [$P_1$]),
    node((0, 2), [$P_0$]),
    node((0, 3), [$0$]),
    node((1, 0), [$...$]),
    node((1, 1), [$0$]),
    node((1, 2), [$M$]),
    node((1, 3), [$0$]),
    arr((0, 1), (0, 0), []),
    arr((1, 1), (1, 0), []),
    arr((0, 2), (0, 1), []),
    arr((1, 2), (1, 1), []),
    arr((0, 3), (0, 2), []),
    arr((1, 3), (1, 2), []),
    arr((1, 3), (0, 3), [$0$]),
    arr((1, 2), (0, 2), [$epsilon$]),
    arr((1, 1), (0, 1), [$0$]),
  ))
]

#lemma[
  If $A$ have enough projective,
  then every object in $A$ have proj resolution.

  dually enough injective => have injective reslution.
]
Note, two different proj resolution have chain homotopic.

#theorem[
  Comparison theorem

  Let $P xarrow(ellipse) M$ be a proj. resolution of $M$ 
  (enough that $... -> P_1 -> P_2 -> M -> )$ is a complex with $P_i$ proj).
  And suppose that we have $f': M -> N$.
  Then for every resolution $Q xarrow(eta) N$,
  there is a chain map:
  $f: P -> Q$ lifting $f'$,
  which is unique up to chain homotopic eq.
  #align(center, commutative-diagram(
    node((0, 3), [$M$]),
    node((1, 3), [$N$]),
    node((0, 2), [$P_0$]),
    node((1, 2), [$Q_0$]),
    node((0, 1), [$P_1$]),
    node((1, 1), [$Q_1$]),
    node((0, 0), [$...$]),
    node((1, 0), [$...$]),
    arr((0, 0), (0, 1), []),
    arr((1, 0), (1, 1), []),
    arr((0, 1), (0, 2), []),
    arr((1, 1), (1, 2), []),
    arr((0, 2), (0, 3), []),
    arr((1, 2), (1, 3), []),
    arr((0, 3), (1, 3), [$f'$]),
    arr((0, 2), (1, 2), [$f_0$]),
    arr((0, 1), (1, 1), [$f_1$]),
  ))
]
#proof[
  Construct using proj properties.
]

#lemma[
  Horseshoe lemma:

  Suppose $0 -> A' -> A -> A'' -> 0$ is a SES
  and $p' xarrow(epsilon') A'$, $p'' xarrow(epsilon'') A''$
  are proj resolution,
  then there is a proj resolution $P -> A$,
  s.t. $P_n = P'_n directSum P''_n$
  s.t. $0 -> P' xarrow(i) P xarrow(pi) P'' -> 0$ is a ses of complexes.
  where $i$ is inlcusion and $pi$ is the porjection.
]
#proof[
  Construct using proj properties.
]

=== $delta$-functors

Let $A, B$ be abelian cat.

#definition[
  A homological or cohomological $delta$-functor
  betweens A and B,
  is a collection of $T_n: A -> B$ (homological),
  $T^n: A ->B$ (cohomological),
  if additive functors for $n ge 0$.
  which morphisms
  $delta_n T_n (A) -> T_(n-1)A$ (homological),
  $delta^n T^n (A) -> T^(n+1)A$ (cohomological),

  s.t. for each ses $0 -> A -> B -> C -> 0$
  in $A$,
  s.t.
  $
    ... -> T_(n+1) (C) xarrow(delta) T_n (A) -> T_n (B)
    -> T_n (C) -> xarrow(delta) -> T_(n-1) (A) -> ...
  $

    $
    ... -> T^(n-1) (C) xarrow(delta) T^n (A) -> T^n (B)
    -> T^n (C) -> xarrow(delta) -> T^(n+1) (A) -> ...
  $

  So $T_0$ are right exact and $T^0$ are left exact.

  For each morphism ofr SES, this introduce a morphism of LES:
  $0 -> A' -> B' -> C' -> 0$ to $0 -> A -> B -> C -> 0$.
]
#example[
  homology is a homological $delta$-functor
  $H_x: "Ch"_(n ge 0) (A) -> A$

  cohomology is a cohomological $delta$-functor
  $H^x: "Ch"^(n ge 0) (A) -> A$
]
#example[
  for any integer $p$,
  define
  $T_0 (A) = A \/ p A$,
  $T_ (A) = p A = {a in a | p a = 0}$.

  Then this is a homological functor
  or cohomological if ($T^1 = T_0, T^0 = T_1$).

  This would define a $delta$-functor for any ring $R$
  and any $r in Z(R)$.

  In general this is not a universal $delta$-functor.
]
#definition[
  universal delta functor.

  A morphism of a $delta$-functors
  is a collection of natural transformations
  $S_n -> T_n$ or ($S^n -> T^n$)
  commuting with the connecting morphism $delta$.
]
#definition[
  A homological delta-functor $T = {T_n}$ is universal if 
  given any other delta-functor $S$ and natural trnas:
  $f_0: S_0 -> T_n$,
  then there exists a unique morphism $f_n: S_n -> T_n$
  of delta-functor extendeding $f_0$.

  A cohomological is universal $T = {T^n}$
  if given any delta-functor $S$,
  and $f^0: T^0 -> S^0$,
  then we can extended to ${f^n: T^n -> S^n}$.
]
ex: if $F: A -> B$ is exact,
then $T_0 = F$, $T_n = 0$ othereise
is a universal delta-functor,
also define similar things for cohomological functor.

=== Derived functors
derived functors is a construction of universal delta-functor,
starting with right or left exact $F$.

Let $F: A -> B$ be a right exact functor.
Asssume that $A$ have enough projective.
For any object $A in A$,
pick a proj res $P^A -> A$, this use AC.

#definition[
  $L_i F (A) := H_i (F(P^A))$, 
  Note that $F(P^A)$ is not exact, and may have interesting results.

  For proj resolution $... -> P_1 -> P_0 -> A -> 0$,
  we apply $F$ to get $... -> F(P_1) -> F(P_0) -> 0$
  And $L_i F(A) = H_i (... -> F(P_1) -> F(P_0) -> 0)$.
]

Note $F(P_1) -> F(P_0) -> F(A) -> 0$ is exact,
since $F$ is right exact.
So $L_0 F(A) = F(A)$.

#lemma[
  If $P -> A$ and $Q -> A$ are two proj res of $A$,
  then there is a canonical iso
  $H_i (F(P)) = H_i (F(Q))$.
  These means that our choice in definition of derived functors
  does not affect the result.
]