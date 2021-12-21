{- Introducing myself to funflow by using it to create a very basic data cleaner, on the pattern of the WordCount example.

First importing the same libraries as in the example, since we'll need to work on text. -}

{-# LANGUAGE Arrows #-}
{-# LANGUAGE OverloadedStrings #-}

import System.IO 

import Data.List (sortBy)
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Ord (comparing)
import Data.Csv (encode, decode, HasHeader(..))
import qualified Data.Text.IO as T
import qualified Data.Text as T
import Text.Printf (printf)
import Text.Regex.Posix ((=~))

import Funflow

{- PIPELINE DEFINITION 
    
We divide our pipeline into three sections: 
    * Read the input CSV file
    * Clean the data columns of the input CSV file
    * Rejoin and write data as CSV

Each of these tasks will be a `Flow` in and of itself, and in the end we'll compose them into a `Flow` DAG. 

Okay, what's a flow? Quoting from the library documentation:

"Flow is the main type of Funflow.
It is a task that takes an input value of type `input` and produces an output value of type `output`."-}

{- READING IN INPUT CSV

Let's write the `Flow` for reading in the input CSV file.
-}


readCSV :: String -> IO ([[String]])
readCSV filename = do 
    file <- openFile filename ReadMode
    contents <- hGetContents file
    case (decode NoHeader contents) of
        Left _ -> error $ "File not readable"
        Right xs -> return xs 


main = do 
    contents <- readCSV "/home/shared/Data/feverous/infotabs_from_feverous.tsv"
    print contents

