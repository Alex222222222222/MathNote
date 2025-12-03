#import "../utils.typ": *

= Homological Algebra

Ab-enriched -> additive -> pre-abelian -> abelian

$cal(A)$ abelian cat,
$P$ is proj. if $Hom_cal(A)(P, square)$ is exact.
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
this is left adjoint to $Hom_(Ab)(M, square)$
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

#proposition(title: [Baer Criterion])[
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
  in $Ab = ZZ$-mod
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
  Hom_Ab (M, A) = Hom_(mod-R) (M, Hom_Ab (R, A))
$

if $I$ is an inj abelian group,
then $Hom_Ab (R, I)$
is an injective $R$-module.

Let $M$ be an $R$-mod,
$
  I (M) = product_(Hom_R (M, Hom_(Ab) (R, QQ \/ ZZ))) Hom_(Ab) (R, QQ \/ ZZ)
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
$d^n: C^n -> C^(n+1)$, $d circ d =0$

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
  $T_(A) = p A = {a in a | p a = 0}$.

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
  $f_0: S_0 -> T_0$,
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

Kind of measures how far the $F$ functor away from left exact.

#lemma[
  If $P -> A$ and $Q -> A$ are two proj res of $A$,
  then there is a canonical iso
  $H_i (F(P)) = H_i (F(Q))$.
  These means that our choice in definition of derived functors
  does not affect the result.
]
#proof[
  Aply the comparision theory,
  there is a chain map
  $f: P -> Q$,
  which lifts the Identity on $id_A : A -> A$

  this induces $f_x: H_i (F(P)) -> H_i (F(Q))$.

  Any other lifting $f'$ hace a chain homotopic with $f$
  on $P -> Q$, thus this also induces a chain homotopic on
  $H_i (F(P)) -> H_i (F(Q))$
  so $f'_* = f_*$.

  There is also another lifting $g: Q -> P$,
  so $g f: P -> P$
  is also a lifting,
  thus, the identity lifting must be homotopic with $g f$,
  thus $g_* f_* = (g f)_* = id_*$,
  similalry $f_* g_* = (f g)_* = id_*$.

  So $f_*$ and $g_*$ are iso.
]

#corollary[
  If A is proj.
  Then $L_i F(A) = 0, forall i neq 0$.
]

We also need to show that $L_i$ is a functor,
#lemma[
  if $f : A -> A'$ is a morphism in A,
  then there is a natural map
  $
    L_i F f: L_i F A to L_i F A'
  $
]
#proof[
  P' -> A' , P -> A be resolution,
  and f: A -> A' lift to a map between resolution $tilde(f)$.

  This induces a map
  $
    tilde(f)_*: H_i F P to H_i F P'
  $
  and this map does not depend on the lifting.
]
#proposition[
  $L_i F$ is an additive functor from A to B.
]
#proof[
  L_i F sends identity to identity.

  And if we have $A' xarrow(f) A xarrow(g) A''$.
  And lifts $tilde(f), tilde(g)$ of $f, g$,
  And also $tilde(g) circ tilde(f)$ is a lift of $g f$.

  And by definition of induced map of homology,
  $L_i F$ is a functor.
]

If $f_1, f_2: A' -> A$,
and two lifts $tilde(f)_1, tilde(f)_2$,
then $tilde(f)_1 + tilde(f)_2$ is a lifting of $f_1 + f_2$.

ALso homology functor is additive,
thus $L_i F$ is additive.

#theorem[
  L_i F form a homological delta functor (and is a universal).
]
#proof[
  Given a SES in $A$: $0 -> A' -> A -> A'' -> 0$.
  And proj resolution $P' -> A'$ $P'' -> A$,
  we could use Horseshoe lemma to produce a projective resolution
  $P -> A$
  s.t. we have a ses of complexes $0 -> P' -> P -P'' -> 0$

  For each $n$,
  by Horseshoe,
  $0 -> P'_n -> P_(n) -> P''_n -> 0$ is split.
  As $F$ is additve, it send split ses to split ses,
  thus $0-> F P'_n -> F P_(n) -> F P''_n -> 0$ is ses and split.

  And the resulting LES is defined by snake lemma.

  We should check this is functorial,
  if we have map between ses,
  then it induces a map between the resulting LES.
  But it is easy and we omit.
]

Derived functor

D(A) = Ch (A) [q.i^(-1)] q.i. means quasi iso

D^- (A) = CH^- (A) [q.i^(-1)] bounded above

Ch^- (Proj_A) / (homotopic \~) is equivalent with D^- (A)

but
Ch^- (Proj_A) / (homotopic \~) is very simple.


If $F: A -> B$, assume A have enough injective.
is a left exact functor,
we define its right derived functors
$R^i F (A) = H^i F (I_A)$,
where $I_A$ is an injective resolution of $A$.

Note $R^i F(A) = (L_i F^"op")^("op")(A)$.
And all the proves above work for $R^i F(A)$,
and R^i F(A) is a cohomological delta functor.

#definition[
  For any object A of abelian category A,
  $Hom (A, square): A -> Ab$ is left exact.

  We define $Ext^i_A (A, B) := R^i Hom(A, square) (B)$
]
#remark[
  We have:
  $B$ is injective iff $Hom(square, B)$ is exact
  iff $Ext^i_A (A, B) = 0, forall i neq 0$
  iff $Ext^1_A (A, B) = 0$

  A is proj. iff $Hom(A, square)$ is exact
  iff $Ext^i_A (A, B) = 0, forall i neq 0$
  iff $Ext^1_A (A, B) = 0$
]

#lemma[
  Balancing of $Hom$
  $R^i Hom(square, B) (A) iso R^i Hom(A, square) (B)$
]

#definition[
  If $R$ is a ring and $B$ a left $R$ module,
  we have $square tensor_R B$
  is a functor $Mod-R -> Ab$
  is right exact.

  Define $"Tor"^R_n (A, B)= L_n (square tensor_R B) (A)$

  $L_n (A tensor_R square)(B) iso L_n (square tensor_R B) (A)$
]

Technital tool: Mapping Cone


$f: X-> Y$ continuous map of top,
Mapping cylinder. useful in topology


$f: B -> C$ be map of complexes,
Define the $"Cone"(f)_n = B_(n+1) directSum C_n$

$d(b,v) = (-d(b), d(c) - f(b))$

is just
$
  mat(-d_B, 0; -f, d_c) times mat(B_(n-1); directSum; C_n) to
  mat(B_(n-2); directSum; C_(n-1))
$

There is a ses
$
  0 -> C -> "Cone"(f) -> B[-1] -> 0 \
  c mapsto (0,c) \
  (b,c) mapsto -b
$

LES
$
  H_(n+1) ("Cone"(f)) -> H_n (B) xarrow(partial) H_n (C) -> H_n ("Cone"(f))
$

#lemma[
  $partial$ is just $f_*$ induced by $f: B -> C$.
]
// TODO proof

#corollary[
  $f: B -> C$ is a quasi iso
  if the chain complex $"Cone"(f)$ is exact.
]
#remark[
  Similar we have cylinder $"Cy"(f) = B_n directSum B_(n-1) directSum C_n$

  $
    mat(
      d, id, 0;
      0, -d, 0;
      0, -f, d;
    )
    mat(
      B_n;
      directSum;
      B_(n-1);
      directSum;
      C_n;
    )
  $

  SES:

  $
    0 xarrow(f) C -> xarrow(g) D -> 0
  $

  #align(center, commutative-diagram(
    node((0, 0), [$0$]),
    node((0, 1), [$B$]),
    node((0, 2), [$"Cyl" (f)$]),
    node((0, 3), [$"Cone" (f)$]),
    node((0, 4), [$0$]),
    node((1, 0), [$0$]),
    node((1, 1), [$B$]),
    node((1, 2), [$C$]),
    node((1, 3), [$D$]),
    node((1, 4), [$0$]),
    arr((0, 1), (1, 1), [$id$]),
    arr((0, 2), (1, 2), [$beta$]),
    arr((0, 3), (1, 3), [$phi$]),
    arr((1, 0), (1, 1), []),
    arr((1, 1), (1, 2), []),
    arr((1, 2), (1, 3), []),
    arr((1, 3), (1, 4), []),
    arr((0, 0), (0, 1), []),
    arr((0, 1), (0, 2), []),
    arr((0, 2), (0, 3), []),
    arr((0, 3), (0, 4), []),
  ))

  can construct $beta$ naturally and
  $beta$ is quasi iso
  by five lemma $phi$ is also quasi

  important to understand $D (A)$
]

=== Double complexes

A abelian

$A -> "Ch" (A) -> "Ch" ("Ch" (A))$

a doulbe complexes cat is iso to $"Ch" ("Ch" (A))$

#definition[
  A double complex or bicomplex in $A$
  is a collection ${C_(p,q)}$
  of objects.
  $
    d^h: C_(p,q) -> C_(p-1,q)
  $
  $
    d^v: C_(p,q) -> C_(p,q-1)
  $

  and $(d^h)^2 = 0$, $(d^v)^2 = 0$

  $d^v d^h + d^h d^v = 0$

  note the square does not commut,
  it is anti-commute.
]
#remark[
  if we replace
  $d^v_(p,q)$
  with $(-1)^p d^v_(p,q)$
  htne we get a $"Ch" ("Ch" (A))$
]

#definition[
  a total complex

  given a bicomplex

  can define

  $
    "Tot"^pi (C)_n = product_(p+q = n) C_(p,q) \
    "Tot"^directSum (C)_n = directSum.big_(p+q = n) C_(p,q)
  $

  and $d = d^v + d^h$,
  and $d^2 = 0$ iff bicomplex anti-commute.

  only defines if $A$ have contable sums, product
]
#lemma[
  Acyclic assembly lemma
  let $C$ be a double complex.

  if "$C$ is an upper half-plane complex.
  with exact columns."

  or "$C$ is right half plane complex with exact rows"

  then $"Tot"^pi (C)$ is acyclic.

  if "$C$ is an upper half-plane complex.
  with exact rows."

  or "$C$ is right half plane complex with exact columns"

  then $"Tot"^directSum (C)$ is acyclic.
]
#remark[
  enough to assime diagonals are bounded fomr below or above
  to have similar results.
]
#proof[
  proof of the first part.

  Let $C$ be a upper-halfplane bicomplex with exact columns.
  we will show that $H_0 ("Tot"^pi (C)) = 0$.
  By translation we get $"Tot"^pi (C)$ is acyclic.

  let $c = (..., C_(-1,1), C_(0,0)) in product C_(-p,p) = "Tot"^pi (C)_0$.

  We will use induction to find elements $b_(-p, p+1)$
  s.t. $d^v (b_(-p, p+1)) + d^h (b_(-p, p+1)) = c_(-p,p)$.

  // TODO finish the proof
]
#remark[
  Spectral sequences
]

== Balancing Tor and Ext

Suppose P and Q are complexes,
of right and left R-modules
we can form double complexs
of abelian groups $P tensor_R Q$
with $(p,q)$ terms
is just
$P_p tensor_R Q_q$
and horozontal differential
is just $d tensor 1$, wehere $d$ is differential of $P$,
and vertical differential is $(-1)^p tensor d$,
to make this anti-commute.

#theorem[
  $L_n (A tensor_R square) (B) iso L_n (square tensor_R B) (A)
  = "Tor"_n^R (A,B)$
  and they are iso as functors
]
#proof[
  chosse a proj res $P xarrow(epsilon) A$
  and proj res $Q xarrow(eta) B$.
  Vie $A$ and $B$ as complexes concentated in degree $0$.

  Look at the bicomplex
  $P tensor Q$, $A tensor Q$
  and $P tensor B$,
  and we get maps
  $
    A tensor Q <- P tensor Q -> P tensor B
  $

  and we get induced map of total complexes
  $
    "Tot"^directSum (A tensor Q) <- "Tot"^directSum (P tensor Q) -> "Tot"^directSum (P tensor B)
  $ <1>

  By definition $"Tot"^directSum (A tensor Q) iso A tensor Q$,
  and $"Tot"^directSum (P tensor B) iso P tensor B$.

  this induces morphism of homology
  $
    H_* (A tensor Q) <- H_* "Tot"^directSum (P tensor Q) -> H_* (P tensor B)
  $
  and $H_* (P tensor B) = L_* (- tensor B)(A)$
  ad $H_* (A tensor Q) = L_* (A tensor -)(B)$

  we want to show that both map in @1 are quasi-iso.
  then we need to prove that the cone of these maps is exact.

  Idea: realise the cone as a total complex of a bicomplex,
  with exact rows or columns.

  And the cone is just the total complex with two rows with adjusted signs
  to make it anti commute.

  We look at the double complex $C$ obtaiend from $P tensor Q$
  by adding $A tensor Q [-1]$ in the column
  $p=-1$ using agmentation,
  we get that $"Tot" (C) [1]$
  is the maaping cone of
  $"Tot" (P tensor Q) xarrow(epsilon tensor id_Q) A tensor Q$
  note that $- tensor Q_p$ is exact,
  since $Q_p$ is proj,
  and $Q_p$ is direct summand of free module. (or just flat).
  And every row of $C$ is exact.

  And by acyclic assembly lemma,
  $"Tot"^tensor (C) = "Cone"("something")$
  is exact.


  // TODO show the cone is exact
]

=== Hom cochain complex

Given a chain complex
$P$,
and a cochain complex $I$,
we can form a bi complex
$H(P_dot, I^dot) = {Hom(P_p, I^q)}$,
if $f: P_p -> I^q$,
$
  (d^n f)(a) = f(d a) \
  (d^q f)(a) = (-1)^(p+q + 1) d f (a), forall a in P_p
$

#definition[
  $
    "Tot"^pi (Hom (P_dot, I^dot))
  $
  is the hom cochain complex
]
#remark[
  If C, D be chain complexes.
  We reindex D to be a cohain complex (n term to -n term).
  then $H^n ("Tot"^pi (Hom (C, D)))$
  is the gorup chain homotopy eq class of vhain maps
  $C -> D[-n]$
]

check

$
  Hom_(Ab) ("Tot"^pi (Hom (P, Q)), I)
  = Hom_R (P, "Tot"^pi (Hom (Q, I)))
$

#theorem[
  $
    Ext_R^n (A, B) iso R^n Hom_R (A, -)(B) iso
    R^n Hom_R (-,B)(A)
  $
]
#proof[
  same as last theorem

  P -> A proj res

  B -> I inj res

  $Hom (A,I) -> "Tot"^pi Hom (P, I) <- Hom (P,B)$

  need to show both maps are quasi-iso

  that the cones are exact
  $"cone" (Hom(A, I) -> "Tot"^pi (P, I))$
  is the total comlex of the doule complex

  Hom (P, I) with Hom (A,I)[-1]
  added rows or columes of the resulting double complex
  are exact since Hom (P_p, -) is exact of Hom(-, I^q)
  is exact since P is proj, and I is inj,
  and the acyclic assembly lemma,
  gives the theorem.
]
#remark[
  The above proof shows that to calculate $Ext_R^n (A, B)$,
  we only need B -> I to be a reslution,
  but not inj res.
]

=== Yoneda product

Given R modules A, B, C,
and proj res

P -> A

Q -> B

T -> C

Ext^i_R (A,B) = H^i Tot^pi Hom (P,Q)
\= chain homotopy eq classes of chain maps P -> Q[i].


Ext^j_R (B,C) = H^j Tot^pi Hom (Q,T)
\= chain homotopy eq classes of chain maps Q -> T[j].

Note Hom_R (Q, T[j]) iso Hom_R(Q[i], T[i+j])

I can compose,
and we have

P -> Q[i] -> T[i+j]

and this composition preserve chain chomotopy

Ext^i_R (A, B) times Ext^j_R (B,C) -> Ext^(i+j)\_R (A,C)

called Yoneda Product

chech this is biadditive and associative

So $directSum.B Ext_R^i (A,A)$
is a graded ring
$Ext_R^* (A,A)$,
called Yoneda ring.

and $Ext_R^* (A,B)$
will be a graded module over $Ext_R^* (A,A)$.

=== Reamrks about flat module

#definition[
  A left R-mod B is flat if $- tensor_R B$ is exact.
  A right R-mod A is flat if $A tensor_R -$ is exact.
]

exercise:

The following R eq for a left R-mod B:
+ B is flat
+ $Tor^R_n (A,B) = 0$ for all n neq 0 and all A
+ $Tor^R_1 (A,B) = 0$ for all $A$.

#lemma[
  Proj modules are flat.
]
#proof[
  Free module is flat,
  and direct summand of free are flat.
]

recall that since tensor product
is left adjoint with Hom.
Then tensor product preserve colim.

I small cat.

Then $triangle C -> Fun(I, C)$,
and $colim "adjoint" triangle$,
and $triangle "adjoint" lim$

general fact: colim is not exact.

#proposition[
  Let $I$ be a filtered partially ordered set.
  For any $i,j in I$,
  there exists a $k$ s.t. $i le k$ and $j le k$.
  (Directed in the book by rotman).

  View $I$ as a cat.

  Then the functor $colim: Fun(I, R-mod) -> R-mod$
  is exact.
]

// TODO proof

#corollary[
  Filtered colim of flat modules
  is flat.
]
#proof[
  Let $A = colim_I A_i$
  I filtered, and $A_i$ is flat.
  if SES:
  $
    0 to B_1 to B_2 to B_3 to 0
  $

  Then
  $
    A tensor_R B_1 to A tensor B_2 to A tensor B_3
  $
  since $A tensor_R B_j iso colim(A_i tensor B_j)$
  notice that
  for each
  we have ses
  $
    0 to A_i tensor B_1 to A_i tensor B_2 to A_i tensor B_3 to 0
  $

  and by colim of filtered, we get exact.
]

#remark[
  A filtered colim of projective module may not be proj.
]

#example[
  Let $A$ be a torsion free abelian group,
  then $A = colim A_i = union.big A_i$,
  where $A_i$ are finitely generated subgroup of $A$.
  Each $A_i$ is free,
  so $A$ is a filtered colim of free (thus flat)
  submodules, so flat.
]
#example[
  Let $R$ be a ring.
  Let $s in R$ be a central element.
  Then the localization $R[s^(-1)] = colim(R xarrow(dot s) R xarrow(dot s) R xarrow(dot s) ...)$

  So $R[s^(-1)]$ is flat as a R module.

  Generalises to $R[S^(-1)]$
  with $S subset R$ a multiplicative central subset.

  If R is commutative,
  then $R -> R[s_1^(-1), ..., s_n^(-1)]$
  is called a Zariski top.
]

#lemma[
  flat resolution lemma

  Let $F -> A$ be a resolution of A, by flat module.
  then $Tor_n^R (A,B) = H_n (F tensor_R B)$.

  Similarly for flat resolution for $F' -> B$
  $Tor_n^R (A,B) = H_n (A tensor_R F')$
]
#proof[
  By induction.

  As $- tensor_R B$ is right exact.
  We get this is true for $n = 0$.

  let
  $
    0 to ker phi to F_0 xarrow(phi) to A to 0
  $
  be a ses.

  So $E = (... to F_2 to F_1 to 0)$
  is a flat res of $k$.
  For $n=1$.
  $
    Tor_1 (A,B) - ker (k tensor B -> F_0 tensor B)
    = ker((F_1) tensor B \/ Img(F_2 tensor B) to F_0 tensor B) = H_1 (F tensor B)
  $

  For $n ge 2$,
  $Tor_n^R (A,B) = Tor_(n-1)^R (k, B)
  = H_(n-1) (E tensor B) = H_n (F tensor B)$.
]
#remark[
  If $F$ is a right exact functor,
  provided that we can define left derived functor for $F$.
  Call $Q$ $F$-acyclic if $L_i F(Q) = 0, forall i$.

  The proof shows that if $Q -> A$
  is a res of $A$ by $F$-acyclic objects,
  then
  $
    L_i F(A) = H_i (F(Q))
  $
]

=== Universal coeficient theorem

How is the Homology of complex $P$
related to the homology of $P tensor M$?

#theorem[
  Let $P$ be a chain complex
  of flat right R-mod,
  s.t. each submod $d(P_n)$ of $P_(n-1)$
  is also flat.
  Then for every $n$
  and every left $R$-mod $M$,
  there is a ses.
  $
    0 to H_n (P) tensor_R M to H_n (P tensor_R M)
    to Tor_1^R (H_(n-1) (P), M) to 0
  $

  often called Künneth short exact sequence.
]
#proof[
  We have a ses
  $
    0 to Z_n to P_n to d(P_n) to 0
  $
  where $Z_n = ker d$.

  Since $P_n$ and $d(P_n)$ are flat,
  from the long exact sequence of Tor,
  we see that $Z_n$ is also flat.

  Also
  that
  $Tor_1 (d(P_n), M) = 0$
  gives
  $
    0 -> Z_n tensor M to P_n tensor M to d(P_n) tensor M to 0
  $
  is ses for any M.
  We get a ses of complexes
  $
    0 to Z tensor M to P tensor M to d(P) tensor M to 0
  $

  Note that the induced diff on $Z$ and $d(P)$
  is zero.
  The les
  $
    ... H_(n+1) (d P tensor M) xarrow(partial)
    H_n (Z tensor M) to H_n (P tensor M) \
    to H_n (d P tensor M)
    xarrow(partial) H_(n-1) (Z tensor M) ...
  $

  Note by definition:
  $
    H_(n+1) (d P tensor M) = d(P_(n+1) tensor M) \
    H_n (Z tensor M) = Z_n tensor M \
    H_n (d P tensor M) = d(P_n) tensor M \
    H_(n-1) (Z tensor M) = Z_(n-1) tensor M \
  $

  And we have
  $
    d(P_(n+1) tensor M) xarrow(i tensor id_M) Z_n tensor M \
    d(P_(n) tensor M) xarrow(i tensor id_M) Z_(n-1) tensor M
  $

  And we can cut the above les into short exact:
  $
    0 -> coker(partial) -> H_n (P tensor M) -> ker(partial) -> 0
  $

  Note that
  $
    0 -> d(P_(n+1)) -> Z_n -> H_n (P) -> 0
  $
  gives the flat resolution of $H_n P$, i.e.
  $d(P_(n+1)) -> Z_n$.
  We can calculate $Tor_* (H_n (P), M)$ as the homology:
  $
    0 -> d(P_(n+1)) tensor M xarrow(i tensor id_M) Z_n tensor M -> 0
  $

  So $ker i tensor id_M = Tor_1 (H_n (P), M)$,
  and $coker i tensor id_M = Tor_0 (H_n (P), M) = H_n (P) tensor M$.

  And we have ses
  $
    0 -> H_n (P) tensor M -> H_n (P, M) -> Tor_1 (H_(n-1) (P), M) -> 0
  $
]

#theorem[
  Let $P$ be a chain complex of free abelian group,
  then for every n and every M,
  the Künneth ses splits.
]
#proof[
  $d(P_n)$ is a subgroup of free abelian group $P_(n-1)$,
  so it is free.
  So the ses splits:
  $
    0 -> Z_n -> P_n -> d(P_n) -> 0
  $
]

Recall if P and Q are complexes
of right, left R module,
we can define tensor Product
$(P tensor_R Q)_n = directSum.B_(i+j = n) P_i tensor Q_i$.
To satisfies the lebnitz rule, we have differential
$
  d(a tensor b) = (d a) tensor b + (-1)^i a tensor (d b), a in P_i
$

Künneth formula.
If $P_n$ and $d(P_n)$ are flat for each n,
there is an exact ses:
$
  0 -> (P tensor Q)_n -> H_n (P tensor Q)
  -> directSum.B_(i+j = n -1) Tor_1 (H_i (P), H_j (Q))
$

If $R = ZZ$,
and P is a complex of free abelian groups,
then the ses splits.

Application:

$
  H_n (X times Y) iso (directSum.big_(i+j = n) (H_i (X) tensor H_j (Y)))
  directSum (
    directSum.B_(i+j = n-1) Tor_1^ZZ (H_i (X), H_j (Y))
  )
$

Some statement that $X times Y$,
tensor of chain complexes of $X$ and $Y$, is quasi-iso with the chain complexes
of $X times Y$.

=== Kosznl Complexes

Let $x in R$ be a central element,
define a complex:

$
  K(x): 0 -> R xarrow(dot x) R -> 0
$
in deg $0$ and $1$.

Is a complex of free R module.

We call the generator in deg 1 $d (e_x)$,
and we have $d( e_x ) = x$.

If $underline(x) = (x_1,...,x_n)$,
be a finite sequence of central elements.

Define
$
  K(underline(x)) = K(x_1) tensor K(x_2) tensor ... tensor K(x_n)
$

Define:
$
  H_q (underline(x), A) = H_q (K(underline(x)) tensor A) \
  H^q (underline(x), A) = H^q (Hom(K(underline(x)), A))
$

Ex:
$
  K(x,y): 0 -> R xarrow(dot (y -x)) R^2 xarrow((a,b) mapsto a x + b y) R -> 0
$

The dimension of the chain complexes:

$K_p (underline(x))$ is a free module
of rank $binom(n, p)$,
iso to $and.big_p R^n$,
with generator $e_(i_1) and e_(i_2) and ... and e_(i_p)$
with $i_1 < ... < i_p$

with differential:
$
  d (e_(i_1) and e_(i_2) and ... and e_(i_p))
  = sum (-1)^(k+1) e_(i_1) and e_(i_2) and ... and hat(e_(i_p)) and ...and e_(i_p)
$

Note that
$
  H_0 (underline(x), A) = A \/ (x_1,...,x_n) A \
  H^0 (underline(x), A) = Hom (A \/ (x_1,...,x_n) R, A)
$

Dueality:
$
  H_p (underline(x), A) = H^(n-p) (underline(x), A)
$

Künneth formula:

#lemma[
  Suppose $C$ is a chain complex of R-mod
  and $x in R$ central,
  then there are ses:
  $
    0 -> H_0 (x, H_q (C)) -> H_q (K(x) tensor C)
    -> H_1 (x, H_(q-1) (C)) -> 0
  $
]
#proof[
  One way is to use Künneth formula,
  since $K(x)$ is of free module, thus flat.

  We have a ses of complexes:
  $
    0 -> C -> K(x) tensor C -> C[-1] -> 0
  $
  associate les:
  $
    H_(q+1)(C[-1]) xarrow(partial)
    H_q (C) -> H_q (K(x) tensor C)
    -> H_q (C[-1]) xarrow(partial) H_(q-1) (C)
  $

  Note that $H_(q+1)(C[-1]) = H_q (C)$,
  and $H_(q+1)(C[-1]) xarrow(partial)
  H_q (C)$
  is just $H_(q)(C) xarrow(dot x)
  H_q (C)$


  So $coker partial = H_0 (x, H_q (C))$,
  and $ker partial = H_1 (x, H_(q-1) (C))$.
]

#definition[
  If A is an R-mod,
  then a regualar seq on A
  is a seq of elements
  $(x_1,...,x_n)$, $x_1 in R$,
  s.t. $x_1$ is a non-zero divisor on $A$,
  and $x_i$ is a non-zero divisor on $A \/ (x_1,...,x_(i-1)) A$
]

#corollary[
  if $underline(x) = (x_1,...,x_n)$ is a reg seq on R-mod A.
  Then $H_1 (underline(x), A) = 0$
  for $q neq 0$ and $H_0 (underline(x), A) = A \/ (x_1,...,x_(n)) A$
]
#proof[
  An easy induction using the last lemma.
]

#corollary[
  If $underline(x) = (x_1,...,x_n)$ is a req seq on R itself,
  then $K(underline(x))$ is a free resolution of $R \/ I$.
  And
  $
    Tor_p (T \/ I, A) = H_p (underline(x), A) \
    Ext^p (R \/ I, A) = H^p (underline(x), A)
  $
]

#remark[
  local cohomology for some ideal I,
  $H_I^p (M) = colim_n Ext_R^p (R \/ I^n , M)$.

  $
    H^0_I (M) = colim Hom_R (R \/ I, M)
    = {
      m in M | exists n, I^n m = 0
    }
  $

  even if I is not geneated by regualar seq.
  $H_I^p (M)$ can still be calculated using colim.
  $
    H_I^p (M) = colim_n (H_R^p (underline(x)^n), M)
  $
]

== Ext and extensions

And exrension of A by B
is just an ses
$
  0 -> B -> X -> A -> 0
$

Two extension are eq, if there is a commutative diagram:
#align(center, commutative-diagram(
  node((0, 0), [$0$]),
  node((0, 1), [$B$]),
  node((0, 2), [$X$]),
  node((0, 3), [$A$]),
  node((0, 4), [$0$]),
  node((1, 0), [$0$]),
  node((1, 1), [$B$]),
  node((1, 2), [$X'$]),
  node((1, 3), [$A$]),
  node((1, 4), [$0$]),
  arr((0, 1), (1, 1), [$=$]),
  arr((0, 2), (1, 2), [$iso$]),
  arr((0, 3), (1, 3), [$=$]),
  arr((0, 0), (0, 1), []),
  arr((0, 1), (0, 2), []),
  arr((0, 2), (0, 3), []),
  arr((0, 3), (0, 4), []),
  arr((1, 0), (1, 1), []),
  arr((1, 1), (1, 2), []),
  arr((1, 2), (1, 3), []),
  arr((1, 3), (1, 4), []),
))

#lemma[
  If $Ext^1 (A, B) = 0$, then every exrension of A by B splits.
]
#proof[
  From the les associated to $Ext^* (A, -)$.
  we get a exact seq:

  $
    Hom(A, X) xarrow(alpha) Hom(A, A) xarrow(partial) Ext^1 (A,B)
  $

  if $Ext^1 (A,B)$, then alpha is epic,
  then there is a element in $Hom(A, X)$, that is mapped to $id in Hom (A,A)$,
  which results in split.

  We see that the $partial(id) in Ext^1 (A,B)$
  is the obstruction to being split.
]

#theorem[
  Given R-mod A and B,
  then the map:
  $
    Theta: {"eq classes of extension of A by B"} to Ext^1 (A,B) \
    {0 -> A -> X -> B -> 0} mapsto partial(id_A)
  $
  where
  $
    Hom(A, X) xarrow(alpha) Hom(A, A) xarrow(partial) Ext^1 (A,B)
  $
  is the les, associated with $0 -> A -> X -> B -> 0$.

  Then $Theta$ is a bijection.
]
#proof[
  Fix an exact seq
  $
    0 -> M xarrow(j) P -> A -> 0
  $
  where $P$ proj.

  Applying $Hom(-, B)$
  gives
  $
    Hom(P, B) -> Hom(M, B) xarrow(partial) Ext^1 (A,B) -> Ext(P, B) = 0
  $

  give $x in Ext^1 (A,B)$
  pick $beta in Hom(M, B)$
  s.t. $partial(beta) = x$.
  Let $X$ be the pushout of $j$ and $beta$:
  #align(center, commutative-diagram(
    node((0, 0), [$M$]),
    node((0, 1), [$P$]),
    node((1, 0), [$B$]),
    node((1, 1), [$X$]),
    arr((0, 0), (0, 1), []),
    arr((0, 0), (1, 0), []),
    arr((1, 0), (1, 1), []),
    arr((0, 1), (1, 1), []),
  ))
  $
    X = coker(M -> P directSum B)
  $

  We have the diagram:
  #align(center, commutative-diagram(
    node((0, 0), [$0$]),
    node((0, 1), [$M$]),
    node((0, 2), [$P$]),
    node((0, 3), [$A$]),
    node((0, 4), [$0$]),
    node((1, 0), [$0$]),
    node((1, 1), [$B$]),
    node((1, 2), [$X$]),
    node((1, 3), [$A$]),
    node((1, 4), [$0$]),
    arr((0, 0), (0, 1), []),
    arr((0, 1), (0, 2), []),
    arr((0, 2), (0, 3), []),
    arr((0, 3), (0, 4), []),
    arr((1, 0), (1, 1), []),
    arr((1, 1), (1, 2), [$i$]),
    arr((1, 2), (1, 3), []),
    arr((1, 3), (1, 4), []),
    arr((0, 3), (1, 3), [$=$]),
    arr((0, 2), (1, 2), [$partial$]),
    arr((0, 1), (1, 1), [$beta$]),
  ))

  $X -> A$ is induced by $B xarrow(0) A$

  and $P -> A$.

  By the naturally of the connecting homo.
  we see that $Theta(0 -> B -> X -> A -> 0) = x$.

  So $Theta$ is surj.
  We construct $phi: Ext^1 (A,B) to {"eq class of extensiions"}$
  since if $beta' in Hom(M, B)$
  is another lift,
  there exists $f in Hom(P, B)$
  s.t. $beta' = beta + f j$
  using this we can see that $x' ("the pushout of" j "and" beta)$
  the maps $i: beta to x$ and $partial + i f$ induce $x' = x$.

  If we have a extension,
  $0 -> B -> X -> A -> 0$,
  the lifting property of P gives an map
  #align(center, commutative-diagram(
    node((0, 0), [$0$]),
    node((0, 1), [$M$]),
    node((0, 2), [$P$]),
    node((0, 3), [$A$]),
    node((0, 4), [$0$]),
    node((1, 0), [$0$]),
    node((1, 1), [$B$]),
    node((1, 2), [$X$]),
    node((1, 3), [$A$]),
    node((1, 4), [$0$]),
    arr((0, 0), (0, 1), []),
    arr((0, 1), (0, 2), []),
    arr((0, 2), (0, 3), []),
    arr((0, 3), (0, 4), []),
    arr((1, 0), (1, 1), []),
    arr((1, 1), (1, 2), [$i$]),
    arr((1, 2), (1, 3), []),
    arr((1, 3), (1, 4), []),
    arr((0, 3), (1, 3), [$=$]),
    arr((0, 2), (1, 2), [$tau$]),
    arr((0, 1), (1, 1), [$gamma$]),
  ))

  So $X$ is the pushout of $j$ and $gamma$.
  And we get a bijection
]
#remark[
  $Ext^1 (A,B)$ is an abelian group,
  so there is an addtive structure on eq claases of extensions,
  called the Baer sum.
  We can take pull back to get $X''$
    #align(center, commutative-diagram(
    node((0, 0), [$X''$]),
    node((0, 1), [$X'$]),
    node((1, 0), [$X$]),
    node((1, 1), [$A$]),
    arr((0, 0), (0, 1), []),
    arr((0, 0), (1, 0), []),
    arr((1, 0), (1, 1), []),
    arr((0, 1), (1, 1), []),
  ))

  And since there is two copy of B in $X''$,
  we take identify $Y = X'' \/ {(b,-b)}$,
  and prove $0 -> B -> Y -> A -> 0$

  And $Theta(Y) = Theta(X) + Theta(X')$

]
#remark[
  If we have two extensions:
  $
    0 -> B -> X -> A -> 0 \
    0 -> C -> Y -> B -> 0
  $
  we can put them together
  $
    0 -> C -> Y -> X -> A -> 0
  $

  this is kind of length $2$ extension,
  and we also have length $n$ extension,
  it can be proved that the eq class of length $n$ extension,
  have a bijection with $Ext^n (A,B)$.

  Since we have a multiplicative structure on $Ext^* (A,B)$,
  called Yoneda product,
  and we have similal structure on length $*$ extensions.
  The could be defined on categories that do not have enough proj.
  While the definiiton using $Ext^*$ require enough projective.
  And this is how yoneda originally defined thie yoneda product.
]

