
let randomNumber = Int.random(in: -100...100)
let randomNumber1 = Int.random(in: 0..<10)

let randomDouble = Double.random(in: 0...2)
let boolRandom = Bool.random()

let randomNumber2 = Int.random(in: Int.min...Int.max)

let numbers = [100, -10, 0 , 1]
let randomElement = numbers.randomElement()
let zeroArray: [Int] = []
let randomZero = zeroArray.randomElement()

let shuffledArray = numbers.shuffled()
var array = numbers
array.shuffle()

let random = (1000..<2000).randomElement()

struct A {
    let b: Int
}

let a = A(b: 12)

///---


class Animal {
    let name: String
    var age: Int
    var master: String?

    init(name: String, age: Int, master: String? = nil) {
        self.name = name
        self.age = age
        self.master = master
    }
    
    func makeSound() {
        print("?")
    }
    
    class func printInfo() {
        print("This is animal.")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Bow")
    }
    
    override class func printInfo() {
        print("Dog likes swimming.")
    }
}

let dog = Dog(name: "Hop", age: 2)
dog.makeSound()
Dog.printInfo()

class Cat: Animal {
//    var isSleeping = true
    var isSleeping: Bool
    
    override init(name: String, age: Int, master: String? = nil) {
        self.isSleeping = true

        super.init(name: name, age: age, master: master)
    }
    
    override func makeSound() {
        super.makeSound()
        print("Meow")
    }
    
    override class func printInfo() {
        super.printInfo()
        print("Cats don't like swimming.")
    }
}

let cat = Cat(name: "Garfield", age: 5)
cat.makeSound()
//cat.printInfo()
Cat.printInfo()


///----

struct ValueType {
    var data: Int = 0
}

var a1 = ValueType()
var b1 = a1

b1.data = 20
print("a1 = \(a1.data) b1 = \(b1.data)")

class RefType {
    var data: Int = 0
}


var a2 = RefType()
var b2 = a2

b2.data = 20
print("a2 = \(a2.data) b2 = \(b2.data)")


///---

class IntNumber {
    var value: Int {
        willSet {
            print("Will set new value \(newValue)")
        }
        didSet {
            print("New value: \(value). Previous value: \(oldValue)")
        }
    }
    
    
    var double: Int {
        return value * value
    }
    
    init(value: Int) {
        self.value = value
    }
}

let number0 = IntNumber(value: 4)
number0.double
number0.value = 20
