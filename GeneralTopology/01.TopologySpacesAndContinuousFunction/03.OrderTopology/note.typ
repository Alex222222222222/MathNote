#import "../../../utils.typ": *

=== The Order Topology

#definition(title: [interval])[
  Let $XX$ be a set having a simple order relation $<$.
  Given elements $a$ and $b$ of $XX$ such that $a < b$, there are four subsets of $XX$ called #highlightIndex[intervals] determined by $a$ and $b$:

  + $(a,b) = {x | a < x < b}$
  + $(a,b] = {x | a < x <= b}$
  + $[a,b) = {x | a <= x < b}$
  + $[a,b] = {x | a <= x <= b}$

  $(a,b)$ is called an #highlightIndex[open interval] on $XX$.
  $[a,b]$ is called a #highlightIndex[closed interval] on $XX$.
  $(a,b]$ and $[a,b)$ are called #highlightIndex[half-open intervals].
]<def:Interval>

#definition(title: [order topology])[
  #footnote[The standard topology on $RR$ is an order topology derived from the usual order on $RR$.]
  Let $XX$ be a set with a simple order relation, and assume $XX$ has more than one element.
  Let $BB$ be the collection of all sets of the following types:

  + All open intervals $(a,b)$ in $XX$.
  + All intervals of the form $[a_0,b)$, where $a_0$ is the smallest element (if it exists) of $XX$.
  + All intervals of the form $(a,b_0]$, where $b_0$ is the largest element (if it exists) of $XX$.

  The collection $BB$ forms a basis for a topology on $XX$, which is called the #highlightIndex[order topology].
]<def:OrderTopology>

#definition(title: [ray])[
  #footnote[
    Open rays are always open sets in the order topology.
    The open rays also form a subbasis of the order topology.
  ]
  If $XX$ is an ordered set and $a$ is an element of $XX$, there are four subsets of $XX$ called #highlightIndex[rays] determined by $a$:

  + $(a, +infinity) = {x | x > a}$
  + $(-infinity, a) = {x | x < a}$
  + $[a, +infinity) = {x | x >= a}$
  + $(-infinity, a] = {x | x <= a}$

  $(a, +infinity)$ and $(-infinity, a)$ are called #highlightIndex[open rays].
  $[a, +infinity)$ and $(-infinity, a]$ are called #highlightIndex[closed rays].
]<def:Ray>
