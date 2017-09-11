module Modules.Callbacks where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Modules.Render (LineRenderable(..))

-- renderiza a viewport com o renderizador e buffers disponíveis
renderViewport :: LineRenderable r => r -> IO ()
renderViewport r = do
    clear [ColorBuffer]
    render r
    swapBuffers
