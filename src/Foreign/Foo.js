'use strict'

exports.greetImpl = name => `Hello ${name}!`

exports.numImpl = s => parseInt(s, 10)

exports.getName = obj => obj.name

exports.giveName = name => ({name})

class Cat {
  constructor(name) {
    this._name = name
  }

  makeNoise() {
    return `Meow! (I'm ${this._name})`
  }
}

exports.createCat = name => new Cat(name)

exports.makeNoise = cat => cat.makeNoise()

exports._echoAsync = name => () =>
  new Promise(resolve =>
    setTimeout(() => { resolve(`Hello ${name}!`) }, 10)
  )

exports.greetCallback = getName => `Hello ${getName()}!`

exports.greetCallbackOut = name => _ => `Hello ${name}!`

exports.add = numbers => numbers.reduce((res, n) => res + n, 0)

exports.produceNumbers = n => [...new Array(n)].map((_, i) => i + 1)
