#import "@preview/in-dexter:0.7.2": index, make-index
#import "@preview/commute:0.3.0": *
#import "@preview/great-theorems:0.1.2": *
#import "@preview/rich-counters:0.2.2": *

#bibliography("refs.bib")

#let highlightIndex(param) = [
  #highlight(param) #index(param)
]

#let mathcounter = rich-counter(
  identifier: "mathblocks",
  inherited_levels: 2
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

#let Hom = $op("Hom")$
#let iso = $tilde.equiv$
#let End = $op("End")$
#let neq = $eq.not$
#let circ = $circle.small$
#let supp = $op("supp")$
#let to = $->$
#let realProjectiveSpace(n) = $RR PP^(#n)$
#let catFiniteDimVectorSpace(k) = $op("Vect")^(op("fd"))_k$
#let radicalIdeal = $frak(r)$
#let Spec = $op("Spec")$
#let Spm = $op("Spm")$
#let Img = $op("Im")$
#let GL = $op("GL")$
#let directSum = $plus.circle$
#let directSumB = $plus.circle.big$
#let subseteq = $subset.eq$
#let ann = $op("ann")$
#let le = $<=$
#let ge = $>=$

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