module Modules.Geometry where

    --tipo para vetores
    type VecVal = Float

    --tipo para vetor 2D
    type Vec2 = (VecVal, VecVal)

    newtype LineSegment = LineSegment (Vec2, Vec2)
