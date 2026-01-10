# Experimental!
I ~ "gh: Marcos-cat/iris"

# Quaternion implementation
# Ported from: https://github.com/rawify/Quaternion.js/blob/main/src/quaternion.js
┌─╴Q
  ~ [w x y z]

  # Identity Quaternion
  Identity ← New 1 0 0 0

  # Q ? Axis Angle
  FromAxisAngle ← (
    ⊸(/+˙×)
    ⍣(Identity◌◌°0
    | ⊃(∂∿÷2 ⋅⋅∘|⋅∘|˜÷⊃(∿÷2⋅⋅∘|√))
      New ⊙(∩₃⌟× °⊟₃)
    )
  )

  # Q ? Q1 Q2
  Mul ← ⊃[
    ˜-˜-˜- °⊟₄ ×⊓(⊃[w|x|y|z]|⊃[w|x|y|z])
  | ˜-˜+˜+ °⊟₄ ×⊓(⊃[w|x|y|z]|⊃[x|w|z|y])
  | ˜-˜+˜+ °⊟₄ ×⊓(⊃[w|y|z|x]|⊃[y|w|x|z])
  | ˜-˜+˜+ °⊟₄ ×⊓(⊃[w|z|x|y]|⊃[z|w|y|x])
  ]

  ToMatrix ← (
    # Generates shorthand functions
    (/$"_\n_"♭₂˙⊞($"_ = ×⊃(_|_)"⊃(⊂|∘|⋅∘)) °□⊢)^!(wxyz)
    # The actual calculation
    ⊃[⊃[˜-1×₂+⊃(yy|zz)|×₂˜-⊃(xy|wz)|×₂+⊃(xz|wy)]
    | ⊃[×₂+⊃(xy|wz)|˜-1×₂+⊃(xx|zz)|×₂˜-⊃(yz|wx)]
    | ⊃[×₂˜-⊃(xz|wy)|×₂+⊃(yz|wx)|˜-1×₂+⊃(xx|yy)]
    ]
  )
└─╴

~ {Rot Pos Model}
Size      ← 1000
DotSize   ← 4
TextSize  ← 30
ZoomSpeed ← 5

KeybaordRotationSpeed ← 3
MouseRotationSpeed    ← 0.5

Load ← (
  ⍜&fo&rl□
  ▽⊸≡◇(≍"v "⬚@ ↙₂)
  ⍉≡◇(⊜⋕⊸≠@ ↘2)
  -÷2+⊸≡⊃/↧/↥
  ÷⊸(/↥⌵♭)
)
Zoom ← ⍜⊣(+ ×ZoomSpeed×I~Window~Dt I~Mouse~Scroll)
Rotate ← (
  KeyboardInput ← (×KeybaordRotationSpeed ×I~Window~Dt [°ℂ] /+I~Key~WASD 0)
  MouseInput ← (×MouseRotationSpeed ×I~Window~Dt ×I~Mouse~Down I~Mouse~Left [°ℂ] I~Mouse~Change)
  Input ← (+ KeyboardInput MouseInput)

  /˜Q~Mul ⊃[∘|⊓(Q~FromAxisAngle [0 1 0]|Q~FromAxisAngle [1 0 0]) °⊟ Input]
)
Project ← (
  ▽⊃(>0⊣|ℂ⊙¯∩⌟˜÷°⊟₃)
  -÷2DotSize×Size÷2+˙ℂ1
)
Rx  ← ↯3_3⊃[1|0|0|0|∂∿|¯∿|0|∿|∂∿]
Ry  ← ↯3_3⊃[∂∿|0|∿|0|1|0|¯∿|0|∂∿]
Rz  ← ↯3_3⊃[∂∿|¯∿|0|∿|∂∿|0|0|0|1]
Mul ← ≡/+×⌟

⍤"provide path to .obj file as an argument"≥2⧻&args
New Q~Identity ⌝↘2¤×4/↧⊸⊣ Load ⊏1&args

I~Open ˙ℂSize "uiuobj"

◌I~Loop!(
  ⍜Pos Zoom
  ⍜Rot Rotate
  I~Draw~Background I~Color~Base
  Project -⊙(Mul Q~ToMatrix) ⊸⊃(Pos|Rot|Model)
  I~Draw~Square I~Color~Text DotSize
  I~Draw~Text I~Color~Green TextSize ˙ℂ30 $"w/a/s/d to rotate, scroll to zoom, esc to quit"
)
