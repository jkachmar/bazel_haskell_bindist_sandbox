module Entrypoint (app) where

import RIO

app :: RIO ()
app = logInfo "Hello from RIO in `rules_haskell`"
