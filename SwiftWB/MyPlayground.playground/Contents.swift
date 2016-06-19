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
//import UIKit

@IBDesignable
public class GlitchLabel: UILabel {
    @IBInspectable public var amplitudeBase: Double = 2.0
    @IBInspectable public var amplitudeRange: Double = 1.0
    
    @IBInspectable public var glitchAmplitude: Double = 10.0
    @IBInspectable public var glitchThreshold: Double = 0.9
    
    @IBInspectable public var alphaMin: Double = 0.8
    
    @IBInspectable public var glitchEnabled: Bool = true
    @IBInspectable public var drawScanline: Bool = true
    
    public var blendMode: CGBlendMode = .lighten
    
    private var channel: Int = 0
    private var amplitude: Double = 2.5
    private var phase: Double = 0.9
    private var phaseStep: Double = 0.05
    private var globalAlpha: Double = 0.8
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setTimer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setTimer()
    }
    
    override public func drawText(in rect: CGRect) {
        if !glitchEnabled {
            super.drawText(in: rect)
            return
        }
        
        var x0 = CGFloat(amplitude * sin((M_PI * 2.0) * phase))
        
        if random() >= glitchThreshold {
            x0 *= CGFloat(glitchAmplitude)
        }
        
        let x1 = CGFloat(Int(bounds.origin.x))
        let x2 = x1 + x0
        let x3 = x1 - x0
        
        globalAlpha = alphaMin + ((1 - alphaMin) * random())
        
        var channelsImage: UIImage?
        switch channel {
        case 0:
            channelsImage = getChannelsImage(x1: x1, x2: x2, x3: x3)
        case 1:
            channelsImage = getChannelsImage(x1: x2, x2: x3, x3: x1)
        case 2:
            channelsImage = getChannelsImage(x1: x3, x2: x1, x3: x2)
        default:
            print("ERROR")
        }
        
        channelsImage?.draw(in: bounds)
        
        if let channelsImage = channelsImage where drawScanline {
            getScanlineImage(channelsImage: channelsImage).draw(in: bounds)
            if floor(random() * 2) > 1 {
                getScanlineImage(channelsImage: channelsImage).draw(in: bounds)
            }
        }
    }
    
    private func getChannelsImage(x1: CGFloat, x2: CGFloat, x3: CGFloat) -> UIImage {
        let redImage = getRedImage(rect: bounds)
        let greenImage = getGreenImage(rect: bounds)
        let blueImage = getBlueImage(rect: bounds)
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main().scale)
        redImage.draw(in: bounds + CGRect(x: x1, y: 0, width: 0, height: 0),
                            blendMode: blendMode,
                            alpha: CGFloat(globalAlpha))
        greenImage.draw(in: bounds + CGRect(x: x2, y: 0, width: 0, height: 0),
                              blendMode: blendMode,
                              alpha: CGFloat(globalAlpha))
        blueImage.draw(in: bounds + CGRect(x: x3, y: 0, width: 0, height: 0),
                             blendMode: blendMode,
                             alpha: CGFloat(globalAlpha))
        let channelsImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return channelsImage
    }
    
    private func getScanlineImage(channelsImage: UIImage) -> UIImage {
        let y = bounds.size.height * CGFloat(random())
        let y2 = bounds.size.height * CGFloat(random())
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main().scale)
        let context = UIGraphicsGetCurrentContext()
        
        
        let provider: CGDataProvider = channelsImage.cgImage!.dataProvider!
        let data: NSData = provider.data!
        let bytes = data.bytes
        let bytePointer = UnsafePointer<UInt8>(bytes)
        
        for col in 0 ..< Int(bounds.size.width) {
            let offset = 4*(Int(y) * Int(bounds.size.width) + col)
            let alpha = bytePointer[offset]
            let red = bytePointer[offset+1]
            let green = bytePointer[offset+2]
            let blue = bytePointer[offset+3]
            context!.setFillColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
            context!.fill(CGRect(x: CGFloat(col), y: y2, width: 1, height: 0.5))
        }
        
        let scanlineImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return scanlineImage
    }
    
    private func getRedImage(rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main().scale)
        text?.draw(in: rect, withAttributes: [
            NSFontAttributeName: UIFont.init(name: font.fontName, size: font.pointSize)!,
            NSForegroundColorAttributeName: UIColor.red()
            ])
        
        let redImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return redImage
    }
    
    private func getGreenImage(rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main().scale)
        text?.draw(in: rect, withAttributes: [
            NSFontAttributeName: UIFont.init(name: font.fontName, size: font.pointSize)!,
            NSForegroundColorAttributeName: UIColor.green()
            ])
        let greenImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return greenImage
    }
    
    private func getBlueImage(rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main().scale)
        text?.draw(in: rect, withAttributes: [
            NSFontAttributeName: UIFont.init(name: font.fontName, size: font.pointSize)!,
            NSForegroundColorAttributeName: UIColor.blue()
            ])
        
        let blueImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return blueImage
    }
    
    @objc private func tick() {
        phase += phaseStep
        if phase > 1 {
            phase = 0
            channel = (channel == 2) ? 0 : channel + 1
            amplitude = amplitudeBase + (amplitudeRange * random())
        }
        
        setNeedsDisplay()
    }
    
    private func setTimer() {
        let timer = Timer(timeInterval: 1/30.0,
                            target: self,
                            selector: #selector(GlitchLabel.tick),
                            userInfo: nil,
                            repeats: true)
        
        RunLoop.current().add(timer, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    private func random() -> Double {
        return (Double(arc4random()) / Double(UINT32_MAX))
    }
}

func +(rect1: CGRect, rect2: CGRect) -> CGRect {
    return CGRect(x: rect1.origin.x + rect2.origin.x,
                  y: rect1.origin.y + rect2.origin.y,
                  width: rect1.size.width + rect2.size.width,
                  height: rect1.size.height + rect2.size.height)
}
func +(size1: CGSize, size2: CGSize) -> CGSize {
    return CGSize(width: size1.width + size2.width,
                  height: size1.height + size2.height)
}


var lbl = GlitchLabel(frame: CGRect(x: 0, y: 0, width: 800, height: 300))
lbl.font = UIFont.systemFont(ofSize:50)
lbl.text = "Bling~Bling~!的"


func ??<T>(optional: T?, defaultValue: @autoclosure() -> T) -> T {
    switch optional {
    case .some(let value):
        return value
    case .none:
        return defaultValue()
    }
}

var number: Double?



