#import "@preview/in-dexter:0.7.2": *
#import "@preview/commute:0.3.0": *
#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.2": *
#import "@preview/xarrow:0.3.1": xarrow

#bibliography("refs.bib")

#let highlightIndex(param) = [
  #highlight(param) #index(param)
]

#let mathcounter = rich-counter(
  identifier: "mathblocks",
  inherited_levels: 2,
)

#let theorem = mathblock(
  blocktitle: "Theorem",
  counter: mathcounter,
)

#let lemma = mathblock(
  blocktitle: "Lemma",
  counter: mathcounter,
)

#let proposition = mathblock(
  blocktitle: "Proposition",
  counter: mathcounter,
)

#let definition = mathblock(
  blocktitle: "Definition",
  counter: mathcounter,
)

#let example = mathblock(
  blocktitle: "Example",
  counter: mathcounter,
)

#let remark = mathblock(
  blocktitle: "Remark",
  counter: mathcounter,
)

#let corollary = mathblock(
  blocktitle: "Corollary",
  counter: mathcounter,
)

#let proof = proofblock()

#let opposite = $op("op")$
#let Ab = $op("Ab")$
#let Fun = $op("Fun")$
#let Tot = $op("Tot")$
#let Ext = $op("Ext")$
#let Tor = $op("Tor")$
#let Hom = $op("Hom")$
#let notin = $in.not$
#let Bd = $op("Bd")$
#let Cl = $op("Cl")$
#let Int = $op("Int")$
#let colim = $op("colim")$
#let Mod = $op("Mod")$
#let iso = $tilde.equiv$
#let niso = $tilde.equiv.not$
#let End = $op("End")$
#let neq = $eq.not$
#let circ = $circle.small$
#let supp = $op("supp")$
#let to = $->$
#let realProjectiveSpace(n) = $RR PP^(#n)$
#let Vect = $op("Vect")$
#let catFiniteDimVectorSpace(k) = $Vect^(op("fd"))_k$
#let radicalIdeal = $frak(r)$
#let Spec = $op("Spec")$
#let Spm = $op("Spm")$
#let infty = symbol(sym.infinity)
#let Img = $op("Im")$
#let GL = $op("GL")$
#let directSum = symbol(
  sym.plus.o,
  ("b", sym.plus.o.big),
  ("big", sym.plus.o.big),
  ("B", sym.plus.o.big),
)
#let subseteq = $subset.eq$
#let ann = $op("ann")$
#let diam = $op("diam")$
#let le = $<=$
#let ge = $>=$
#let char = $op("char")$
#let codim = $op("codim")$
#let nilRadical = $frak(r)$
#let ManifoldsCat = $op("Mfd")$
#let ht = $op("ht")$
#let sign = $op("sign")$
#let tensor = symbol(
  sym.times.o,
  ("b", sym.times.o.big),
  ("big", sym.times.o.big),
  ("B", sym.times.o.big),
)
#let adjoint = symbol(
  sym.tack.l,
)
#let classFunctionSpace(G) = $cal(C)(#G)$
#let inducedKGModule(H, G, W) = $op("Ind")^(#G)_(#H) #W$
#let restrictionKGModule(H, G, V) = $op("Res")^(#G)_(#H) #V$
#let inflatedRepresentation(rho) = $dot(#rho)$
#let innerProduct(x, y) = $chevron.l #x, #y chevron.r$
#let tangentSpace(x, X) = $T_(#x) #X$
#let dualSpace(X, bracket: false) = [#if bracket [
  $(#X)^*$
] else [
  $#X^*$
]]
#let cotangentSpace(x, X) = $T^*_(#x) #X$
#let extensionByZero(phi) = $#phi^circ$
#let algebraicInteger = $AA$
#let setminus = $\\$
#let coker = $op("coker")$
#let cup = symbol(
  sym.union,
)
#let int = $op("int")$
#let lie = $op("lie")$
#let Ad = $op("Ad")$
#let ad = $op("ad")$
#let SL = $op("SL")$
#let Aut = $op("Aut")$
#let rank = $op("rank")$

// a set of dictionary for completion
abelian
abstract simplicial complex
algebraic
module
sheaf
topology
topological space
additive category
additive functor
adjoint
isomorphic
iso
monomorphism
morphism
monic
epic
epimorphism
algebra
set
isomorphic
surjective
surjection
injective
injection
generator
easily
obviously
apparently
thus
therefore
homomorphism
Clearly
clearly
natural
projection
isomorphism
well-defined
verify
polynomial
desired
irreducible
quadratic
muiltiply
radical
ideal
open
closed
coordinate
varieties
variety
function
neighbourhood
representation
