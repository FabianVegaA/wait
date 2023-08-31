module Lib (wait) where

import Control.Concurrent (threadDelay)
import System.Process (getProcessExitCode, spawnProcess, terminateProcess)

wait :: Int -> FilePath -> [String] -> IO ()
wait time cmd cmdArgs = do
  handleProcess <- spawnProcess cmd cmdArgs
  timeout (time + 1) handleProcess
  where
    timeout 0 handleProcess = do
      putStrLn "Time is up!"
      terminateProcess handleProcess
    timeout n handleProcess = do
      exitCode <- getProcessExitCode handleProcess
      case exitCode of
        Nothing -> do
          threadDelay 1000000
          timeout (n - 1) handleProcess
        Just _ -> putStrLn "Process has finished!"
