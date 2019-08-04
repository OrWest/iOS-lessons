import Foundation

enum VendingMachineError: Error {
    case invalidSelection
    case insuffucuentFunds(coinsNeeded: Int)
    case outOfStock
}

//throw VendingMachineError.insuffucuentFunds(coinsNeeded: 12)

//func canThrowErrors() throws -> String

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar" : Item(price: 12, count: 7),
        "Chips" : Item(price: 10, count: 4),
        "Sweets" : Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemName name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insuffucuentFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Purchased: \(name)")
    }
}

let favouriteSnacks = [
    "Alice" : "Chips",
    "Nikita" : "Sweets"
]


func buyFavouriteSnacks(personName: String, machine: VendingMachine) throws {
    let snackName = favouriteSnacks[personName] ?? "Candy Bar"
    try machine.vend(itemName: snackName)
}

var machine = VendingMachine()
machine.coinsDeposited = 12
try buyFavouriteSnacks(personName: "Nikit", machine: machine)

struct PurchasedSnack {
    let name: String
    let price: Int
    
    init(name: String, machine: VendingMachine) throws {
        try machine.vend(itemName: name)
        self.name = name
        self.price = machine.inventory[name]!.price
    }
}

machine.coinsDeposited = 8
let name = "Nikita"
do {
    try buyFavouriteSnacks(personName: name, machine: machine)
} catch {
    print(123)
}

do {
    try buyFavouriteSnacks(personName: "Nikit", machine: machine)
} catch {
    print(error)
}

do {
    try buyFavouriteSnacks(personName: "Nikit", machine: machine)
} catch VendingMachineError.invalidSelection {
    print("Invalid selection")
} catch VendingMachineError.outOfStock {
    print("Out of stock")
} catch VendingMachineError.insuffucuentFunds(let coins) {
    print("Not enough coins: \(coins) need")
} catch {
    print("?")
}

func someThrows() throws -> Int {
    throw VendingMachineError.outOfStock
}

let x: Int? = try? someThrows() // nil

let y: Int?
do {
    y = try someThrows()
} catch {
    y = nil
}

//func fetchData() -> Data? {
//    if let data = try? fetchDataFromDisk() {
//        return data
//    }
//    if let data = try? fetchDataFromServer() {
//        return data
//    }
//    return nil
//}

//let x1: Int = try! someThrows() // nil

/*
 Задание1:
 Функция, которая преобразует строку в числе. Если у нее не получается это сделать, то она должна кинуть исключение.
 
 Задание2:
 Обработать это исключение через do-catch, try?, try!
 
 Задание3:
 Написать функцию, которая проверяет число на некоторые условия. Число не негативное, число не ноль, число не меньше 10, число не более 23, число делится на 3 без остатка.
 На каждый случай кидать исключение, где в каждом case будут дополнительные параметры для построения сообщения, например.
 Исключение .moreThenLimit(46) -> "Число 46 больше, чем лимит 23"
 */


///---

public class SomePublicClass {
    
}

class SomeInternalClass {
    
}

fileprivate class SomeFilePrivateClass {
    
}

private class SomePrivateClass {
    
}

public var somePublicVariable = 0
let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

public class SomePublicClass2 {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}

//let aaa = SomePublicClass2()
//aaa.somePrivateMethod()

/*
 Задание:
 Написать класс, который будет принимать в конструктор числа, сохранять их в приватных константах. Будет приватныe арифметические методы. Еще один метод будет вызывать случайно один из арифметических методов и выводить результат.
 */
