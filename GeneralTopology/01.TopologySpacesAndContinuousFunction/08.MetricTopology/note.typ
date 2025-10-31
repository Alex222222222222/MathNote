#import "../../../utils.typ": *

=== Metric Topology

#definition(title: [metric])[
  A #highlightIndex[metric] on a set $XX$ is a function
  $
    d: XX times XX -> RR
  $
  satisfying:
  #enum(
    enum.item[$d(x,y) >= 0$ for all $x,y in XX$, with equality iff $x = y$.],
    enum.item[$d(x,y) = d(y,x)$ for all $x,y in XX$.],
    enum.item[(Triangle inequality) $d(x,y) + d(y,z) >= d(x,z)$ for all $x,y,z in XX$.],
  )
  Given a metric $d$ on $XX$, the number $d(x,y)$ is called the #highlightIndex[distance] between $x$ and $y$.
]<def:Metric>

#definition(title: [$epsilon$-ball centered at $x$])[
  #footnote[When no confusion arises, the metric $d$ may be omitted in $B_d(x,epsilon)$.]
  Given a metric $d$ on $XX$ and $epsilon > 0$, define
  $
    B_d(x,epsilon) = { y | d(x,y) < epsilon }.
  $
  This set is called the $epsilon$-ball centered at $x$.
]<def:EpsilonBallCenteredAtX>

#definition(title: [metric topology])[
  If $d$ is a metric on $XX$, then the collection of all $epsilon$-balls $B_d(x,epsilon)$, where $x in XX$ and $epsilon > 0$, forms a basis for a topology on $XX$, called the #highlightIndex[metric topology] induced by $d$.
]<def:MetricTopology>

#definition(title: [metrizable])[
  A topological space $XX$ is #highlightIndex[metrizable] if there exists a metric $d$ on $XX$ that induces its topology.
  A #highlightIndex[metric space] is a metrizable space $XX$ together with a specific metric $d$ inducing its topology.
]<def:Metrizable>

#definition(title: [bounded])[
  Let $(XX,d)$ be a metric space. A subset $A subset.eq XX$ is #highlightIndex[bounded] if there exists $M > 0$ such that
  $
    d(a_1,a_2) <= M
  $
  for all $a_1,a_2 in A$.
]<def:Bounded>

#definition(title: [diameter])[
  Let $(XX,d)$ be a metric space and $A subset.eq XX$ bounded. The #highlightIndex[diameter] of $A$ is
  $
    diam(A) = sup { d(a_1,a_2) | a_1,a_2 in A }.
  $
]<def:Diameter>

#theorem[
  Let $(XX,d)$ be a metric space and define
  $
    overline(d)(x,y) = min{ d(x,y), 1 }.
  $
  Then $overline(d)$ is a metric inducing the same topology as $d$.
  This $overline(d)$ is called the #highlightIndex[standard bounded metric] corresponding to $d$.
]

#proof[
  Clearly $overline(d)$ is a metric. To show it induces the same topology, it suffices to prove that for all $a in XX$ and $epsilon > 0$ there exist points ${a_alpha}$ and numbers ${epsilon_alpha <= 1}$ such that
  $
    B_d(a,epsilon) = union.big_(alpha) B_(overline(d))(a_alpha, epsilon_alpha).
  $
  For each $x in B_d(a,epsilon)$ set $a_x = x$ and choose $epsilon_x < min(epsilon - d(a,x), 1)$. Then
  $
    B_d(a,epsilon) supset.eq B_(overline(d))(a_x,epsilon_x),
  $
  since for $y in B_(overline(d))(a_x,epsilon_x)$,
  $
    d(a,y) <= d(a,a_x) + d(a_x,y)
    < d(a,a_x) + min(epsilon - d(a,x), 1)
    <= epsilon.
  $
  Hence
  $
    B_d(a,epsilon) = union.big_(x in B_d(a,epsilon)) B_(overline(d))(a_x,epsilon_x).
  $
]

#definition(title: [norm])[
  For $x = (x_1,...,x_n)$ in $RR^(n)$, define the #highlightIndex[norm]
  $
    norm(x) = (x_1^(2) + ... + x_n^(2))^(1/2).
  $
]<def:Norm>

#definition(title: [euclidean metric])[
  On $RR^(n)$, the #highlightIndex[euclidean metric] is
  $
    d(x,y) = norm(x - y).
  $
]<def:EuclideanMetric>

#definition(title: [square metric])[
  On $RR^(n)$, the #highlightIndex[square metric] is
  $
    rho(x, y) = max{ |x_1 - y_1|, ..., |x_n - y_n| }.
  $
]<def:SquareMetric>

#lemma[
  Let $d$ and $d'$ be metrics on $XX$, inducing topologies $T$ and $T'$ respectively.
  Then $T'$ is finer than $T$ iff for every $x in XX$ and $epsilon > 0$ there exists $delta > 0$ such that
  $
    B_(d')(x,delta) subset.eq B_d(x,epsilon).
  $
]

#proof[
  If $T'$ is finer than $T$, then for each $B_d(x,epsilon)$ there exists an open $U$ in $T'$ with $x in U subset.eq B_d(x,epsilon)$. Since $\{B_(d')(x,delta)\}$ is a basis for $T'$, some $B_(d')(x,delta)$ satisfies $B_(d')(x,delta) subset.eq B_d(x,epsilon)$.
  Conversely, if this inclusion condition holds, then the bases of $T$ and $T'$ satisfy the criterion for $T'$ being finer than $T$.
]

#theorem[
  The topologies on $RR^(n)$ induced by the Euclidean metric $d$ and the square metric $rho$ are identical to the product topology on $RR^(n)$.
]

#definition(title: [uniform metric, uniform topology])[
  Given an index set $J$ and points
  $
    x = (x_alpha)_(alpha in J), quad y = (y_alpha)_(alpha in J)
  $
  in $RR^(J)$, define
  $
    overline(rho)(x,y) = sup { overline(d)(x_alpha, y_alpha) | alpha in J },
  $
  where $overline(d)$ is the standard bounded metric on $RR$.
  The function $overline(rho)$ is the #highlightIndex[uniform metric] on $RR^(J)$, and the topology it induces is the #highlightIndex[uniform topology].
]<def:UniformMetric>

#theorem[
  The uniform topology on $RR^(J)$ is finer than the product topology and coarser than the box topology.
]

#theorem[
  Let $overline(d)(a,b) = min{ |a - b|, 1 }$ be the standard bounded metric on $RR$.
  For $x,y in RR^(omega)$, define
  $
    D(x,y) = sup { overline(d)(x_i, y_i) / i }.
  $
  Then $D$ is a metric inducing the product topology on $RR^(omega)$.
]

#proof[
  The metric axioms are clear except the triangle inequality, which follows since for all $i$,
  $
    overline(d)(x_i,z_i)/i <= overline(d)(x_i,y_i)/i + overline(d)(y_i,z_i)/i <= D(x,y) + D(y,z),
  $
  hence $D(x,z) <= D(x,y) + D(y,z)$.

  To show $D$ induces the product topology:
  (→) If $U$ is open in the $D$-topology and $x in U$, choose an $epsilon$-ball $B_D(x,epsilon) subset.eq U$. Pick $N$ with $1/N < epsilon$.
  Then the product set
  $
    V = (x_1 - epsilon, x_1 + epsilon) times ... times (x_N - epsilon, x_N + epsilon) times RR times RR times ...
  $
  satisfies $V subset.eq B_D(x,epsilon)$, so $U$ is open in the product topology.
  (←) Conversely, for a basic product open set $U = product_(i in ZZ_+) U_i$ with $U_i = RR$ for all but finitely many $i$, choose $epsilon = min{ epsilon_i / i }$.
  Then $B_D(x,epsilon) subset.eq U$. Thus both topologies coincide.
]

#definition(title: [Hilbert Cube])[
  The #highlightIndex[Hilbert cube] is
  $
    H = product_(n in ZZ_+) [0, 1/n].
  $
]<def:HilbertCube>

#definition(title: [$l^2$-topology])[
  Let $XX$ be the subset of $RR^(omega)$ consisting of sequences $x$ such that
  $
    sum_(i=1)^(infinity) x_i^(2)
  $
  converges.
  Define
  $
    d(x,y) = ( sum_(i=1)^(infinity) (x_i - y_i)^(2) )^(1/2).
  $
  This metric induces the #index(display: [$l^2$-topology], [l2-topology]) #highlight[$l^2$-topology] on $XX$.
]<def:L2Topology>

#definition(title: [countable basis at point $x$])[
  A space is said to have a #highlightIndex[countable basis at point $x$] if there exists a countable family $\{ U_n \}_(n in ZZ_+)$ of neighbourhoods of $x$ such that any neighbourhood of $x$ contains some $U_n$.
  A space with a countable basis at each point satisfies the #highlightIndex[first countability axiom].
]<def:CountableBasisAtPointX>

#theorem[
  Let $f: XX -> YY$ be a map between metrizable spaces with metrics $d_(XX)$ and $d_(YY)$.
  Then $f$ is continuous iff for all $x in XX$ and $epsilon > 0$, there exists $delta > 0$ such that
  $
    d_(XX)(x,y) < delta => d_(YY)( f(x), f(y) ) < epsilon.
  $
]

#proof[
  (→) If $f$ is continuous, for any $x$ and $epsilon$, the preimage $f^(-1)(B(f(x),epsilon))$ is open and contains $x$.
  Thus some $delta$-ball $B(x,delta)$ lies inside it, giving the desired implication.
  (←) Conversely, if the $epsilon$–$delta$ condition holds, for any open $V subset.eq YY$, each $x in f^(-1)(V)$ has a $delta$-ball around it mapping into $V$, so $f^(-1)(V)$ is open.
]

#lemma(title: [The sequence lemma])[
  Let $XX$ be a topological space and $A subset.eq XX$.
  If a sequence from $A$ converges to $x$, then $x in overline(A)$.
  Conversely, if $XX$ is metrizable, then for each $x in overline(A)$ there exists a sequence in $A$ converging to $x$.
]

#theorem[
  If $f: XX -> YY$ is continuous and $x_n -> x$ in $XX$, then $f(x_n) -> f(x)$ in $YY$.
  The converse holds if $XX$ is metrizable.
]

#lemma[
  Addition, subtraction, and multiplication are continuous maps $RR times RR -> RR$.
  Division is continuous on $RR times (RR without {0}) -> RR$.
]

#theorem[
  If $f,g: XX -> RR$ are continuous, then $f+g$, $f-g$, and $f*g$ are continuous.
  If $g(x) != 0$ for all $x$, then $(f/g)$ is continuous.
]

#definition(title: [converge uniformly])[
  Let $f_n: XX -> YY$ be a sequence of functions into a metric space $(YY,d)$.
  The sequence $(f_n)$ #highlightIndex[converges uniformly] to $f: XX -> YY$ if for every $epsilon > 0$ there exists $N$ such that
  $
    d( f_n(x), f(x) ) < epsilon
  $
  for all $n > N$ and all $x in XX$.
]<def:ConvergeUniformly>

#theorem(title: [Uniform limit theorem])[
  If $f_n: XX -> YY$ are continuous maps and $(f_n)$ converges uniformly to $f$, then $f$ is continuous.
]<def:UniformLimitTheorem>

#definition(title: [isometric imbedding])[
  Let $(XX,d_(XX))$ and $(YY,d_(YY))$ be metric spaces.
  A map $f: XX -> YY$ satisfying
  $
    d_(YY)( f(x_1), f(x_2) ) = d_(XX)( x_1, x_2 )
  $
  for all $x_1,x_2 in XX$ is a #highlightIndex[isometric imbedding] of $XX$ in $YY$.
]<def:IsometricImbedding>

