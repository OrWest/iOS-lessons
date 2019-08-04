
import Foundation

func printSome() {
    
}
// () -> Void

func printInt(_ number: Int) {
    
}
// (Int) -> Void

func printSomeNum(number: Int) -> String {
    return ""
}
// (Int) -> String

func ppp(_ l: Int) -> String {
    return "aaa"
}

print(printSomeNum)

let function = printSomeNum
var function2: (Int) -> String = printSomeNum
function2(12)
function2 = ppp
function2(12)

let names = ["Петя", "Марта", "Алекс"]
names.sorted()

func compare(_ first: String, _ second: String) -> Bool {
    return first < second
}

names.sorted(by: compare)

var reversedNames = names.sorted(by: {
    (s1: String, s2: String) -> Bool in
    return s1 < s2
})

reversedNames = names.sorted(by: { s1, s2 in return s1 < s2 })
reversedNames = names.sorted(by: { s1, s2 in s1 < s2 })
reversedNames = names.sorted(by: { $0 < $1 })
reversedNames = names.sorted(by: <)

func someFunc(closure: () -> Void) {
    closure()
}

someFunc(closure: { print(123) })

someFunc() {
    print(234)
}

someFunc {
    print(345)
}

func someFunc2(_ num: Int, closure: () -> Void) {
    closure()
}

someFunc2(12, closure: { print(1) })
someFunc2(12) { print(2) }

class SomeClass {
    let someBlock: () -> Void
    
    init(block: @escaping () -> Void) {
        self.someBlock = block
    }
}

let someClass = SomeClass(block: { print("Some class") })
someClass.someBlock()

var a = 10

let block = {
    a += 2
}

block()
block()
block()
block()
block()
print(a)

let block2: (Int) -> Int = { $0 + $0 }

/*
 Задание1:
 Сгенерировать массив 20 случайных чисел (0..<100) и отсортировать его.
 
 Задание2:
 Создать два блока, которые будут возводить Int параметр во 2-ую и 3-юю степени соответственно.
 Тип.
 Блоки сложить в массив.
 После для массива чисел 2,3,4,5 нужно каждое из них передать в эти два блока и вывести результат.
 */

///---

let names2 = ["Jenny", "Petr", "Jason, Alexander"]
let jCount = names.map { $0.first! }.filter { $0 == "J" }.count

var evens = [Int]()
for i in 1...10 {
    if i % 2 == 0 {
        evens.append(i)
    }
}
print(evens)

evens = Array(1...10).filter { $0 % 2 == 0 }

let sum = evens.reduce(100) { $0 + $1 }
let sum2 = evens.reduce(0, +)
let strings = names.reduce("Names: Alladin") { $0 + ", " + $1 }
print(strings)

let counts = names.map { $0.count }
print(counts)

struct Person {
    let name: String
}

let counts1 = names.map { name -> Int in
    return name.count
}

let persons = names.map { Person(name: $0) }
print(persons)

let persons1 = names.map(Person.init)
print(persons1)

var nilNames: [String?] = names
nilNames.insert(nil, at: 2)
nilNames.insert(nil, at: 4)
nilNames.insert(nil, at: 0)
print(nilNames)

let namesss = nilNames.compactMap { $0 }
print(namesss)

let numbers = [10, 1, 12]
numbers.first!
numbers.last!

if let nonEven = numbers.first(where: { $0 % 2 == 1 }) {
    print("There is non even: \(nonEven)")
} else {
    print("No one non even")
}

/*
 Задание1:
 Имеется массив чисел. Нужно получить новый массив где каждое число возведено в квадрат.
 
 Задание2:
 Есть массив слов. Новый массив должен иметь только слова с количеством букв больше 3.
 
 Задание3:
 Имеется массив строк. Нужно получить массив чисел из этих строк.
 */

///---

//subscript(index: Int) -> Int {
//    get {
//        // вернуть подходящее значение
//    }
//    set(newValue) {
//        // выполнить подходящие действия по установке значения
//    }
//}

//subscript(index: String) -> Person {
//    get {
//        // вернуть подходящее значение
//    }
//    set(newValue) {
//        // выполнить подходящие действия по установке значения
//    }
//}
//
//person[1]
//person["Some name"]

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

let someValue = matrix[1, 1]

/*
 Написать структуру Multyplier, который содержит в себе число.
 Сабскриптом возводить это число в степень, которая передается в скобках.
 pow(x, y)
 */

///---

var date = Date()
print(date)

let minute: TimeInterval = 60.0
let hour: TimeInterval = minute * 60
let day: TimeInterval = hour * 24

let tenMinutesAge = Date(timeIntervalSinceNow: -10 * minute)
print(tenMinutesAge)

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .short
print(dateFormatter.string(from: date))

dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full
print(dateFormatter.string(from: date))

dateFormatter.dateStyle = .none
dateFormatter.timeStyle = .medium
print(dateFormatter.string(from: date))

dateFormatter.dateFormat = "YY...dd...MM"
print(dateFormatter.string(from: date))
dateFormatter.dateFormat = nil

dateFormatter.dateStyle = .medium
dateFormatter.locale = Locale(identifier: "ru-ru")
print(dateFormatter.string(from: date))

let timeZoneZero = TimeZone(secondsFromGMT: 0)
dateFormatter.timeZone = timeZoneZero
print(dateFormatter.string(from: date))

var dateComponents = DateComponents()
dateComponents.year = 2019
dateComponents.month = 9
dateComponents.day = 1
dateComponents.hour = 13
dateComponents.minute = 8
dateComponents.second = 10
print(dateComponents.isValidDate)
dateComponents.calendar = Calendar.current
print(dateComponents.isValidDate)
date = dateComponents.date!
dateFormatter.timeZone = TimeZone.current
print(dateFormatter.string(from: date))

dateComponents.day! += 5
print(dateFormatter.string(from: dateComponents.date!))

let currentDay = Calendar.current.component(.day, from: Date())

let components = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
print("\(components.hour!):\(components.minute!):\(components.second!)")

let between = Calendar.current.dateComponents([.minute], from: Date(), to: date)
print(between.minute!)

/*
 Задание1:
 Вывести дату, которая будет через 24 часа через DateFormatter
 
 Задание2:
 Вывести Ваш возраст через DateComponents.
 */
