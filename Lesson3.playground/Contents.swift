
func sum(a: Int, b: Int) -> Int {
    return a + b
}

func sum(a: Int, b: Int, c: Int) -> Int {
    return a + b
}

func sum(number: Int...) -> Int {
    var sum = 0
    for a in number {
        sum += a
    }
    return sum
}

sum(number: 1,2,3,10,12,1,1,1,1,1,1)
sum(number: 1,2)

func printNumberIfPositive(_ number: Int) {
    guard number >= 0 else {
        print("Negative")
        return
    }
    
    print(number)
}

printNumberIfPositive(10)
printNumberIfPositive(-10)


let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
    print()
    print()
    print()
    print()
}
print(puzzleOutput)


let numberSymbol: Character = "三"  // Цифра 3 в упрощенном Китайском языке
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    print(1)
case "2", "٢", "二", "๒":
    break
case "3", "٣", "三", "๓":
    print(3)
case "4", "٤", "四", "๔":
    print(4)
default:
    break
}

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 1:
    description += "aaa"
default:
    description += " an integer."
}
print(description)

///--------

let allowedEntry = false
if !(allowedEntry) {
    print("Allowed")
}

let codeCorrect = true
let canBeOpened = false
if codeCorrect && canBeOpened {
    print("Door opened")
}

if codeCorrect || canBeOpened {
    print("Door")
}

if codeCorrect && (canBeOpened || allowedEntry) {
   print("123")
}

///---

let cloasedRange = 1...5
let range = 1..<5
let range2 = ..<5
let range3 = 3...

let array = [1,2,3,4,5,6,7,8,9]
print(array[3...])

///---

let temp = 20
switch temp {
case ..<0:
    print("negative")
case 0:
    print("zero")
case 1...:
    print("positive")
case 1..<5:
    print("1-4") // Не выполнится
default:
    print("Number?")
}

let somePoint = (10, 10) // (x, y)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
case let (x, y):
    print(x, y)
default:
    print("\(somePoint) is outside the box")
}

///---
let number: Int = 10
let nilNumber2: Optional<Int> = number
var nilNumber: Int? = nil

let intNumber: Int? = 13
let intNumber2: Int? = 10
if let number = intNumber, let number2 = intNumber2 {
    print(number)
}

if let number = intNumber {
    if let number2 = intNumber2 {
        print(number)
    }
}

let intNum: Int = intNumber!

let intNum1: Int! = 12

let int1: Int = intNum1

///---

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum CompassPoint1 {
    case north, south, east, west
}

let point = CompassPoint.south

if point == .south {
    print("Юг")
}

switch point {
case .north:
    print("N")
case .south:
    print("S")
case .east:
    print("E")
case .west:
    print("W")
}


switch point {
case .north:
    print("N")
case .south:
    print("S")
default:
    print("Other")
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

let barcode = Barcode.upc(10, 21212, 0, 111)
let barcode2 = Barcode.qrCode("abc")
switch barcode {
case .upc:
    print("upc")
case .qrCode:
    print("QR")
}

switch barcode {
case let .upc(a,b,_,d):
    print("upc", a,b,d)
case .qrCode(let a):
    print("QR \(a)")
}

enum CompassPointInt: Int {
    case north = 1
    case south = 2
    case east = 3
    case west = 4
}

enum Planet: String {
    case earth
}

let pointInt = CompassPointInt.north
print(pointInt.rawValue)
let eastInt = 3
let east = CompassPointInt(rawValue: eastInt)

if let number = east?.rawValue {
    print("Number = \(number)")
}

if let number = east {
    print("Number = \(number.rawValue)")
}

if let point = CompassPointInt(rawValue: 1) {
    print("Мы смотрим на \(point)")
} else {
    print("Не существует такого направления")
}

///---

struct MyDog {
    let name: String
    let type: String
    var age: Int
    
    init(name: String, type: String, dogAge: Int = 2) {
        self.name = name
        self.type = type
        age = dogAge
    }
    
    init(name: String) {
        self.name = name
        type = ""
        age = 0
    }
}

var myDog = MyDog(name: "Charly", type: "Hotdog")
print(myDog)
print("My dog is \(myDog.age) years old")
myDog.age = 4
print(myDog.age)

struct Dog {
    let name: String
    let type: String
    var age: Int = 0
    var master: String?
    var wellFed: Bool = false
    
    init(name: String, type: String) {
        self.name = name
        self.type = type
    }
    
    func makeSound() {
        print("Bow")
    }
    
    mutating func eatMeat(count: Int) {
        guard count > 2 else {
            return
        }
        
        wellFed = true
    }
    
    static func printInfo() {
        print("Dog has 4 lap")
    }
}

var dog = Dog(name: "My dog", type: "Type")
dog.makeSound()
print(dog.wellFed)
dog.eatMeat(count: 1)
print(dog.wellFed)
dog.eatMeat(count: 3)
print(dog.wellFed)

Dog.printInfo()
