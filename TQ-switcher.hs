-- Titan Quest mod switcher
-- For TQIT and Soulvizier
import System.Directory

tqFilePath = "C:\\Program Files (x86)\\Steam\\SteamApps\\common\\"
normalName = "Titan Quest Immortal Throne"
soul = "TQIT-Soulvizier"
tqit = "TQIT-Normal"

main :: IO()
main = do
    setCurrentDirectory tqFilePath
    dir <- getDirectoryContents "."
    change dir

change :: [String] -> IO()
change dir = do
    if soul `elem` dir 
        then do
            renameDirectory normalName tqit
            renameDirectory soul normalName
            print "Loaded Soulvizier"
            getChar
            return ()
        else do
            renameDirectory normalName soul
            renameDirectory tqit normalName
            print "Loaded Immortal Throne"
            getChar
        return ()