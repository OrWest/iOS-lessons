import UIKit

class Product {
    private var parts: [String] = []
    
    func add(part: String) {
        parts.append(part)
    }
    
    func printParts() -> String {
        return "Parts: \(parts.joined(separator: ", "))"
    }
}

protocol Builder {
    func producePartA()
    func producePartB()
    func producePartC()
}

class Builder1: Builder {
    
    private var product = Product()
    
    private func reset() {
        product = Product()
    }
    
    func producePartA() {
        product.add(part: "PartA")
    }
    
    func producePartB() {
        product.add(part: "PartB")
    }
    
    func producePartC() {
        product.add(part: "PartC")
    }
    
    func getProduct() -> Product {
        let temp = product
        reset()
        return temp
    }

}

class Director {
    private var builder: Builder
    
    init(builder: Builder) {
        self.builder = builder
    }
    
    func updateBuilder(_ builder: Builder) {
        self.builder = builder
    }
    
    func getMinimalProduct() {
        builder.producePartA()
    }
    
    func getFullProduct() {
        builder.producePartA()
        builder.producePartB()
        builder.producePartC()
    }
}

class CarBuilder: Builder {
    private var carParts: [String] = []
    
    func producePartA() {
        carParts.append("Кузов")
    }
    
    func producePartB() {
        carParts.append("Колеса")
    }
    
    func producePartC() {
        carParts.append("Двигатель")
    }
    
    func getCar() -> Product {
        let car = Product()
        carParts.forEach { car.add(part: $0) }
        return car
    }
}

//let builder = Builder1()
//let director = Director(builder: builder)
//
//director.getMinimalProduct()
//print(builder.getProduct().printParts())
//
//director.getFullProduct()
//print(builder.getProduct().printParts())
//
//let carBuilder = CarBuilder()
//director.updateBuilder(carBuilder)
//
//director.getFullProduct()
//print(carBuilder.getCar().printParts())


protocol Observer: class {
    func update(subject: Subject)
}

class Subject {
    
    var number = Int.random(in: 0..<Int.max) {
        didSet {
            print("Subject: Number changed: \(number) from: \(oldValue)")
            notify()
        }
    }
    
    private var observers: [Observer] = []
    
    func attach(_ observer: Observer) {
        print("Subject: Observer was attached.")
        observers.append(observer)
    }
    
    func detach(_ observer: Observer) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
            print("Subject. Observers was detached")
        }
    }
    
    private func notify() {
        print("Subject: Notifying observers...")
        observers.forEach { $0.update(subject: self) }
    }
    
    func someLogic() {
        print("Subject: DO some logic")
        number = Int.random(in: 0..<Int.max)
    }
}

class ObserverA: Observer {
    func update(subject: Subject) {
        if subject.number % 2 == 0 {
            print("ObserverA: Chetniy")
        }
    }
}

class ObserverB: Observer {
    func update(subject: Subject) {
        if subject.number % 3 == 2 {
            print("ObserverB: NEChetniy")
        }
    }
}

class ObserverC: Observer {
    func update(subject: Subject) {
        if subject.number > Int.max / 2 {
            print("ObserverC: Big value")
        }
    }
}

//let subject = Subject()
//
//let observers: [Observer] = [
//    ObserverA(),
//    ObserverB(),
//    ObserverC(),
//    ObserverC(),
//    ObserverC()
//]
//
//observers.forEach { subject.attach($0) }
//
//for _ in 0..<10 {
//    subject.someLogic()
//}
//
//subject.detach(observers[0])
//subject.detach(observers[1])
//
//for _ in 0..<3 {
//    subject.someLogic()
//}
//
//print("END")

class ViewController {
    let id: String
    
    init(id: String) {
        self.id = id
        
        observePost()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func observePost() {
        NotificationCenter.default.addObserver(self, selector: #selector(messageReceived(_:)), name: .post, object: nil)
    }
    
    @objc
    private func messageReceived(_ notification: Notification) {
        guard let message = notification.object as? String else {
            return
        }
        
        print("\(id): Message received: \(message)")
    }
}

extension Notification.Name {
    static let post = Notification.Name("Post")
}

class Poster {
//    static let postNotifName = Notification.Name("Post")
    
    func sendMessage(text: String) {
        print("Going to send message: \(text)")
        NotificationCenter.default.post(name: .post, object: text)
    }
}

let poster = Poster()

poster.sendMessage(text: "Hello everyone!")

let vc1 = ViewController(id: "1")
let vc2 = ViewController(id: "2")
let vc3 = ViewController(id: "3")

poster.sendMessage(text: "Hello everyone!(2)")

