module Test.Euler where

import Prelude

import Control.Monad.Error.Class (class MonadThrow)
import Effect.Exception (Error)
import Euler (answer)
import Test.Spec (SpecT, describe, it)
import Test.Spec.Assertions (shouldEqual)

spec :: forall a b. Monad b => MonadThrow Error a => SpecT a Unit b Unit
spec =
  describe "Euler" do
    it "Euler" do
      answer `shouldEqual` 233168
