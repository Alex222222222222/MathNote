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