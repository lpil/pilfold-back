{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Network.Wai.Middleware.RequestLogger
import qualified Network.HTTP.Types as HTTP

import qualified Data.Char as Char
import qualified Data.Map  as Map


pilfoldBackend :: ScottyM ()
pilfoldBackend = do
  middleware logStdoutDev

  get "/"      helloWorld
  get "/:name" helloYou
  notFound     showError

strMap :: [(String, String)] -> Map.Map String String
strMap = Map.fromList


helloWorld :: ActionM ()
helloWorld = json ("Hello, world!" :: String)

helloYou :: ActionM ()
helloYou = do
    name <- param "name"
    json ("Hello, " ++ name ++ "!" :: String)

showError :: ActionM ()
showError = do
    status HTTP.status404
    json $ strMap [("error", "Resource not found!")]

main :: IO ()
main = scotty 3000 pilfoldBackend
