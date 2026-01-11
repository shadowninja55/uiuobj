# Experimental!
I ~ "gh: Marcos-cat/iris"
M ~ "gh: Omnikar/uiua-math"

~ {Angles Camera Model}
Size        ← 1500
DotSize     ← 4
TextSize    ← 30
ZoomSpeed   ← 5
RotateSpeed ← 0.3
Load ← (
  ⍜&fo&rl□
  ▽⊸≡◇(≍"v "⬚@ ↙₂)
  ⍉≡◇(⊜⋕⊸≠@ ↘2)
  -÷2+⊸≡⊃/↧/↥
  ÷⊸(/↥⌵♭)
)
Zoom   ← ⍜⊣(+ ×ZoomSpeed×I~Window~Dt I~Mouse~Scroll)
Rotate ← - ×RotateSpeed×I~Window~Dt I~Transform~Coords
Project ← (
  ▽⊃(>0⊣|ℂ⊙¯∩⌟˜÷°⊟₃)
  -÷2DotSize×Size÷2+˙ℂ1
)

⍤"provide path to .obj file as an argument"≥2⧻&args
New 0_0 ⊂0_0×4/↧⊸⊣ Load ⊏1&args

I~Open ˙ℂSize "uiuobj"
◌I~Loop!(
  ⍜Camera Zoom
  ⍜Angles I~Mouse~Drag‼I~Mouse~Left Rotate
  I~Draw~Background I~Color~Base
  Project -⊸⊃Camera(⍜⊙⍉M~QRot /M~Qqp⇌ M~RQuat⊙[0_1_0 1_0_0]⊃Angles Model)
  I~Draw~Square I~Color~Text DotSize
  I~Draw~Text I~Color~Green TextSize ˙ℂ30 $"drag to rotate, scroll to zoom, esc to quit"
)
