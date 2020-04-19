module Foreign.Foo where

foreign import greetImpl :: String -> String

foreign import numImpl :: String -> Number

foreign import getName :: { name :: String } -> String

foreign import giveName :: String -> { name :: String }
