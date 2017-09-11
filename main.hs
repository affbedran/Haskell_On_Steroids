import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

main = do
    initializeWindow
    initializeOpenGL
    initializeCallbacks

    mainLoop
