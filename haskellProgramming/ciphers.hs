module Ciphers where

import Data.Char

ceasarsCipherChar :: Int -> Char -> Char
ceasarsCipherChar shift char = chr $ (ord char) + shift

