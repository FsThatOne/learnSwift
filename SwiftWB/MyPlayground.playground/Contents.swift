//: Playground - noun: a place where people can play

import UIKit
import ImageIO
import MobileCoreServices

func isGITImageData(data: NSData) -> Bool {
    let imageSource : CGImageSource? = CGImageSourceCreateWithData(data, nil)
    guard let isrc =  imageSource, let imageSourceContainerType = CGImageSourceGetType(isrc) else { return false }
    return UTTypeConformsTo(imageSourceContainerType, kUTTypeGIF)
}

let label = UILabel()
label.baselineAdjustment = .alignCenters
label.lineBreakMode = .byTruncatingMiddle

let text = UITextField()
text.placeholder = "~"



// Playground - noun: a place where people can play


var str = "Hello, playground" + " and hyt"


var i=10


var f=5.0


f=f+5.0


let fruits = ["apple", "banana", "orange", "cherry"]


for some in fruits {
    print("\(some)")
    some
}


fruits.count
var another = fruits.map{(some:String) -> String in return some+" 3"}
another


func sayHello(_ name:String) -> String {
    return "Hello \(name)."
}


sayHello("hyt")


fruits.map(sayHello);


var sum = 0
for num in 1...100 {
    sum += num
}


sum


func getfunc() -> (Int, Int)->Int {
    func add(a:Int, b:Int)->Int{ return a+b}
    return add
}


getfunc()(1,2)


var a = [1,2,3,"hyt",2.1]
a.count
a.self


class Phone {
    var type=""
    func what()->String{
        return "I'm iPhone\(type)."
    }
}
var iPhone = Phone()
iPhone.type = "4S"
iPhone.what()


class Bala : Phone{
    init(type:String){
        super.init()
        self.type=type
    }
}


var bala = Bala(type:"5S")
bala.what()


protocol ExampleProtocol {
    mutating func adjust()
}


extension Double: ExampleProtocol {
    mutating func adjust(){
        self+=1
    }
}


var db: Double = 1.10


db.adjust()
db


// simple pattern matching
let (x, y) = (1,2)
x
var dd = x+1


let (_, z) = ("hyt", "bob")
z

str = "hyt/bob".uppercased
var strs = NSURL(string: str)
strs!.pathComponents


str = "HYT.BOB".lowercased
var names = str.components(separatedBy: ".")
names += ["app"]
names += ["Anna", "git"]
str = names[2]
names.isEmpty
names = names.reversed()


str = names.reduce(str, {(a:String, some:String)-> String in return a+","+some})
str
str = ""
names.reduce(str, +)


var nums = [1,2,3]


var num = 0;
nums.reduce(num, +)


func showMeTheCode(code: String, bb: String){
    print("\(bb) is cheap , show me the \(code)")
}

func ??<T>(optional: T?, defaultValue: @autoclosure() -> T) -> T {
    switch optional {
    case .some(let value):
        return value
    case .none:
        return defaultValue()
    }
}

var number: Double?

func curried(x: Int) -> (Int) -> Float {
    return { (y: Int) -> Float in
        return Float(x) + Float(y)
    }
}

// 异常处理
enum MyErrorType: Error {
    case BeyondError
}

func giveMeTheNumber(num: Int) throws {
    if !(num<0 && num>10) {
        throw MyErrorType.BeyondError
    }
}

do {
    print("谁都别跟我抢!")
    try giveMeTheNumber(num: 19)
} catch let error as MyErrorType {
    print("并没有这个数,哈哈哈!!!")
}

DispatchQueue.global().async {
    
}


/// 模式匹配
enum Media {
    case Book(title: String, author: String, year: Int)
    case Movie(title: String, director: String, year: Int)
    case WebSite(url: String, title: String)
}

extension Media {
    var mediaTitle: String {
        switch self {
        case .Book(title: let aTitle, author: _, year: _):
            return aTitle
        case .Movie(title: let aTitle, director: _, year: _):
            return aTitle
        case .WebSite(url: _, title: let aTitle):
            return aTitle
        }
    }
}

let book = Media.Book(title: "20,000 leagues under the sea", author: "Jules Verne", year: 1870)
book.mediaTitle

extension Media {
    func checkAuthor(author: String) -> Bool {
        switch self {
        case .Book(title: _, author: author, year: _): return true
        case .Movie(title: _, director: author, year: _): return true
        default: return false
        }
    }
}
book.checkAuthor(author: "Jules Verne")

extension Media {
    var mediaTitle2: String {
        switch self {
        // 错误: 'case' 标签中含多种模式，变量是不能被声明的
        case .Book(title: let aTitle, author: _, year: _), .Movie(title: let aTitle, director: _, year: _):
            return aTitle
        case let .WebSite(url: _, title: aTitle):
            return aTitle
        }
    }
}
book.mediaTitle2

let point = CGPoint(x: 7, y: 0)
switch (point.x, point.y) {
case (0,0): print("On the origin!")
case (0,_): print("x=0: on Y-axis!")
case (_,0): print("y=0: on X-axis!")
case (let x, let y) where x == y: print("On y=x")
default: print("Quite a random point here.")
}

let abaab = 5
switch abaab {
case 0...4:
    print("haha")
case 5:
    print("xixi")
default:
    print("heihei")
}

let count = 7
switch count {
case Int.min..<0: print("Negative count, really?")
case 0: print("Nothing")
case 1: print("One")
case 2..<5: print("A few")
case 5..<10: print("Some")
default: print("Many")
}

protocol Medium {
    var title: String { get }
}
struct Book: Medium {
    let title: String
    let author: String
    let year: Int
}
struct Movie: Medium {
    let title: String
    let director: String
    let year: Int
}
struct WebSite: Medium {
    let url: String
    let title: String
}

// And an array of Media to switch onto
let media: [Medium] = [
    Book(title: "20,000 leagues under the sea", author: "Jules Vernes", year: 1870),
    Movie(title: "20,000 leagues under the sea", director: "Richard Fleischer", year: 1955)
]

for medium in media {
    // The title part of the protocol, so no need for a switch there
    print(medium.title)
    // But for the other properties, it depends on the type
    switch medium {
    case let b as Book:
        print("Book published in \(b.year)")
    case let m as Movie:
        print("Movie released in \(m.year)")
    case is WebSite:
        print("A WebSite with no date")
    default:
        print("No year info for \(medium)")
    }
}

let mediaList: [Media] = [
    .Book(title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", year: 1997),
    .Movie(title: "Harry Potter and the Philosopher's Stone", director: "Chris Columbus", year: 2001),
    .Book(title: "Harry Potter and the Chamber of Secrets", author: "J.K. Rowling", year: 1999),
    .Movie(title: "Harry Potter and the Chamber of Secrets", director: "Chris Columbus", year: 2002),
    .Book(title: "Harry Potter and the Prisoner of Azkaban", author: "J.K. Rowling", year: 1999),
    .Movie(title: "Harry Potter and the Prisoner of Azkaban", director: "Alfonso Cuarón", year: 2004),
    .Movie(title: "J.K. Rowling: A Year in the Life", director: "James Runcie", year: 2007),
    .WebSite(url: "https://en.wikipedia.org/wiki/List_of_Harry_Potter-related_topics", title: "哈哈")
]

extension Media {
    var title: String? {
        switch self {
        case let .Book(title, _, _): return title
        case let .Movie(title, _, _): return title
        default: return nil
        }
    }
    var kind: String {
        /* Remember part 1 where we said we can omit the `(…)`
         associated values in the `case` if we don't care about any of them? */
        switch self {
        case .Book: return "Book"
        case .Movie: return "Movie"
        case .WebSite: return "Web Site"
        }
    }
}

print("All mediums with a title starting with 'Harry Potter'")
for case let (title?, kind) in mediaList.map({ ($0.title, $0.kind) })
    where title.hasPrefix("Harry Potter") {
        print(" - [\(kind)] \(title)")
}


let hahax = 35

let rectCorner: UIRectCorner = [.topLeft, .topRight, .bottomLeft]

let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]