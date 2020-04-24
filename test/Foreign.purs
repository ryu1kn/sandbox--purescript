module Test.Foreign where

import Prelude

import Effect.Aff (Aff)
import Test.Spec (SpecT, describe, it, pending)
import Test.Spec.Assertions (shouldEqual)
import Foreign.Foo as F

spec :: forall a. Monad a => SpecT Aff Unit a Unit
spec =
  describe "Foreign" do
    it "string" do
      F.greetImpl "World" `shouldEqual` "Hello World!"

    it "number" do
      F.numImpl "4" `shouldEqual` 4.0

    it "object - in" do
      F.getName { name: "Mike" } `shouldEqual` "Mike"

    it "object - out" do
      F.giveName "Mike" `shouldEqual` { name: "Mike" }

    pending "custome object - in"

    it "custome object - out" do
      (F.makeNoise <<< F.createCat) "Tama" `shouldEqual` "Meow! (I'm Tama)"

    it "promise - out from js" do
      message <- F.echoAsync "World"
      message `shouldEqual` "Hello World!"

    it "function - in" do
      F.greetCallback (\x -> "World") `shouldEqual` "Hello World!"

    it "function - out" do
      let greet = F.greetCallbackOut "World"
      greet "anything" `shouldEqual` "Hello World!"

    it "function - out, auto currying" do
      F.greetCallbackOut "World" "anything" `shouldEqual` "Hello World!"

    pending "undefined - out"
    pending "null - out"

    it "array - in" do
      F.add [1, 2, 3] `shouldEqual` 6

    it "array - out" do
      F.produceNumbers 3 `shouldEqual` [1, 2, 3]
