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

-- Define uma forma renderizável como uma coleção de pontos,
-- partindo da premissa que ela é formada por segmentos de linha,
-- e que linhas são formadas por pontos.
pointsToSegments :: [Vec2] -> [LineSegment]
pointsToSegments (p:p':[])     = [LineSegment (p,p')]
pointsToSegments (p:t@(p':ps)) = (LineSegment (p,p')) : pointsToSegments t

-- Função que translada um ponto
translate :: Vec2 -> Vec2 -> Vec2
translate (x,y) (x', y') = (x+x', y+y')

-- Função que translada uma linha com base no translado de pontos
translateLine :: Vec2 -> LineSegment -> LineSegment
translateLine p (LineSegment(l,l')) = LineSegment (t l , t l')
    where t = translate p
