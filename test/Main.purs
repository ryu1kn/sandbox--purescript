module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec (describe, it, pending)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)
import Euler (answer)
import Foreign.Foo as F

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "Euler" do
    it "Euler" do
      answer `shouldEqual` 233168

    pending "a test in the future"

  describe "Foreign" do
    it "string" do
      F.greetImpl "World" `shouldEqual` "Hello World!"

    it "number" do
      F.numImpl "4" `shouldEqual` 4.0

    it "object - in" do
      F.getName { name: "Mike" } `shouldEqual` "Mike"

    it "object - out" do
      F.giveName "Mike" `shouldEqual` { name: "Mike" }

    it "custome object - out" do
      (F.makeNoise <<< F.createCat) "Tama" `shouldEqual` "Meow! (I'm Tama)"

    it "promise - out from js" do
      message <- F.echoAsync "World"
      message `shouldEqual` "Hello World!"
