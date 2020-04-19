module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)
import Euler (answer)
import Foreign.Foo (greetImpl, numImpl)

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "Euler" do
    it "Euler" do
      answer `shouldEqual` 233168

  describe "Foreign" do
    it "string" do
      "Hello World!" `shouldEqual` greetImpl "World"

    it "number" do
      4.0 `shouldEqual` numImpl "4"
