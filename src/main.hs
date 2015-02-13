{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import qualified Network.HTTP.Types as HTTP
import qualified Data.Map           as Map

main = scotty 3000 $ do
  get "/" $
    json ("Hello, world!" :: String)

  notFound $ do
    status HTTP.status404
    json $ strMap [("error", "Resource not found!")]

strMap :: [(String, String)] -> Map.Map String String
strMap = Map.fromList
