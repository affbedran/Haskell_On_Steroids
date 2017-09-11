module Modules.Render (LineRenderable(..)) where

import Graphics.Rendering.OpenGL
import Modules.Geometry

-- objeto renderizável como coleção de linhas.
class LineRenderable r where
    lineSegments :: r -> [LineSegment]
    render :: r -> IO()
    render = renderLines . lineSegments

-- renderizando uma lista de segmentos com o OpenGL
renderLines :: [LineSegment] -> IO()
renderLines lns = do
    currentColor $= Color4 0.9 0.9 0.9 1.0
    renderPrimitive Lines $ mapM_ lineVertices lns

-- gerando os vértices de um segmento no OpenGL
lineVertices :: LineSegment -> IO ()
lineVertices (LineSegment (p,p')) = do
    ptVertex p
    ptVertex p'

-- | gerando um vértice OpenGL a partir de um único ponto.
ptVertex :: Vec2 -> IO ()
ptVertex = vertex . uncurry Vertex2
