{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Network.Wai.Middleware.RequestLogger
import qualified Network.HTTP.Types as HTTP

import qualified Data.Char as Char
import qualified Data.Map  as Map

main = scotty 3000 $ do
  middleware logStdoutDev
  get "/" $
    json ("Hello, world!" :: String)

  get "/:name" $ do
    name <- param "name"
    json ("Hello, " ++ name ++ "!" :: String)

  notFound $ do
    status HTTP.status404
    json $ strMap [("error", "Resource not found!")]

strMap :: [(String, String)] -> Map.Map String String
strMap = Map.fromList
