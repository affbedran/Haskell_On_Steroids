module Modules.State (GameState(..), initialGameState,) where

import Modules.Player
import Modules.Geometry
import Modules.Render (LineRenderable(..))

-- Estrutura de dados que mantém o Estado de Jogo
data GameState = GameState {statePlayer :: Player}

-- Instancia de GameState que renderiza os objetos do jogo.
instance LineRenderable GameState where
    lineSegments = stateLines

-- gerando o estado inicial de jogo
initialGameState :: GameState
initialGameState = GameState {
    statePlayer = initialPlayerState
    }

-- Estado inicial da nave do jogador, no centro da tela
initialPlayerState :: Player
initialPlayerState = Player $ Body {bodyPos=(400, 300), bodyAngle=pi/4.0}

-- Lista de todas as linhas que o GameState irá renderizar
stateLines :: GameState -> [LineSegment]
stateLines = lineSegments . statePlayer
