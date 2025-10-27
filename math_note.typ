#import "@preview/ilm:1.4.1": *
#import "@preview/great-theorems:0.1.2": *
#import "@preview/in-dexter:0.7.2": index, make-index

#set text(lang: "en")

#show: ilm.with(
  title: [Math Note],
  author: ("Zifan Hua"),
  date: datetime.today(),
  abstract: [This is my personal math note, which is a collection of my understanding of math. It is not meant to be a complete reference, but rather a personal study guide.],
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
)

#set heading(numbering: "1.1.")

#show: great-theorems-init

#show link: text.with(fill: blue)

#include "RepresentationTheory/representation_theory.typ"

#include "ModuleTheory/module_theory.typ"

#include "Manifold/manifold.typ"

= Index
#columns(3)[
  #make-index(title: none)
]
