// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

#import "@preview/cetz:0.4.2": angle, canvas, draw
#import "@preview/lilaq:0.5.0" as lq
#import "../patt/patt/lib.typ": *

#show: patt.with(
  title: [#text(size: .906em)[Homework  Assignment 2]],
  
  date: datetime.today(),
  author: "John Doe",
  group: "A113",
  email: "j.doe@innopolis.university",
  
  course: "Physics I (Mechanics)",
  topic: "Forces and Motion",
  
  fontsize: 10pt,
)

// Rotate point `(x, y)` relative to the point `(ox, oy)` in `theta` degree direction
#let rotate-point((x, y), (ox, oy), theta) = {
  let angle_rad = theta.rad()
  
  let cos_angle = calc.cos(angle_rad)
  let sin_angle = calc.sin(angle_rad)
  
  let temp_x = x - ox
  let temp_y = y - oy
  
  let new_x = temp_x * cos_angle - temp_y * sin_angle
  let new_y = temp_x * sin_angle + temp_y * cos_angle
  
  new_x += ox
  new_y += oy
  
  (new_x, new_y)
}

// Move point `(x, y)` in `theta` degree direction to `d` distance
#let move-point((x, y), theta, d) = {
  let angle_rad = theta.rad()
  
  let dx = d * calc.cos(angle_rad)
  let dy = d * calc.sin(angle_rad)
  
  let new_x = x + dx
  let new_y = y + dy
  
  (new_x, new_y)
}

// Distance between two points
#let distance-points((x1, y1), (x2, y2)) = {
  calc.sqrt(calc.pow(x1 - x2, 2) + calc.pow(y1 - y2, 2))
}

// Angle between vectors in degrees
#let angle-vectors((x1, y1), (x2, y2)) = {
  let dot_product = x1 * x2 + y1 * y2
  
  let cross_product = x1 * y2 - y1 * x2
  
  let mod_v1 = calc.sqrt(x1 * x1 + y1 * y1)
  let mod_v2 = calc.sqrt(x2 * x2 + y2 * y2)
  
  let cos_angle = dot_product / (mod_v1 * mod_v2)
  
  let angle = calc.acos(calc.max(calc.min(cos_angle, 1), -1)).deg()
  
  (
    if cross_product < 0 {
      angle
    } else {
      360 - angle
    }
      * 1deg
  )
}

#task(
  name: "Problem 1 (25 pts).",
  description: [
    In the movie "Fast and Furious 7", one particular scene features 5 parachute-equipped cars (Dom's
    1968 Dodge Charger, Letty's 2015 Challenger SRT, Roman's 1968 Chevy Camaro Z/28, Brian's
    Subaru WRX STI, and Tej's Jeep Rubicon) being pushed out of a C-130 cargo airplane at the
    altitude of approximately 3500 meters. Some parameters of 3 of these cars are given in table below.
    
    #let header-color = rgb(61, 131, 194)
    #let cells-color = rgb(217, 229, 242)
    #let border-color = rgb(161, 193, 225)
    
    #show table.cell.where(y: 0): set text(fill: white)
    
    #set table(
      fill: (x, y) => {
        if y == 0 {
          header-color
        } else if calc.odd(y) {
          cells-color
        } else {
          white
        }
      },
      align: center + horizon,
      stroke: (x, y) => {
        if y == 0 { header-color } else {
          (
            left: border-color,
            bottom: border-color,
            right: border-color,
          )
        }
      },
    )
    
    #v(.65em)
    #align(center)[
      #box(width: 90%)[
        #table(
          columns: (1.7fr, 1fr, 1fr, 1fr),
          [], [Jeep Rubicon], [Dodge Challenger \ SRT (2015)], [Subaru  \ WRX STi],
          [Drag coefficient, $C_d$], [0.5], [0.38], [0.33],
          [Cross-technical area,  $A thin("m"^2)$], [2.58], [2.41], [2.225],
          [Mass, $m thin"(kg)"$], [2500], [2450], [1550],
        )
      ]
    ]
    #v(.65em)
    The air drag force is given by an equation $display(D = (C_d thin rho thin A thin v^2) / 2) thin .$ Air density and the gravity constant
    are $rho = 1.007 med "kg/m"^3$ and $g = 9.8 med "m/s"^2$, respectfully.
    
    What would be the terminal velocities of each car ($"m/s"thin$, round to $1$ decimal place), if they are
    performing a free-fall headfirst without tumbling in the air?
  
  ],
  solution: [
    // Insert your solution here
  ],
)

#task(
  name: none,
  description: [
    #grid(
      columns: (2.25fr, 1fr),
      [
        *Problem 2 (25 pts).* $quad$An object of mass $m = 0.25 med "kg"$, rotating on a string along a circular path of radius $R = 0.7 med "m"$ in the vertical plane, subjects to gravitational force (see figure at the right). The maximum tension force that the string can sustain without breaking is $30 med "N"$. If the speed of the object is being slowly increased (it means that the tangential acceleration is negligibly small compared to centripetal one), and assuming  $g = 9.8 med "m/s"^2$, answer the following:
      ],
      [
        #align(center + horizon)[
          #canvas({
            import draw: *
            
            let origin = (0, 0)
            let object-point = rotate-point((0, 1.25), origin, 125deg)
            let r-point = rotate-point((0, 1.25), origin, -30deg)
            
            circle(
              origin,
              radius: 1.25,
              stroke: (dash: "densely-dashed", thickness: .5pt, cap: "round"),
            )
            
            line(origin, object-point, stroke: 1pt + navy)
            
            line(
              origin,
              r-point,
              mark: (end: ">", fill: olive, stroke: olive, scale: .75),
              stroke: olive + .5pt,
            )
            content(move-point(r-point, -110deg, .75), $space R$)
            
            circle(origin, radius: .05, fill: black)
            
            set-style(
              mark: (end: ">", fill: blue, stroke: blue, scale: .75),
              stroke: blue + .5pt,
            )
            
            line(object-point, move-point(object-point, 270deg, 1))
            content((), $ space m g $, anchor: "west")
            
            line(object-point, move-point(object-point, 135deg, 1.125))
            content((), $ arrow(v) space $, anchor: "north-east")
            
            circle(object-point, radius: .125, fill: luma(80%), stroke: black + .5pt)
          })
        ]
      ],
    )
    \
    #set enum(numbering: "(1)")
    + Find the position of the mass on the circular trajectory (exactly) where the string has maximum tension at a given constant speed of the mass.$quad$ *(10 pts)*
    + What is the maximum speed ($"m/s"thin$, round to $1$ decimal place), when the string does not break for any position of the object on the whole circle trajectory?$quad$ *(15 pts)*
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
      #image("assets/uiiiaa.JPG", width: 90%)
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
    A motorboat of mass $m = 3$ tons starts to move from rest. After $33$ seconds, its velocity becomes
    $2 med "m/s"$. The engine force propelling the boat is constant throughout the whole period of the motion.
    Find the maximum velocity of the boat ($"m/s"thin$, round to  $1$ decimal place), if the drag force is given by the equation
    $
      arrow(F_d) = - k arrow(v) thin .
    $
    
    Where $arrow(v)$ denotes the boat velocity and $k = 100 med "kg/s" thin .$
  ],
  solution: [
    // Insert your solution here
  ],
)

#task(
  name: none,
  description: [
    #grid(
      columns: (1.5fr, 1fr),
      [
        *Problem 4 (25 pts).*$quad$ Block $B$ in figure (right) has the mass of $50 med "kg" thin$. The coefficient of static friction between the block and the
        table is $0.25$; an angle $theta$ is $30 degree$; assume that the cord between $B$ and the knot is horizontal.
        
      
      ],
      [
        #align(center + horizon)[
          #set text(size: 9pt)
          #canvas({
            import draw: *
            
            let origin = (0, 0)
            let pin-r = .075
            
            let c1 = rgb(212, 85, 0)
            let c2 = rgb(255, 0, 0)
            let c3 = rgb(173, 222, 234)
            let c4 = rgb(149, 188, 83)
            let c5 = rgb(0, 34, 101)
            
            let lpin = move-point(origin, 180deg, 1.3)
            let bpin = move-point(origin, 270deg, 1)
            let rpin = move-point(origin, 30deg, 1.5)
            
            let cockroach((x1, y1), (x2, y2), paw_step: .34, paws_shift: 0) = {
              let from = (x1, y1)
              let to = (x2, y2)
              
              let direction = angle-vectors((1, 0), (x2 - x1, y1 - y2))
              let paw_angle = 45deg
              let paw_len = .35
              
              let paws_count = calc.ceil(distance-points(from, to) / paw_step)
              
              let _paw((x, y)) = {
                line(
                  (x, y),
                  rotate-point(move-point((x, y), direction, paw_len), (x, y), paw_angle),
                  stroke: (paint: c5, cap: "round"),
                )
              }
              
              let paws_coords = {
                let res = (move-point((x1, y1), direction, paws_shift),)
                for i in range(1, paws_count) {
                  res.push(move-point(res.last(), direction, paw_step))
                }
                res
              }
              
              // Visualize
              line(
                from,
                to,
                stroke: (paint: c5, cap: "round"),
              )
              
              for coord in paws_coords {
                _paw(coord)
              }
            }
            
            // Lines
            line(origin, rpin, stroke: c5)
            line(origin, lpin, stroke: c2)
            line(origin, bpin, stroke: c1)
            
            // Blocks
            let rect_width = .495
            let rect_height = .825
            
            let rectA_point = move-point(move-point(bpin, 270deg, rect_width), 180deg, rect_height / 2)
            
            rect(
              rectA_point,
              (rel: (rect_height, rect_width)),
              radius: 0,
              stroke: .5pt,
              fill: c4,
            )
            content(move-point(bpin, 265deg, rect_width / 2), [$A$])
            
            let rectB_point = move-point(move-point(lpin, 270deg, rect_width / 2), 180deg, rect_height)
            
            rect(
              rectB_point,
              (rel: (rect_height, rect_width)),
              radius: 0,
              stroke: .5pt,
              fill: c3,
            )
            content(move-point(lpin, 180deg, rect_height / 1.85), [$B$])
            
            // Angle
            let h = calc.sin(30deg) * distance-points(origin, rpin)
            line(
              origin,
              move-point(rpin, 270deg, calc.sin(30deg) * distance-points(origin, rpin)),
              stroke: (paint: blue, dash: "densely-dashed", thickness: .5pt),
            )
            
            angle.angle(
              origin,
              (1, 0),
              rotate-point((1, 0), origin, 30deg),
              stroke: .5pt + black,
              radius: .76,
            )
            content(move-point(origin, 15deg, .95), [$theta$])
            
            // Cockroaches
            let cr1_from = move-point(
              move-point(
                lpin,
                270deg,
                rect_width / 2,
              ),
              0deg,
              distance-points(lpin, origin) / 3,
            )
            let cr1_to = move-point(
              move-point(
                lpin,
                180deg,
                rect_height + distance-points(lpin, origin) / 3 + .25,
              ),
              270deg,
              rect_width / 2,
            )
            
            
            let cr2_from = move-point(rpin, 90deg, .5)
            let cr2_to = move-point(rpin, 270deg, 2.5)
            
            cockroach(cr1_from, cr1_to)
            cockroach(cr2_from, cr2_to, paws_shift: .1)
            
            // Pins
            let knot-point = move-point(origin, 120deg, .75)
            content(knot-point, [Knot])
            line(move-point(knot-point, 270deg, .15), origin, stroke: (thickness: .25pt, cap: "round"))
            
            circle(
              name: "opin",
              origin,
              radius: pin-r,
              fill: luma(80%),
              stroke: black + .5pt,
            )
            
            circle(
              name: "lpin",
              lpin,
              radius: pin-r,
              fill: luma(80%),
              stroke: black + .5pt,
            )
            
            circle(
              name: "bpin",
              bpin,
              radius: pin-r,
              fill: luma(80%),
              stroke: black + .5pt,
            )
            
            circle(
              name: "rpin",
              rpin,
              radius: pin-r,
              fill: luma(80%),
              stroke: black + .5pt,
            )
          })
        ]
      ],
    )
    
    Find the maximum mass of block $A$ ($"kg" thin$, round to $1$ decimal place), for which the system will be stationary. Assume $g = 9.8 med "m/s"^2 thin$.
  ],
  solution: [
    // Insert your solution here
  ],
)

#bibliography(title: "References", style: "ieee", "refs.yml")
