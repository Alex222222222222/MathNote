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