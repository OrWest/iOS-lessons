
let weather = (21, "Солнечно")

let (temp, weath) = weather

print(temp)
print(weath)

let (temp1, _) = weather

weather.1
weather.0

let weather1 = (temp2: 21, weather: "Солнечно")

print(weather1.temp2)

let floats: (Float, Float) = (2.15, 2.0)

///----

1 + 2
2.5 + 2.5
10 - 2
10.0 / 2.5
1234 * 9878

"123 " + "abc"

2.5 + 100

10.0 / 4.0

let ten = 10

Double(ten) / 2.5

//"123" + 123
"123\(123 + 123)abc"
"123" + String(123) + "abc"

Int("123")! + 123

10 % 3
10 / 3

-10 / 3
-15 % 4

-ten
-10

let minusTen = -10
-minusTen

+10
+minusTen

10 == 12
10 == 10

10 != 12
2 > 1
1 >= 1
2 >= 1
1 <= 1
1 < 2

!true
!(2 == 2)
2 != 2

1 + 2 * 3
(1 + 2) * (2 + 3)

var a = 10
a = a + 2
a += 2
a *= 2
a -= 4

//---

let longArray: Array<Int>
let shortArray: [Int] = [1]
//shortArray = [2]

var array = [String]()
var array1: [Int] = []
var array2: [Int] = [1, 2, 0, -10]
var array3 = [1, 2]
array3 = [1]

array = Array(repeating: "ss", count: 10000)

let s1 = array[3]
array[3] = "String"

array1.append(1)
array1.append(-100)
array1.append(contentsOf: [0, 2])
array1 = array1 + array1
array1.remove(at: 1)
array1.insert(-100, at: 1)
print(array1)

print(!array1.isEmpty)
array1.count
array1.contains(1)

let letters: Set<String> = []

var letters1: Set<String> = ["a", "c", "z"]
letters1.insert("b")
letters1.insert("y")
letters1.insert("y")
print(letters1)
letters1.isEmpty
letters1.contains("c")
letters1.contains("d")
letters1.count

let currency1: Dictionary<String, String>
var currency2: [String : String]
var currencySymbols = [
    "USD" : "$" ,
    "EUR" : "E"
]
currencySymbols["USD"]
currencySymbols["USD"] = "A"
currencySymbols["USSD"] = "B"
print(currencySymbols)
currencySymbols.removeValue(forKey: "USSD")

//---


var temperature = -5
if temperature <= 5 {
    print("Холодно")
}


temperature = 12
if temperature <= 5 {
    print("Холодно")
} else {
    print("Не особо холодно")
}

temperature = 10
if temperature <= 5 {
    print("Холодно")
} else if temperature > 20 {
    print("Мороженное")
} else {
    print("Не особо холодно")
}

let char: Character = "b"
switch char {
    case "a": print("a")
    case "b": print("b")
    case "c": print("c")
    case "d": break
    default: break
}

let studying = true
switch studying {
    case true: print(1)
    case false: print(2)
}

for number in [1, 2 ,6, -1, 10] {
    print(number * number)
}

for (abbr, symbol) in currencySymbols {
    print("My name: \(abbr). Number: \(symbol)")
}

for number in 1...10 {
    print(number)
}

for a in 1...2 {
    for b in 1...10 {
        print("\(a)\t*\t\(b)\t=\t\(a * b)")
    }
}

for _ in 1...3 {
    print(a)
}

var number = -10
while number < 0 {
    number += 2
}

number = 2
repeat {
    number += 3
} while number < 0
print(number)

//----

func printHello() {
    print("Hello-12")
}

printHello()
printHello()
printHello()
printHello()
printHello()
printHello()
printHello()
printHello()
printHello()

func sum(a: Int, b: Int) -> Int {
    return a + b
}

sum(a: 2, b: 3)

func printSum(a: Int, b: Int) {
    print(a + b)
}

//func printSum(a: Int, b: Int) -> Void {
//    print(a + b)
//}

printSum(a: 2, b: 5)

let aaaa = sum(a: 2, b: 5)
let bbb = sum(a: aaaa, b: aaaa)

func minMax(array: [Int]) -> (min: Int, max: Int) {
    let min = array.min()!
    let max = array.max()!
    
    return (min, max)
}
let minmax = minMax(array: [1,2,3,4,5])
print(minmax)


func someFunc(func name: String) {
    print(name)
}

someFunc(func: "aaa")


func someFunc1(_ name: String) {
    print(name)
}

someFunc1("aaa")

func someFunc2(_ name: String = "abc") {
    print(name)
}

someFunc2()
