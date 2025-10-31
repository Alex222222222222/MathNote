#import "../../../utils.typ": *

==== Exercise

#enum(
  enum.item[
    Give a counterexample why
    $
    overline( union.big_(alpha) A_(alpha) ) = union.big_(alpha) overline( A_(alpha) )
    $
    need not hold.

    #proof[
      Consider $XX$ with the K-topology on the real line.

      Let
      $
      A_n = ( 1/(n+1), 1/n ), "for" n in ZZ_+,
      $
      and set $A = union.big_(n) A_n$.

      Then
      $
      overline( A_n ) = [ 1/(n+1), 1/n ],
      $
      so
      $
      union.big_(n) overline( A_n ) = (0,1].
      $

      However, every neighbourhood of $0$ meets $union.big_(n) A_n$, so
      $
      0 in overline( union.big_(n) A_n ).
      $

      Therefore
      $
      overline( union.big_(n) A_n ) != union.big_(n) overline( A_n ).
      $
    ]
  ],

  enum.item[
    Prove that
    $
    overline( A - B ) supset.eq overline(A) - overline(B).
    $

    #proof[
      Suppose $x in overline(A) - overline(B)$. Then $x in overline(A)$ and $x in.not overline(B)$.

      Because $x in.not overline(B)$ there exists an "open set" $U_1$ containing $x$ with $U_1 inter B = emptyset$.  
      Since $x in overline(A)$ every "open set" containing $x$ meets $A$, so in particular $U_1 inter A != emptyset$.

      Assume, towards a contradiction, that $x in.not overline(A - B)$. Then there exists an "open set" $U_0$ with $x in U_0$ and $U_0 inter (A - B) = emptyset$.

      But $U_0 inter A subset.eq B$ (since no point of $A-B$ lies in $U_0$). Hence
      $
      U_1 inter U_0 inter A = emptyset,
      $
      because $U_1 inter B = emptyset$. The intersection $U_1 inter U_0$ is an "open set" containing $x$, contradicting $x in overline(A)$. Thus $x in overline(A - B)$.
    ]
  ],

  enum.item[
    A #highlightIndex[diagonal] is the subset
    $
    Delta = { x times x | x in XX }
    $
    of $XX times XX$. Show that $Delta$ is closed in $XX times XX$ iff $XX$ is Hausdorff.

    #proof[
      If $XX$ is Hausdorff, then for any $(x,y) notin Delta$ with $x != y$ choose disjoint neighbourhoods $U_x$, $U_y$ of $x$ and $y$. Then
      $
      U_x times U_y
      $
      is an open neighbourhood of $(x,y)$ disjoint from $Delta$. Hence
      $
      XX times XX - Delta = union_{x != y} (U_x times U_y)
      $
      is open, so $Delta$ is closed.

      Conversely, if $Delta$ is closed but $XX$ is not Hausdorff, pick $x != y$ such that every neighbourhood of $x$ meets every neighbourhood of $y$. Then every basic neighbourhood of $(x,y)$ in $XX times XX$ meets $Delta$, so $(x,y)$ is in the closure of $Delta$, contradicting closedness of $Delta$. Hence $XX$ must be Hausdorff.
    ]
  ],

  enum.item[
    Prove that the $T_1$ axiom is equivalent to: for every distinct pair $x,y$ in $XX$ there exists a neighbourhood of $x$ that does not contain $y$.

    #proof[
      If $XX$ satisfies $T_1$ (every finite point set is closed), then for distinct $x,y$ the set $XX without {y}$ is an "open neighbourhood" of $x$ not containing $y$.

      Conversely, suppose the stated separation property holds. If a singleton $\{x\}$ were not closed then there exists $y in overline({x}) - {x}$, which means every neighbourhood of $y$ contains $x$, contradicting the separation property. Thus all singletons are closed, hence every finite set is closed, so $T_1$ holds.
    ]
  ],

  enum.item[
    Let $A subset.eq XX$. The #highlightIndex[boundary] of $A$ is
    $
    Bd A = overline(A) inter overline( XX without A ).
    $

    #enum(
      enum.item[
        Show that $Int(A)$ and $Bd(A)$ are disjoint and
        $
        overline(A) = Int(A) union Bd(A).
        $

        #proof[
          If $x in Bd(A)$ then every "open set" containing $x$ meets both $A$ and $XX without A$, so no "open set" containing $x$ is contained in $A$; hence $x notin Int(A)$. Thus $Int(A)$ and $Bd(A)$ are disjoint.

          For $x in overline(A)$ either $x in Bd(A)$ or $x notin Bd(A)$. If $x notin Bd(A)$ then $x in.not overline(XX without A)$, so there is an "open set" $U$ with $x in U$ and $U inter (XX without A) = emptyset$, i.e. $U subset.eq A$; hence $x in Int(A)$. Thus $overline(A) subset.eq Int(A) union Bd(A)$, and the reverse inclusion is clear, giving equality.
        ]
      ],

      enum.item[
        Show $Bd(A) = emptyset$ iff $A$ is both open and closed.

        #proof[
          If $Bd(A) = emptyset$ then $overline(A) = Int(A)$, so $A = Int(A)$ is open and $overline(A) = A$ is closed. Conversely, if $A$ is both open and closed then $overline(XX without A) = XX without A$, so $Bd(A) = overline(A) inter overline(XX without A) = A inter (XX without A) = emptyset$.
        ]
      ],

      enum.item[
        Show $U$ is open iff $Bd(U) = overline(U) - U$.

        #proof[
          If $U$ is open then $overline(XX without U) = XX without U$, so
          $
          Bd(U) = overline(U) inter overline(XX without U) = overline(U) inter (XX without U) = overline(U) - U.
          $

          Conversely, if $Bd(U) = overline(U) - U$, then for $x in U$ we have $x notin Bd(U)$, so $x in Int(U)$; hence $U subset.eq Int(U)$, so $U = Int(U)$ and $U$ is open.
        ]
      ]
    )
  ]
)
