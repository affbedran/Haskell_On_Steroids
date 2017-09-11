module Modules.Transform (
    Body (..),
    transform
    ) where

import Modules.Geometry

-- Estrutura de dado que contem a posição e o angulo de um corpo rigido
data Body = Body {
    bodyPos   :: Vec2,
    bodyAngle :: Float
    }

-- Transforma um segmento de acordo com a posição e orientação
transform :: Body -> LineSegment -> LineSegment
transform (Body pos a) = applyXform $ (translatePt pos) . (rotatePt a)

-- Translada um ponto
translatePt :: Vec2 -- ^ (x,y) delta
            -> Vec2 -- ^ ponto original
            -> Vec2 -- ^ ponto transladado
translatePt (x,y) (x',y') = (x+x', y+y')

-- Rotaciona um ponto com eixo no seu centro.
rotatePt :: Float -> Vec2 -> Vec2
rotatePt a (x,y) = (x', y')
    where x' = x * (cos a) - y * (sin a)
          y' = x * (sin a) + y * (cos a)

-- Aplica uma função de transformação de pontos a um segmento de linha.
applyXform :: (Vec2 -> Vec2) -> LineSegment -> LineSegment
applyXform f (LineSegment (p,p')) = (LineSegment (f p, f p'))
