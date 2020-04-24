module Test.Function (spec) where

import Prelude

import Control.Monad.Error.Class (class MonadThrow)
import Effect.Exception (Error)
import Test.Spec (SpecT, describe, it)
import Test.Spec.Assertions (shouldEqual)

times10 :: Int -> Int
times10 = (*) 10

add3 :: Int -> Int
add3 = (+) 3

spec :: forall a b. Monad b => MonadThrow Error a => SpecT a Unit b Unit
spec =
  describe "Function" do
    it "uses composition" do
      (add3 <<< times10) 2 `shouldEqual` 23

    it "uses fmap" do
      (map add3 times10) 2 `shouldEqual` 23
