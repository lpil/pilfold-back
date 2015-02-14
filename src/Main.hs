{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Network.Wai.Middleware.RequestLogger

import View

pilfoldBackend :: ScottyM ()
pilfoldBackend = do
  middleware logStdoutDev

  get "/"      View.helloWorld
  get "/:name" View.helloYou
  notFound     View.showError


main :: IO ()
main = scotty 3000 pilfoldBackend
