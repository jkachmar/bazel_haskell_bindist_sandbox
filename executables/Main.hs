module Main where

import RIO.Simple.Prelude

import Entrypoint (app)

main :: IO ()
main = runSimpleApp app
