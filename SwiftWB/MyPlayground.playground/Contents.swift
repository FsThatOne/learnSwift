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


str = names.reduce(str, combine: {(a:String, some:String)-> String in return a+","+some})
str
str = ""
names.reduce(str, combine: +)


var nums = [1,2,3]


var num = 0;
nums.reduce(num, combine: +)


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
enum MyErrorType: ErrorProtocol {
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

dispatch_s
