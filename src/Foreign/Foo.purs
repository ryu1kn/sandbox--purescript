module Foreign.Foo where

import Prelude

import Control.Promise (Promise, toAff)
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Aff (Aff)

foreign import greetImpl :: String -> String

foreign import numImpl :: String -> Number

foreign import getName :: { name :: String } -> String

foreign import giveName :: String -> { name :: String }

foreign import data Cat :: Type

foreign import createCat :: String -> Cat

foreign import makeNoise :: Cat -> String

foreign import _echoAsync :: String -> Effect (Promise String)

echoAsync :: String -> Aff String
echoAsync name = liftEffect (_echoAsync name) >>= toAff
