
class MediaItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    let lenghtInMinutes: Int
    
    init(name: String, lenghtInMinutes: Int) {
        self.lenghtInMinutes = lenghtInMinutes
        
        super.init(name: name)
    }
}

class Song: MediaItem {
    let artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        
        super.init(name: name)
    }
}

let folder = [
    Movie(name: "Movie1", lenghtInMinutes: 64),
    Movie(name: "Movie2", lenghtInMinutes: 33),
    Song(name: "Song1", artist: "Artist1"),
    Song(name: "Song2", artist: "Artist2"),
    Movie(name: "Movie3", lenghtInMinutes: 42)
]

var movieCount = 0
var songCount = 0

for item in folder {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("Movies count: \(movieCount)\nSongs count: \(songCount)")

//let movie = folder.first! as? Movie
print(folder.first! as! Movie)

for item in folder {
    if let movie = item as? Movie {
        print("Movie with length = \(movie.lenghtInMinutes)")
    } else if let song = item as? Song {
        print("Song from artist: \(song.artist)")
    }
}

extension MediaItem {
    func rename(_ new: String) {
        name = new
    }
}

folder.first!.rename("Renamed")
print(folder.first!.name)

///---

protocol FirstProtocol {
    
}

protocol SecondProtocol {
    
}

struct SomeStruct: FirstProtocol, SecondProtocol {
    
}

class SomeClass: MediaItem, FirstProtocol, SecondProtocol {
    
}

protocol SomeProtocol {
    var mustBe: Int? { get set }
}

protocol FullNamed {
    var fullName: String { get set }
}

struct Person: FullNamed {
    let firstName: String
    let lastName: String
    var fullName: String
    
    init(_ firstName: String, _ lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = ""
    }
}

func getName(_ obj: FullNamed) {
    print(obj.fullName)
}

var petya = Person("Petr", "Mirzaev")
petya.fullName = "123123123"
getName(petya)

var person111: FullNamed = petya
person111.fullName = "123"

protocol RandomGenerator {
    func random() -> Int
}

class LinearGenerator: RandomGenerator {
    let a: Int = 12
    
    func random() -> Int {
        return Int.random(in: 0..<1000)
    }
}
let generator1 = LinearGenerator()
print(generator1.a)

let generator: RandomGenerator = LinearGenerator()
//generator.a
print(generator.random())

class Dice {
    let sides: Int
    let generator: RandomGenerator
    
    init(sides: Int, generator: RandomGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return generator.random() % sides + 1
    }
}

let d12 = Dice(sides: 12, generator: LinearGenerator())
for _ in 1...10 {
    print("Dice: \(d12.roll())")
}

protocol Aged {
    var age: Int { get }
}

protocol PersonProtocol: FullNamed, Aged {
    
}

///---

func swap(typle: (Int, Int)) -> (Int, Int) {
    var typle = typle
    let temp = typle.0
    typle.0 = typle.1
    typle.1 = temp
    return typle
}

func swap(typle: (Double, Double)) -> (Double, Double) {
    var typle = typle
    let temp = typle.0
    typle.0 = typle.1
    typle.1 = temp
    return typle
}

func swap<T>(typle: (T, T)) -> (T, T) {
    var typle = typle
    let temp = typle.0
    typle.0 = typle.1
    typle.1 = temp
    return typle
}

let typle = ("abc", "123")
print(typle)
let typle1 = swap(typle: typle)
print(typle1)


struct IntStack {
    var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<T> {
    var items: [T] = []
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stack = Stack<String>()
stack.push("Alex")
stack.push("is")
stack.push("name")
stack.push("My")
stack.items

for _ in 0..<stack.items.count {
    print(stack.pop())
}

class SomeClass1 {
    
}

protocol SomeProto {
    
}

func someFunc<T: SomeClass1, U: SomeProto>(someT: T, someU: U) {
    
}

//someFunc(someT: 12, someU: "String")
