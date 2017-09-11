module Modules.Geometry where

    --tipo para vetores
    type VecVal = Float

    --tipo para vetor 2D
    type Vec2 = (VecVal, VecVal)

    newtype LineSegment = LineSegment (Vec2, Vec2)

-- Função que converte de coordenada polar para coordenada cartesiana.
polar :: VecVal     -- Coordenada polar radial
         -> VecVal  -- Coordenada polar angular
         -> Vec2    -- Coordenadas Cartesianas
polar m a = (m * sin a, m * (-cos a))
