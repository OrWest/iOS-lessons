import UIKit

//let imgURL1 = URL(string: "https://cdn.blueswandaily.com//2019/08/iStock-971053374-2000x1200.jpg")!
//let imgURL2 = URL(string: "https://asianwaytravel.com/wp-content/uploads/2018/12/ban-gioc-waterfall-2.jpg")!
//let imgURL3 = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Stourhead_Pantheon.jpg/1024px-Stourhead_Pantheon.jpg")!
//
//let group = DispatchGroup()
//
//var img1: UIImage?
//var img2: UIImage?
//var img3: UIImage?
//
//group.enter() // +1
//DispatchQueue.global().async {
//    let start = DispatchTime.now()
//    img1 = UIImage(data: try! Data(contentsOf: imgURL1))
//    group.leave() // -1
//    let end = DispatchTime.now()
//    let elapsedTime = Double(end.uptimeNanoseconds - start.uptimeNanoseconds)*1e-9
//    print("Image1 downloaded in: \(elapsedTime) s")
//}
//
//group.enter() // +1
//DispatchQueue.global().async {
//    let start = DispatchTime.now()
//    img2 = UIImage(data: try! Data(contentsOf: imgURL2))
//    group.leave() // -1
//    let end = DispatchTime.now()
//    let elapsedTime = Double(end.uptimeNanoseconds - start.uptimeNanoseconds)*1e-9
//    print("Image2 downloaded in: \(elapsedTime) s")
//}
//
//group.enter() // +1
//DispatchQueue.global().async {
//    let start = DispatchTime.now()
//    img3 = UIImage(data: try! Data(contentsOf: imgURL3))
//    group.leave() // -1
//    let end = DispatchTime.now()
//    let elapsedTime = Double(end.uptimeNanoseconds - start.uptimeNanoseconds)*1e-9
//    print("Image3 downloaded in: \(elapsedTime) s")
//}
//
//print("Waiting...")
//let start = DispatchTime.now()
//group.notify(queue: .main) {
//    let end = DispatchTime.now()
//    let elapsedTime = Double(end.uptimeNanoseconds - start.uptimeNanoseconds)*1e-9
//    print("Code waited: \(elapsedTime) s")
//}

let queue = OperationQueue()

//let operation = {
//    sleep(1)
//    print(1)
//    print(2)
//    print(3)
//}
//
//queue.addOperation(operation)
//print("Started")
//queue.waitUntilAllOperationsAreFinished()
//print("Ended")

//var result: String?
//let concutOperation = BlockOperation {
//    result = "AAA" + "bbb"
//}
//
//concutOperation.start()
//print(result)

class SumOperation: Operation {
    //input
    let a: Int
    let b: Int
    
    //output
    var result: Int?
    
    init(_ a: Int, _ b: Int) {
        self.a = a
        self.b = b
    }
    
    override func main() {
        result = a + b
    }
}

//let sumOp1 = SumOperation(12, 100)
//sumOp1.start()
//print(sumOp1.result!)
//
//let sumop2 = SumOperation(123, 2)
//let sumop3 = SumOperation(10, 2)
//let sumop4 = SumOperation(1234, 23)
//let sumop5 = SumOperation(1, 0)
//let sumop6 = SumOperation(123412, 22)
//let sumop7 = SumOperation(12, 22)

//queue.addOperations([
//    sumop2,
//    sumop3,
//    sumop4,
//    sumop5,
//    sumop6,
//    sumop7
//], waitUntilFinished: true)
//
//print("2: \(sumop2.result!)")
//print("3: \(sumop3.result!)")
//print("4: \(sumop4.result!)")
//print("5: \(sumop5.result!)")
//print("6: \(sumop6.result!)")
//print("7: \(sumop7.result!)")

//queue.addOperation { print("1"); sleep(1) }
//queue.addOperation { print("2"); sleep(1) }
//queue.addOperation { print("3"); sleep(1) }
//queue.addOperation { print("4"); sleep(1) }
//queue.addOperation { print("5"); sleep(1) }
//queue.addOperation { print("6"); sleep(1) }
//queue.addOperation { print("7"); sleep(1) }
//queue.addOperation { print("8"); sleep(1) }
//queue.addOperation { print("9"); sleep(1) }
//
//queue.waitUntilAllOperationsAreFinished()

//queue.maxConcurrentOperationCount = 2
//
//queue.addOperation { print("1"); sleep(1) }
//queue.addOperation { print("2"); sleep(1) }
//queue.addOperation { print("3"); sleep(1) }
//queue.addOperation { print("4"); sleep(1) }
//queue.addOperation { print("5"); sleep(1) }
//queue.addOperation { print("6"); sleep(1) }
//queue.addOperation { print("7"); sleep(1) }
//queue.addOperation { print("8"); sleep(1) }
//queue.addOperation { print("9"); sleep(1) }
//
//queue.waitUntilAllOperationsAreFinished()

//let blockOper = BlockOperation {
//    print("-")
//}
//blockOper.qualityOfService = .userInteractive
//
//queue.addOperation { print("1"); sleep(1) }
//queue.addOperation { print("2"); sleep(1) }
//queue.addOperation { print("3"); sleep(1) }
//queue.addOperation { print("4"); sleep(1) }
//queue.addOperation { print("5"); sleep(1) }
//queue.addOperation { print("6"); sleep(1) }
//queue.addOperation { print("7"); sleep(1) }
//queue.addOperation { print("8"); sleep(1) }
//queue.addOperation { print("9"); sleep(1) }
//queue.addOperation(blockOper)
//
//queue.waitUntilAllOperationsAreFinished()

class AsyncOperation: Operation {
    enum State: String {
        case ready
        case executing
        case finished
        
        var keyPath: String {
            return "is" + rawValue.capitalized
        }
    }
    
    var state: State = .ready {
        willSet {
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
        }
        didSet {
            didChangeValue(forKey: state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }
    
    override var isReady: Bool {
        return state == .ready && super.isReady
    }
    
    override var isExecuting: Bool {
        return state == .executing
    }
    
    override var isFinished: Bool {
        return state == .finished || isCancelled
    }
}

class SumAsyncOperation: AsyncOperation {
    let a: Int?
    let b: Int?
    var result: Int?
    
    init(_ a: Int?, _ b: Int?) {
        self.a = a
        self.b = b
    }
    
    override func main() {
        guard !isCancelled else {
            state = .finished
            print("Cancelled.")
            return
        }
        
        state = .executing
        DispatchQueue.global().async {
            var dependResults = self.dependencies.compactMap { $0 as? SumAsyncOperation }.compactMap { $0.result }
            
            var a: Int? = self.a
            if a == nil && !dependResults.isEmpty {
                a = dependResults.removeFirst()
            }
            
            var b: Int? = self.b
            if b == nil && !dependResults.isEmpty {
                b = dependResults.removeFirst()
            }

            if let inputA = a, let inputB = b {
                self.result = inputA + inputB
            }
            
            print("Finished.")
            self.state = .finished
        }
    }
}

//let sum1 = SumAsyncOperation(12, 12)
//let sum2 = SumAsyncOperation(12, 13)
//let sum3 = SumAsyncOperation(12, 14)
//let sum4 = SumAsyncOperation(12, 15)
//
//queue.addOperation(sum1)
//queue.addOperation(sum2)
//queue.addOperation(sum3)
//queue.addOperation(sum4)
//
//sum4.cancel()

let sum1 = SumAsyncOperation(12, 12)
let sum2 = SumAsyncOperation(2, 3)
let sum3 = SumAsyncOperation(nil, 10)
let sum4 = SumAsyncOperation(nil, 12)

sum3.addDependency(sum1)
sum4.addDependency(sum2)
sum4.addDependency(sum3)

queue.addOperation(sum1)
queue.addOperation(sum2)
queue.addOperation(sum3)
queue.addOperation(sum4)

queue.waitUntilAllOperationsAreFinished()
//while queue.operationCount > 0 {
//    print(queue.operations)
//    sleep(1)
//}
print("Completed")
print("Result: Sum4 = \(sum4.result ?? -1)")
