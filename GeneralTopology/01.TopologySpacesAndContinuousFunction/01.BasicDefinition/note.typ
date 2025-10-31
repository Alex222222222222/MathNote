#import "../../../utils.typ": *

=== Basic Definition of Topology

#definition(title: [topology])[
  A #highlightIndex[topology] on a set $XX$ is a collection $TT$ of subsets of $XX$ having the following properties:

  + $emptyset$ and $XX$ are in $TT$
  + The union of the elements of any sub collection of $TT$ is in $TT$
  + The intersection of the elements of any finite sub collection of $TT$ is in $TT$
]<def:Topology>

#definition(title: [topology space])[
  A #highlightIndex[topological space] is a set $XX$ for which a topology $TT$ has been specified.
]<def:TopologySpace>

#definition(title: [open set])[
  An #highlightIndex[open set] $UU$ is a subset of $XX$ that belongs to a topology $TT$ of $XX$.
]<def:OpenSet>

#definition(title: [open sets])[
  A topology can also be called #highlightIndex[open sets].
]<def:OpenSets>

#definition(title: [discrete topology])[
  The set of all subsets of a set $XX$ forms a topology called the #highlightIndex[discrete topology].
]<def:DiscreteTopology>

#definition(title: [trivial topology])[
  The set consisting of $XX$ and $emptyset$ only forms a topology on $XX$ called the #highlightIndex[trivial topology].
]<def:TrivialTopology>

#definition(title: [finite complement topology])[
  Let $XX$ be a set. Let $TT_f$ be the collection of all subsets $UU$ of $XX$ such that $XX - UU$ is either finite or all of $XX$.  
  Then $TT_f$ is a topology on $XX$, called the #highlightIndex[finite complement topology].

  _Note_: This collection forms a topology because the complement of a finite union is a finite intersection. If the definition required closure under infinite intersections, $TT_f$ would fail to be a topology.
]<def:FiniteComplementTopology>

#definition(title: [finer / coarser (comparable)])[
  Let $TT$ and $TT'$ be two topologies on a given set $XX$.  
  If $TT subseteq TT'$, we say that $TT'$ is #highlightIndex[finer] or #highlightIndex[larger] than $TT$.  
  If $TT$ is a proper subset of $TT'$, we say that $TT'$ is #highlightIndex[strictly finer] or #highlightIndex[strictly larger] than $TT$.  
  Conversely, we say that $TT$ is #highlightIndex[coarser] or #highlightIndex[smaller] (or #highlightIndex[strictly coarser], #highlightIndex[strictly smaller]) than $TT'$.  
  We say that $TT$ and $TT'$ are #highlightIndex[comparable] if either $TT subseteq TT'$ or $TT' subseteq TT$.
]<def:Comparable>
