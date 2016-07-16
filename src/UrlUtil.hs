{-# OPTIONS_GHC -Wall #-}

module UrlUtil where

import           System.Environment

readToken :: IO String
readToken = do
  mToken <- lookupEnv "BOT_TOKEN"
  maybe (putStrLn "Please assign token to 'BOT_TOKEN' environment variable!" >> return "BOT_TOKEN") return mToken

composeUrl :: String -> IO String
composeUrl url = do
  t <- readToken
  return ("https://api.telegram.org/bot" ++ t ++ "/" ++ url)

getMeUrl :: IO String
getMeUrl = composeUrl "getMe"
