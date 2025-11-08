// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

// #import "@preview/lilaq:0.5.0" as lq
#import "../patt/patt/lib.typ": *

#show: patt.with(
  title: [#text(size: .906em)[Homework  Assignment 4]],

  date: datetime.today(),
  author: "John Doe",
  group: "A113",
  email: "j.doe@innopolis.university",

  course: "Physics I (Mechanics)",
  topic: [Linear Momentum and Impulse],

  fontsize: 10pt,
)


#task(
  name: [Problem 1 (25 pts).],
  description: [
    Two boats were slowly moving by inertia (drag forces exerted by water are negligibly small) along parallel  courses  towards  each  other.  When  the  boats  reached  each  other,  the  load  of  $25 med "kg"$  was carefully reloaded from first boat to second one. After that, the second loaded boat stopped, first boat continued moving with velocity of $8 med "m/s"$. What were the initial velocities of the boats ($"m/s"$, round to $1$ decimal place), if the mass of second boat before reloading was $1 med "t"$?
  ],
  solution: [
    // Insert your solution
  ],
)

#task(
  name: [Problem 2 (25 pts).],
  description: [
    A  projectile  is  shot  from  a  gun  at  angle  $theta_0 = 60degree$  to  the  flat  ground  with  an  initial  velocity  of $v_0 = 20 med "m/s"$. Once the projectile reaches its maximum height, it explodes into $2$ pieces of equal mass, with the rear piece having zero horizontal velocity after the explosion (and thus vertically dropping to the ground, as shown in figure below). What will be the total travel distance $d$ ($"m"$, round to $1$ decimal place) of the other piece of projectile from the gun, assuming zero air drag?
    \ \
    #align(center, image("assets/2.png", width: 55%))
  ],
  solution: [
  ],
)

#task(
  name: [Problem 3 (25 pts).],
  description: [
    Three blocks are placed on a frictionless surface, with blocks of masses $m_2$ and $m_3$ being initially at  rest.  Block 1 is  moving  with  a  velocity  of  $v_(1i) = 10 med "m/s"$. It then collides  with a block 2 (left figure), which then collides with block 3 (right figure). The third block has mass $m_3 = 6 med "kg"$. After the second collision, block 2 becomes stationary again, while block 3 has the velocity of $v_(3f) = 5 med "m/s"$. Assuming all collisions to be elastic, find the final velocity $v_(1f)$ of block 1 ($"m/s"$, round to 1 decimal place).
    \ \
    #image("assets/3.png")
  ],
  solution: [
  ],
)


#let smash = context h(-measure($thin$).width + .25em)

#task(
  name: [Problem 4 (25 pts).],
  description: [
    In February 1955, a paratrooper fell $370 med "m"$ from an airplane without being able to open his chute but happened to land in snow, suffering only minor injuries. Assume that his speed at impact was $v_f = 56 med "m/s"$ (terminal speed), that his mass (including gear) was $85 med "kg"$, and that the magnitude of the constant force on him from the snow was at the survivable limit of $1.2 times 10^5 med "N"$.

    #set enum(numbering: "1.")
    Find:
    + the  minimum  depth  of  snow  ($"cm"$,  round  to the  nearest  integer)  that  would  have  stopped him \ safely *(15 pts)*;
    + time ($"s"$, round to $2$ decimal places) required for the trooper to pass through this layer of snow \ before coming to a full stop *(5 pts)*;
    + the  magnitude  of  the  impulse  $p$  ($"N" smash dot smash "s"$,  round  to  $2$  decimal  places)  on  him  from  the  snow *(5 pts)*.
  ],
  solution: [
  ],
)
