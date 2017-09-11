module Modules.Player (Player(..)) where

import Modules.Geometry
import Modules.Render (LineRenderable(..))

-- estrutura de dados que armazena o estado atual do jogador.
data Player = Player {playerPos :: Vec2}
