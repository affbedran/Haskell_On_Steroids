module Modules.Geometry where

--tipo para vetores
type VecVal = Float

--tipo para vetor 2D
type Vec2 = (VecVal, VecVal)

newtype LineSegment = LineSegment (Vec2, Vec2)

-- Função que converte de coordenada polar para coordenada cartesiana.
polar :: VecVal -> VecVal -> Vec2
polar m a = (m * sin a, m * (-cos a))

-- Define uma forma renderizável como uma coleção de pontos,
-- partindo da premissa que ela é formada por segmentos de linha,
-- e que linhas são formadas por pontos.
pointsToSegments :: [Vec2] -> [LineSegment]
pointsToSegments (p:p':[])     = [LineSegment (p,p')]
pointsToSegments (p:t@(p':ps)) = (LineSegment (p,p')) : pointsToSegments t
