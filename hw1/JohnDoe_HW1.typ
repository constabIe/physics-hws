#import "@preview/icu-datetime:0.1.2": fmt-date
#import "@preview/cetz:0.4.0"
#import "@preview/cetz-plot:0.1.2"
#import "@preview/unify:0.7.1": qty, unit
#import "../patt/patt/lib.typ": *
#import "@preview/lilaq:0.5.0" as lq

// Rename the file before compiling the paper!

#show: patt.with(
  title: text(size: .8em)[Homework  Assignment 1],
  
  author: "John Doe",
  email: "j.doe@innopolis.university",
  group: "A113",
  
  course: "Physics I (Mechanics)",
  topic: "Kinematics",
  
  bibliography: bibliography(title: "References", "refs.yml"), // comment the line if you do not need citing
)

#let style-options = (
  axes: (
    x: (padding: 1),
    y: (padding: .5),
    tick: (stroke: none),
  ),
)
#let plot-options = (
  size: (5, 2),
  axis-style: "school-book",
  x-tick-step: none,
  y-tick-step: none,
  fill: black,
)

#task(
  name: "Problem 1 (25 pts).",
  description: [
    The figure below shows the time dependence of velocity.
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *

        set-style(
          ..style-options,
        )

        plot.plot(
          x-label: [$t$, s],
          y-label: [$v$, m/s],
          x-min: 0,
          x-max: 18,
          y-min: 0,
          y-max: 4,
          x-ticks: (4, 10, 18),
          y-ticks: (4,),
          ..plot-options,
          {
            let dashed-opts = (stroke: (paint: black, dash: "dashed", thickness: .5pt))
            plot.add(
              ((0, 4), (4, 4)),
              style: dashed-opts,
            )

            plot.add(
              ((4, 0), (4, 4)),
              style: dashed-opts,
            )

            plot.add(
              ((10, 0), (10, 4)),
              style: dashed-opts,
            )

            plot.add(
              ((-.5, 0), (0, 0), (4, 4), (10, 4), (18, 0)),
              style: (stroke: blue),
            )

            plot.annotate({
              content((5, 2 / 5 + .1), $t_1$)
              content((11, 2 / 5 + .1), $t_2$)
              content((19, 2 / 5 + .1), $t_3$)
            })
          },
        )

        line((-1, 0), (0, 0), stroke: blue)
      })
    ]

    Do the following:

    #set enum(numbering: "(1)")
    + Plot the acceleration and displacement with respect to time. Assume, the initial coordinate is \ $x(0) = qty("0", "m")$.
    + Determine the displacement and the average velocity over time interval $[t_1, t_3]$.

    Given: $t_1 = qty("4", "s")$, $t_2 = qty("10", "s")$, $t_3 = qty("18", "s")$.

  ],
  solution: [
    // Insert your solution here.
  ],
)

#task(
  name: "Problem 2 (25 pts).",
  description: [
    A ball is thrown horizontally from a height of $qty("20", "m")$ and hits the ground with a speed that is three times its initial speed. What is the initial speed? Assume that there is no air drag and therefore acceleration in the horizontal direction is zero.
  ],
  solution: [
    
    = Math mode
    $
      A = pi r^2
    $
    $
      "area" = pi dot "radius"^2
    $
    $
      cal(A) :=
      { x in RR | x "is natural" }
    $
    #let x = 5
    $#x < 17$
    
    = Lists
    == Bulleted
    Normal list.
    - Text
    - Math
    - Layout
    - ...
    
    Multiple lines.
    - This list item spans multiple
      lines because it is indented.
    
    Function call.
    #list(
      [Foundations],
      [Calculate],
      [Construct],
      [Data Loading],
    )
    
    == Numbered
    Automatically numbered:
    + Preparations
    + Analysis
    + Conclusions
    
    Manually numbered:
    2. What is the first step?
    5. I am confused.
    + Moving on ...
    
    Function call.
    #enum[First][Second]
    
    = Image
    #align(center)[
      #image("assets/uiiiaa.JPG")
    ]
    
    = Citing
    #lorem(10) @cormen
    
    = Plotting
    
    Plotting in `typst` @plotex with #link("https://typst.app/universe/package/lilaq")[`lilaq`] library is as powerfull as with `matplotlib` library in `python`$dots$
    #figure(
      caption: [Plot example.],
      supplement: "Figure",
      [
        #lq.diagram(
          lq.plot(
            range(8),
            (3, 6, 2, 6, 5, 9, 0, 4),
            smooth: true,
          ),
        )
      ],
    ) <plotex>
    
    
    
    #answer[#lorem(5)]
  ],
)

#task(
  name: "Problem 3 (25 pts).",
  description: [
    The fisherman on the boat moves up the river. Under the bridge, he drops a bottle into the water. Half an hour later, the fisherman turns back, moves down the river and finds the bottle $5 thin upright(k m)$ down the flow from the bridge. What is the speed of the river related to ground if the speed of the boat with respect to the river is constant? It is known that the rivers speed with respect to
    ground is constant too.
  ],
  solution: [
    // Insert your solution here.
  ],
)

#task(
  name: "Problem 4 (25 pts).",
  description: [
    The maximum speed of an athlete is $14 thin "m/s"$. After start, he runs with constant acceleration and then keeps maximum speed for the rest of the race. As a result, it takes him $11 thin "m"$ to cover $100 thin "m"$ distance. What is the acceleration of the athlete?
  ],
  solution: [
    // Insert your solution here.
  ],
)
