
import Control.Monad (forM_)
import System.Process (readProcessWithExitCode)
import System.Exit (ExitCode(..))

main :: IO ()
main = do
  putStrLn "Executing tests..."
  forM_ cases $ \(name, time, cmd, cmdArgs, expected) -> do
    putStrLn $ "Running test " ++ name
    (exitCode, stdout, stderr) <- readProcessWithExitCode waitCmd ([show time, cmd] ++ cmdArgs) []
    let actual = (exitCode, stdout, stderr)
    if actual == expected
      then putStrLn "Test passed!"
      else do
        putStrLn "Test failed!"
        putStrLn $ "Expected: " ++ show expected
        putStrLn $ "Actual: " ++ show actual

-- FIXME: It needs to be a relative path, and it needs to be contemplated by nix
waitCmd :: String
waitCmd = ""

cases :: [(String, Int, String, [String], (ExitCode, String, String))]
cases = []
  -- [ ("Success", 2, "sleep", ["1"], (ExitSuccess, "Process exited successfully!\n", ""))
  -- , ("Timeout", 1, "sleep", ["2"], (ExitFailure 15, "", "Time is up!\n"))
  -- , ("Failure", 2, "false", [], (ExitFailure 1, "", ""))
  -- ]