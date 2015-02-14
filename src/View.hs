{-# LANGUAGE OverloadedStrings #-}
module View where

import Web.Scotty
import qualified Network.HTTP.Types as HTTP

import qualified Data.Char as Char
import qualified Data.Map  as Map

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



strMap :: [(String, String)] -> Map.Map String String
strMap = Map.fromList
