module Modules.Player (Player(..)) where

import Modules.Geometry
import Modules.Transform
import Modules.Render (LineRenderable(..))

-- estrutura de dados que armazena o estado atual do jogador.
data Player = Player {playerBody :: Body}

-- instância da nave do jogador
instance LineRenderable Player where
    lineSegments (Player b) = map (transform b) $ shipLines

-- constante de tamanho da nave
shipSize = 12.0 :: Float

-- Lista de linhas que compõem a nave do jogador
shipLines :: [LineSegment]
shipLines = pointsToSegments points
    where points = [polar shipSize  0,-- ponto superior
                    polar shipSize  (0.7*pi),-- ponto lateral
                    polar (shipSize*0.2) pi,--ponto central inferior
                    polar shipSize (1.3*pi),-- ponto lateral
                    polar shipSize  0]-- ponto superior de fechamento da forma
