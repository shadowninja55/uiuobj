# Experimental!
I ~ "gh: Marcos-cat/iris"

~ {Rot Pos Model}
Size       ← 1500
DotSize    ← 4
TextSize   ← 30
ZoomSpeed  ← 5
OrbitSpeed ← 3
Load ← (
  ⍜&fo&rl□
  ▽⊸≡◇(≍"v "⬚@ ↙₂)
  ⍉≡◇(⊜⋕⊸≠@ ↘2)
  -÷2+⊸≡⊃/↧/↥
  ÷⊸(/↥⌵♭)
)
Zoom  ← ⍜⊣(+ ×ZoomSpeed×I~Window~Dt I~Mouse~Scroll)
Orbit ← - ×OrbitSpeed×I~Window~Dt ⊙◌°ℂ/+I~Key~WASD 0
Project ← (
  ▽⊃(>0⊣|ℂ⊙¯∩⌟˜÷°⊟₃)
  -÷2DotSize×Size÷2+˙ℂ1
)
Ry  ← ↯3_3⊃[∂∿|0|∿|0|1|0|¯∿|0|∂∿]
Mul ← ≡/+×⌟

⍤"provide path to .obj file as an argument"≥2⧻&args
New 0 ⌝↘2¤×4/↧⊸⊣ Load ⊏1&args

I~Open ˙ℂSize "uiuobj"
◌I~Loop!(
  ⍜Pos Zoom
  ⍜Rot Orbit
  I~Draw~Background I~Color~Base
  Project -⊙(Mul Ry)⊸⊃(Pos|Rot|Model)
  I~Draw~Square I~Color~Text DotSize
  I~Draw~Text I~Color~Green TextSize ˙ℂ30 $"a/d to rotate, scroll to zoom, esc to quit"
)
