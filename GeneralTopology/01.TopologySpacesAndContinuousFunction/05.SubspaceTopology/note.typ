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
  If $A$ is a subspace of $XX$ and $B$ is a subspace of $YY$, then the product topology on $A times B$ equals the topology that $A times B$ inherits as a subspace of $XX times YY$.
]

#proof[
  Let $BB_X$, $BB_Y$, and $BB_(X Y)$ be bases for the topologies of $XX$, $YY$, and $XX times YY$, respectively.
  Let $BB'_X$, $BB'_Y$, and $BB'_(X Y)$ be bases for the topologies of $A$, $B$, and $A times B$, respectively.
  We show that $BB'_X times BB'_Y = BB'_(X Y)$; hence, the product topology on $A times B$ equals the topology it inherits as a subspace of $XX times YY$.

  First, each element of $BB'_X times BB'_Y$ can be written as
  $
    (B_A inter A) times (B_B inter B) = (B_A times B_B) inter (A times B)
  $
  with $B_A in BB_X$, $B_B in BB_Y$, hence $(B_A times B_B) inter (A times B) in BB'_(X Y)$.
  Thus $BB'_X times BB'_Y subset.eq BB'_(X Y)$.

  Next, $BB'_X times BB'_Y$ generates the topology $A times B$ inherits as a subspace of $XX times YY$.
  For any "open set" $U$ in $XX times YY$ and any $x in U inter (A times B)$, there exist $B_X times B_Y in BB_(X Y)$ such that
  $
    x in B_X times B_Y subset.eq XX times YY.
  $
  Then
  $
    x in (B_X times B_Y) inter (A times B) subset.eq A times B,
  $
  and $(B_X times B_Y) inter (A times B) in BB'_X times BB'_Y$.
  Hence $BB'_X times BB'_Y$ generates the subspace topology on $A times B$.
]

#definition(title: [ordered square])[
  Let $I = [0,1]$.
  The set $I times I$, endowed with the dictionary order #footnote[“Dictionary order” means that for $X_1, X_2 in YY = XX_1 times XX_2 times XX_3 ...$ with
    $ X_1 = (x_1, x_2, x_3, ...), quad X_2 = (x_1', x_2', x_3', ...), $
    we define $X_1 > X_2$ when
    $ exists k in ZZ_+, forall i in ZZ_+, 0 < i < k, x_i = x_i', text(and) x_k > x_k'. $]
  is called the #highlightIndex[ordered square] and denoted $I_o^(2)$.
]<def:OrderedSquare>

#definition(title: [convex])[
  Given an ordered set $XX$, a subset $Y subset.eq XX$ is #highlightIndex[convex] in $XX$ if for each pair of points $a < b$ in $Y$, the entire interval $(a,b)$ in $XX$ lies in $Y$.
]<def:Convex>

#theorem[
  #footnote[If $XX$ is an ordered set in the order topology and $Y subset.eq XX$, we assume $Y$ is given the subspace topology unless stated otherwise.]
  Let $XX$ be an ordered set with the order topology, and let $Y subset.eq XX$ be convex in $XX$.
  Then the order topology on $Y$ equals the topology that $Y$ inherits as a subspace of $XX$.
]

#proof[
  Consider the ray $(a, +infinity)$ in $XX$.
  If $a in Y$, then
  $
    (a, +infinity) inter Y = { x | x in Y, x > a },
  $
  which is an "open ray" in $Y$.

  If $a in.not Y$, then $a$ is either a lower or an upper bound of $Y$ since $Y$ is convex.
  In the first case, $(a, +infinity) inter Y = Y$; in the second, it is empty.

  Similarly, $( -infinity, a ) inter Y$ is either an "open ray" in $Y$, or $Y$ itself, or empty.
  Since the sets $(a, +infinity) inter Y$ and $( -infinity, a ) inter Y$ form a subbasis for the subspace topology on $Y$,
  and since each is open in the order topology, the order topology contains the subspace topology.

  Conversely, any open ray of $Y$ equals the intersection of an open ray of $XX$ with $Y$, so it is open in the subspace topology.
  Since the open rays of $Y$ form a subbasis for the order topology on $Y$, that topology is contained in the subspace topology.
  Hence the two topologies are equal.
]
