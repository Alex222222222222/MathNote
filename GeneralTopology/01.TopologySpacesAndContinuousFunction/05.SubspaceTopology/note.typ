#import "../../../utils.typ": *

=== The Subspace Topology

#definition(title: [subspace topology])[
  Let $XX$ be a topological space with topology $TT$.  
  If $Y subset.eq XX$, the collection  
  $
  TT_Y = { Y inter U | U in TT }
  $
  is a topology on $Y$, called the #highlightIndex[subspace topology].  
  The set $Y$ is also called a #highlightIndex[subspace] of $XX$.
]<def:SubspaceTopology>

#lemma[
  #footnote[We omit the proof of this lemma as it is obvious.]
  If $BB$ is a basis for the topology of $XX$ and $Y subset.eq XX$, then the collection  
  $
  BB_Y = { B inter Y | B in BB }
  $
  is a basis for the subspace topology on $Y$.
]

#lemma[
  #footnote[We omit the proof of this lemma as it is obvious.]
  Let $Y$ be a subspace of $XX$.  
  If $U$ is "open in" $Y$ and $Y$ is "open in" $XX$, then $U$ is "open in" $XX$.
]

#theorem[
  #footnote[If $XX$ is an ordered set in the order topology and $Y subset.eq XX$, then the order relation restricted to $Y$ makes $Y$ an ordered set. However, the resulting order topology on $Y$ need not equal the topology $Y$ inherits as a subspace of $XX$.]
  If $A$ is a subspace of $XX$ and $B$ is a subspace of $YY$, then the product topology on $product(A,B)$ equals the topology that $product(A,B)$ inherits as a subspace of $product(XX,YY)$.
]

#proof[
  Let $BB_X$, $BB_Y$, and $BB_(X Y)$ be bases for the topologies of $XX$, $YY$, and $product(XX,YY)$, respectively.  
  Let $BB'_X$, $BB'_Y$, and $BB'_(X Y)$ be bases for the topologies of $A$, $B$, and $product(A,B)$, respectively.  
  We show that $BB'_X times BB'_Y = BB'_(X Y)$; hence, the product topology on $product(A,B)$ equals the topology it inherits as a subspace of $product(XX,YY)$.

  First, each element of $BB'_X times BB'_Y$ can be written as  
  $
  (B_A inter A) times (B_B inter B) = (B_A times B_B) inter (A times B)
  $
  with $B_A in BB_X$, $B_B in BB_Y$, hence $(B_A times B_B) inter (A times B) in BB'_(X Y)$.  
  Thus $BB'_X times BB'_Y subset.eq BB'_(X Y)$.

  Next, $BB'_X times BB'_Y$ generates the topology $product(A,B)$ inherits as a subspace of $product(XX,YY)$.  
  For any "open set" $U$ in $product(XX,YY)$ and any $x in U inter (A times B)$, there exist $B_X times B_Y in BB_(X Y)$ such that  
  $
  x in B_X times B_Y subset.eq XX times YY.
  $
  Then  
  $
  x in (B_X times B_Y) inter (A times B) subset.eq A times B,
  $
  and $(B_X times B_Y) inter (A times B) in BB'_X times BB'_Y$.  
  Hence $BB'_X times BB'_Y$ generates the subspace topology on $product(A,B)$.
]
