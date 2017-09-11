module Modules.Initialize where

import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

import Modules.State (initialGameState)
import Modules.Callbacks

-- Inicializa a Janela do jogo
initializeWindow = do
    _ <- getArgsAndInitialize
    initialWindowSize  $= Size 800 600
    initialDisplayMode $= [DoubleBuffered]
    createWindow "Asteroids - Haskell on Steroids"

-- Inicializa os parametros do OpenGL
initializeOpenGL = do
    depthMask $= Disabled
    -- Suavizador de linhas do OpenGL
    lineSmooth  $= Enabled
    blend       $= Enabled
    blendFunc   $= (SrcAlpha,OneMinusSrcAlpha)
    lineWidth   $= 2.0

    -- viewport
    viewport   $= (Position 0 0, Size 800 600)

    -- Ajuste de renderização ortogonal
    matrixMode $= Projection
    loadIdentity
    ortho 0 800 600 0 (-1) 1
    matrixMode $= Modelview 0
    loadIdentity

    -- Ajuste da cor de Background
    clearColor $= Color4 0.0 0.0 0.1 1.0

-- Inicializar GLUT
initializeCallbacks = do
    displayCallback $= renderViewport initialGameState
