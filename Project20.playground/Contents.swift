import UIKit

//DispatchQueue.global().sync {
//    print("Sync")
//}
//print("After")
//DispatchQueue.global().async {
//    sleep(1)
//    print("Async")
//}
//print("After 2")

let serialQueue = DispatchQueue(label: "Ser q")
//serialQueue.async { print("Ser 1") }
//serialQueue.async { print("Ser 2") }
//serialQueue.async { print("Ser 3") }
//serialQueue.async { print("Ser 4") }
//serialQueue.async { print("Ser 5") }
//serialQueue.sync { print("Serial completed") }

let concurrentQueue = DispatchQueue(label: "Conc q", qos: .default, attributes: [.concurrent], autoreleaseFrequency: .never, target: nil)
//concurrentQueue.async { print("Ser 1") }
//concurrentQueue.async { print("Ser 2") }
//concurrentQueue.async { print("Ser 3") }
//concurrentQueue.async { print("Ser 4") }
//concurrentQueue.async { print("Ser 5") }
//concurrentQueue.sync { print("Serial completed") }

//for i in 0..<10 {
//    DispatchQueue.global(qos: .background).async { print("\(i) Background") }
//}
//
//for i in 0..<10 {
//    DispatchQueue.global(qos: .utility).async { print("\(i) Utility") }
//}
//
//for i in 0..<10 {
//    DispatchQueue.global(qos: .userInitiated).async { print("\(i) User initiated") }
//}
//
//for i in 0..<10 {
//    DispatchQueue.global(qos: .userInteractive).async { print("\(i) User Interactive") }
//}

//DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(300)) {
//    print("WORK")
//}

var a = 1
serialQueue.async {
    print("\(a)+1")
    a += 1
}
serialQueue.async {
    print("\(a)+2")
    a += 2
}
serialQueue.async {
    print("\(a)+3")
    a += 3
}
serialQueue.sync {
    print("\(a)+4")
    a += 4
}
print(a)

