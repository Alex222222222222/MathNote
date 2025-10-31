#import "../../../utils.typ": *

==== Exercise

#enum(
  enum.item[
    A map $f: XX -> YY$ is said to be an #highlightIndex[open map] if for every "open set" $U subset.eq XX$, the set $f(U)$ is "open in" $YY$.
    Show that $pi: XX times YY -> XX$ is an open map.

    #proof[
      An open set in $XX times YY$ can be represented as
      $
        union_(i) (U_i times U'_i),
      $
      where $U_i$ and $U'_i$ are "open in" $XX$ and $YY$, respectively.

      Also,
      $
        union_(i) (U_i times U'_i) = (union_(i) U_i) times (union_(i) U'_i).
      $

      Thus,
      $
        pi(union_(i) (U_i times U'_i)) = union_(i) U_i,
      $
      which is "open in" $XX$.
      Hence, $pi$ is an open map.
    ]
  ],

  enum.item[
    Let $XX$ and $XX'$ denote a single set in the topologies $TT$ and $TT'$, respectively;
    let $YY$ and $YY'$ denote a single set in the topologies $UU$ and $UU'$, respectively.
    #footnote[What $XX$, $XX'$, $YY$, and $YY'$ really mean here is unclear, so the exercise is included without proof.]
    Assume these sets are nonempty.

    #enum(
      enum.item[
        Show that if $TT' supset.eq TT$ and $UU' supset.eq UU$, then the product topology on $XX' times YY'$ is finer than the product topology on $XX times YY$.
      ],
      enum.item[
        Does the converse of the previous statement hold?
      ],
    )
  ],

  enum.item[
    Show that the countable collection
    #footnote[The proof that this collection is countable is similar to Cantor’s enumeration of a countable collection of countable sets.]
    $
      { (a,b) times (c,d) | a < b, c < d, a in QQ, b in QQ, c in QQ, d in QQ }
    $
    is a basis for $RR^(2)$.

    #proof[
      This is obvious once you observe that $(a,b) times (c,d)$ represents a rectangle in the $RR^(2)$ plane.
    ]
  ],

  enum.item[
    Let $XX$ be an ordered set.
    If $Y$ is a proper subset of $XX$ that is convex in $XX$, prove that $Y$ may not be an interval or a ray in $XX$.

    #proof[
      Let $XX = RR^(2)$ with the dictionary order.
      Then
      $
        Y = { (x,y) | -1 <= x <= 1 }
      $
      is convex in $XX$, but it is neither an interval nor a ray.
    ]

    There is a false proof I previously wrote:

    #proof[
      Let $S$ be the set of all intervals and rays of $Y$.
      Define a partial order on $S$ by inclusion, so if there is a chain in $S$:
      $
        S_1 subset.eq S_2 subset.eq S_3 ...
      $
      let
      $
        S = S_1 union S_2 union S_3 union ...
      $
      Thus, $S$ is an upper bound for the chain.

      By Zorn’s Lemma, there exists a maximal element $U$ in $S$, and we aim to prove that $U = Y$.

      If $U != Y$, then
      $
        exists x, x in Y - U.
      $
      If $U$ is a ray, say $(a, +infinity)$, then $x < a$, and thus
      $
        U subset.eq (x, +infinity) subset.eq Y,
      $
      contradicting the maximality of $U$.

      If $U$ is an interval, the argument is similar to the ray case.

      Therefore, $Y$ must be a ray or an interval.
    ]

    However, this proof is flawed — the set $S$ does exist, but it may not consist solely of intervals or rays, so it may not be contained in $S$.
  ],
)
