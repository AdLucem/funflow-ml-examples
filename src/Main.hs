{- Introducing myself to funflow by using it to create a very basic data cleaner, on the pattern of the WordCount example.

First importing the same libraries as in the example, since we'll need to work on text. -}

{-# LANGUAGE Arrows #-}
{-# LANGUAGE OverloadedStrings #-}

import Data.List (sortBy)
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Ord (comparing)
import qualified Data.Text.IO as T
import qualified Data.Text as T
import Text.Printf (printf)
import Text.Regex.Posix ((=~))

import Funflow

main = putStrLn "TODO"

