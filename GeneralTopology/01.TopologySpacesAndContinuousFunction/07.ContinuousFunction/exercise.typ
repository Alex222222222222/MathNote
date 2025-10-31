#import "../../../utils.typ": *

==== Exercise

#enum(
  enum.item[
    Let $YY$ be an ordered set with the order topology.  
    Let $f,g: XX -> YY$ be continuous. Show that the set
    $
    A = { x | f(x) <= g(x) }
    $
    is closed in $XX$.

    #proof[
      It suffices to show $XX without A$ is open. Let $x in XX without A$. Then $f(x) > g(x)$.

      Because $YY$ is an ordered space there exist disjoint open intervals $U_1$ and $U_2$ in $YY$ with
      $
      f(x) in U_1, quad g(x) in U_2,
      $
      and such that for all $y_1 in U_1$ and $y_2 in U_2$ we have $y_1 > y_2$.

      Put $U = f^(-1)(U_1) inter g^(-1)(U_2)$. Then $U$ is open in $XX$ and $x in U$. Moreover, if $y in U$ then $f(y) in U_1$ and $g(y) in U_2$, so $f(y) > g(y)$; hence $U subset.eq XX without A$. Thus every $x in XX without A$ has an open neighbourhood contained in $XX without A$, so $XX without A$ is open and $A$ is closed.
    ]
  ],

  enum.item[
    Let ${A_(alpha)}$ be a collection of subsets of $XX$ with $XX = union.big_(alpha) A_(alpha)$.  
    Let $f: XX -> YY$ and suppose each restriction $f|A_(alpha)$ is continuous.  
    An indexed family ${A_(alpha)}$ is #highlightIndex[locally finite] if each $x in XX$ has a neighbourhood meeting only finitely many $A_(alpha)$.  
    Show: if ${A_(alpha)}$ is locally finite and each $A_(alpha)$ is closed, then $f$ is continuous.

    #proof[
      Let $B subset.eq YY$ be closed. We will show $f^(-1)(B)$ is closed, so $f$ is continuous.

      For each $alpha$ the set $(f|A_(alpha))^(-1)(B) = A_(alpha) inter f^(-1)(B)$ is closed in $A_(alpha)$ and hence closed in $XX$ because $A_(alpha)$ is closed. Let
      $
      V = union.big_(alpha) ( A_(alpha) inter f^(-1)(B) ).
      $
      Clearly $V = f^(-1)(B)$. We prove $V$ is closed by showing $overline(V) = V$.

      Fix $x in overline(V)$. For each neighbourhood $N$ of $x$ let
      $
      C_N = { alpha | (A_(alpha) inter f^(-1)(B)) inter N != emptyset }.
      $
      By definition each $C_N$ is nonempty. The family ${A_(alpha)}$ is locally finite, so there exists some neighbourhood $N_0$ for which $C_(N_0)$ is finite. Consider the collection
      $
      C = { C_N | N "a neighbourhood of" x }.
      $
      The sets in $C$ have the finite-intersection property in the sense that for neighbourhoods $N_1,N_2$ we have $C_(N_1 inter N_2) subset.eq C_(N_1) inter C_(N_2)$. Using the local finiteness one finds a minimal finite $C_F$ in $C$ (one may apply a finite-choosing/chain argument as in the book). Concretely, choose a neighbourhood $N$ so small that only the finitely many indices in $C_F$ occur.

      Let $G = union_{alpha in C_F} ( A_(alpha) inter f^(-1)(B) )$. Each $A_(alpha) inter f^(-1)(B)$ is closed, so $G$ is closed (finite union). Since every neighbourhood of $x$ meets $V$, it meets one of the finitely many closed sets appearing in $G$; hence $x in G$. Therefore $x in V$.

      Thus $overline(V) subset.eq V$, so $V$ is closed. As $V = f^(-1)(B)$ and $B$ was arbitrary closed, $f$ is continuous.
    ]
  ],

  enum.item[
    Let $A subset.eq XX$ and let $YY$ be Hausdorff. Suppose $f: A -> YY$ is continuous and $g: overline(A) -> YY$ is continuous with $g(x)=f(x)$ for all $x in A$. Prove $g$ is uniquely determined by $f$.  
    #footnote[It may happen that such an extension $g$ does not exist; the exercise only addresses uniqueness.]

    #proof[
      Suppose $g$ and $h$ are two continuous extensions $g,h: overline(A) -> YY$ with $g|A = h|A = f$. If $g != h$ then there exists $x_0 in overline(A)$ with $g(x_0) != h(x_0)$. Since $YY$ is Hausdorff, choose disjoint neighbourhoods $U$ and $V$ in $YY$ with $g(x_0) in U$ and $h(x_0) in V$.

      Then $g^(-1)(U)$ and $h^(-1)(V)$ are open neighbourhoods of $x_0$ in $overline(A)$. Their intersection $W = g^(-1)(U) inter h^(-1)(V)$ is an open neighbourhood of $x_0$ in $overline(A)$. Because $x_0 in overline(A)$, $W$ meets $A$; pick $x_1 in W inter A$. Then $g(x_1) in U$ and $h(x_1) in V$, but $g(x_1)=f(x_1)=h(x_1)$ since both extend $f$ on $A$, contradiction because $U$ and $V$ are disjoint. Therefore no such $x_0$ exists and $g=h$. Hence the extension is unique when it exists.
    ]
  ]
)
