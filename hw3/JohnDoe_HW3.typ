#import "@preview/lilaq:0.5.0" as lq
#import "../patt/patt/lib.typ": *


#show: patt.with(
  title: [#text(size: .906em)[Homework  Assignment 3]],
  
  date: datetime.today(),
  author: "John Doe",
  group: "A113",
  email: "j.doe@innopolis.university",
  
  course: [Physics I (Mechanics)],
  topic: [Energy and Work],
  
  fontsize: 10pt,
)

#show figure: set block(above: 2em, below: 2em)

#let vv = context v(-2 * par.spacing)

#task(
  name: [Problem 1 (25 pts).],
  description: [
    One particular glitch in the Mafia 3 video game resulted in the player's character getting launched into the air after being intermittently #footnote[PixeliSoturi (2016), #text(style: "italic")[Mafia 3 -- Turbo jump -- Trampoline Bug],
    https://www.youtube.com/watch?v=5hKXFhVbMH0] stuck inside a motor boat. A hyper-realistic representation of this scene is shown on @glitch. The known quantities are: mass of the character $m = 80 med "kg"$, maximum launch height $H = 70 med "m"$, initial penetration of the character's feet into the boat's hull $x = 0.5 med "m"$.
      
    #v(-1.2em)
    #figure(
      caption: [The glitch representation.],
      image("assets/1.png", width: 35%)
    ) <glitch>
    
    + Assuming that the boat's hull can be modeled as an ideal spring with the stiffness coefficient $k$, what should be the value of $k$ (in $"N"\/"m"$, round to nearest thousand) so that the character is launched into the air by a given height $H$? Neglect air drag.$quad$*(15 pts)*
    
    + What is the maximum character's speed $v_i$ (in $"km/h"$, round to one decimal place)?$quad$*(10 pts)*
    
  ],
  solution: [
    #lorem(90)
  ]
)

#task(
  name: [Problem 2 (25 pts).],
  description: [
    An object of mass $m = 50 med "g"$ slides with the zero initial velocity down an inclined plane set at an angle $alpha = 30 degree$ to the horizontal. It successfully slides down, then covers the distance of $50 med "cm"$ on the horizontal plane, and stops. Find the work (in $"J"$, round to two decimal places) performed by the friction forces over the whole distance, assuming the friction coefficient $k = 0.15$ for both inclined and horizontal planes.
    
    #figure(
      caption: [Sliding of the object. ],
      image("assets/2.png", width: 40%),
    )
  ],
  solution: [
    #lorem(90)
    #answer[#lorem(10)] #vv
  ]
)
#task(
  name: [Problem 3 (25 pts).],
  description: [
    A small mass slides down with zero initial velocity from the top of a smooth hill of height $H$. The foot of the hill has a portion of horizontal surface before the vertical cliff of height $h$ as shown on @fhill.
    
    #figure(
      caption: [Sliding of the object from the hill.],
      image("assets/3.png", width: 40%),
    ) <fhill>
    
    + What must be the height of the horizontal portion $h\/H$ to ensure the maximum distance $s$ covered by the flying mass?
    
    + What the maximum distance s measured in $H$ equals to?
  ],
  solution: [
    #lorem(90)
  ]
)

#task(
  name: [Problem 4 (25 pts).],
  description: [
    The "Mammoth" tank's electric motor has the maximum power of $5 med "MW"$. The tank can move (with no sliding) up a hill, which makes the angle of $29 degree$ with the horizontal, at maximum speed of $37 med "km/h"$. What is the mass (in tons, round to two decimal places) of the tank?
    
    #figure(
      caption: [Moving up hill of the "Mammoth" tank.],
      image("assets/4-2.jpg", width: 55%),
    )
  ],
  solution: [
    #lorem(90)
  ]
)