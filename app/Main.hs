module Main where

import Data.Char (isDigit)
import Lib (wait)
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    (time : cmd : cmdArgs) | all isDigit time -> wait (read time) cmd cmdArgs
    _ -> putStrLn help

help :: String
help =
  mconcat
    [ "Usage: wait <time> <command> <args>\n",
      "  <time>      Time in seconds to wait for the command to finish.\n",
      "  <command>   Command to execute.\n",
      "  <args>      Arguments to pass to the command.\n",
      "\n",
      "Example: wait 2 sleep 1\n",
      "  This will wait for 2 seconds for the command 'sleep 1' to finish.\n"
    ]
