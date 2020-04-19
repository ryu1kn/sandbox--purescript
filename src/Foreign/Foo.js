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
    return "Meow! (I'm " + this._name + ')'
  }
}

exports.createCat = name => new Cat(name)

exports.makeNoise = cat => cat.makeNoise()
