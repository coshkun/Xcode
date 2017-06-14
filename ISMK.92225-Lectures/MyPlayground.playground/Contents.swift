//: Playground - noun: a place where people can play

import UIKit

var metin = String()
var isEmpty = metin.isEmpty
var bilgi = "bu gün hava çok güzel"
var cokVarmi = bilgi.hasPrefix("bu")
var guzelVarmi = bilgi.hasSuffix("güzel")
println("ios developer \(count(bilgi))")




struct Location {
    let x: Int
    let y: Int
}

let storeLocation = Location(x:2, y:4)

func distance(from source: (x: Int, y:Int), to target: (x: Int, y: Int))->Double
{
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    
    return sqrt(distanceX * distanceX + distanceY * distanceY)
}


struct DeliveryArea {
    var range:Double
    let center:Location
    
    func isInDeliveryArea(_ location:Location)->Bool {
        for area in areas {
            let distanceToStore = distance(from: (area.center.x, area.center.y), to: (location.x, location.y))
            if distanceToStore < range {
                return true
            }
        }
        return false
    }
}

let areas = [DeliveryArea(range: 2.5, center: Location(x:2,y:4)), DeliveryArea(range: 4.5, center: Location(x:9, y:7))]

var storeArea = DeliveryArea(range:4, center: storeLocation)

let customLocation1 = Location(x:8, y:1)
let customLocation2 = Location(x:2, y:4)

print(storeArea.isInDeliveryArea(customLocation1))


struct Student {
    var age: Int
    var name:String
    
    func getAgeAndName()->(Int,String) {
        return (age, name)
    }
}

var std1 = Student(age: 11, name: "Börkecan")

print(std1.getAgeAndName())

// SWIFT 3.0 ile yazıldı
// Property Observers: WillSet (before olayı gibi), DidSet (after olayı gibi) çalışır.
// 31,05,2017

struct Level{
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        willSet{
            print("willset and id: \(id)")
        }
        didSet {
            if unlocked && id > Level.highestLevel {
                print("willset and id: \(id)")
                Level.highestLevel = id
                print(oldValue)
            }
        }
    }
}

var bolum1 = Level(id: 2, boss: "Bölüm1", unlocked: false)

bolum1.unlocked = true



//lazy properties

struct Circle{
    lazy var pi = {
        return 22/7
    }
}

/*
struct Karne {
    let fizik:Int = 30
    let matematik:Int = 50
    var name = ""
    var id:Int = 0
    
    lazy var notOrtala = {
        return (fizik + matematik) * 1.0 / 2
    }
} */

let months = [ "Ocak","Subat","Mart","Nisan","Mayıs","Haziran","temmuz","Agustos","Eylül","Ekim","Kasım","Aralık" ]

/* 12.05.2017 */

class notes {
    var name: String
    var note: Int
    
    init() {
        name = ""
        note = 0
    }
}

class Student2 {
    var firstName: String
    var lastName: String
    var myNotes:[notes] = []
    
    required init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
}

class StudentAthlete : Student2 {
    required init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(){
        self.init(firstName: "", lastName: "")
    }
}

var sa = StudentAthlete()

//Garbage Collection
//ARC (Automatic Referance Counter)
//de init is the deconstructor of the class

class Person {
    var firstName:String
    var lastName:String
    
    init() {
        self.firstName=""
        self.lastName=""
    }
    deinit {
        print("geldikk gidiyoruz..")
    }
}

var p1:Person? = Person()
var p2 = p1

p1 = nil
//ARC1
p2=nil
//ARC0


//enumarations

enum Mounths {
    case Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
}
enum Mounths2 : Int {
    case Jan = 1
    case Feb = 2
    case Mar = 3
    case Apr = 4
    case May = 5
    case Jun = 6
    case Jul = 7
    case Aug = 8
    case Sep = 9
    case Oct = 10
    case Nov = 11
    case Dec = 12
}
/* SWIFT 3.0 ////////////////////
func semester(for month:Mounths)->String {
    switch month {
    case Mounths.Aug, Mounths.Sep, Mounths.Oct, Mounths.Nov, Mounths.Dec:
        return "Autumn"
    case .Jan, .Feb, .Mar, .Apr, .May:
        return "Spring"
    default:
        return "Not in the school year"
    }
}

var m = Mounths.Feb
print(semester(for: m))

let fiftMounth = Mounths2(rawValue: 5)

enum icon: String {
    case music
    case sports
    case weather
    
    var fileName: String {
        return "\(rawValue.capitalized).png"
    }
}

let myIcon = icon.weather
print(myIcon.fileName)

//ordered
enum numberStrings: Int {
    case one = 1, two, tree, four, five
}
// End of SWIFT 3.0 /////////////////// */

//14.06.2017

protocol Vehicle{
    func start()
    func stop()
    func accelarate()
}
//protocol inheritance
protocol WheeledVehicle: Vehicle {
    var numberOfWheels : Int { get }
    var wheelSize : Double {get set}
}

class Araba: WheeledVehicle {
    var numberOfWheels:Int
    var wheelSize:Double
    
    func start(){}
    func stop(){}
    func accelarate(){}
    init() {
        numberOfWheels = 1
        wheelSize = 1.0
    }
}

///Associated types in protocol
protocol WeightCalculate {
    associatedtype WeightType
    func calculateWeight()->WeightType
}
class Kamyon : WeightCalculate {
    typealias WeightType = Int
    func calculateWeight()->WeightType {
        return 100
    }
}
class Otobus : WeightCalculate {
    typealias WeightType = Double
    func calculateWeight()->WeightType {
        return 11.2
    }
}

//Protocols in Standart Library

//Equatable

let a = 5
let b = 3

a == b

struct Record {
    var wins : Int
    var losses : Int
}

let recordA = Record(wins: 4, losses: 1)
let recordB = Record(wins: 2, losses: 4)

//recordA == recordB
protocol myEquatable {
    static func ==(lhs: Self, rhs:Self) ->Bool
}

extension Record : Equatable {
    static func ==(lhs: Record, rhs: Record) ->Bool {
    return lhs.wins == rhs.wins && lhs.losses == rhs.losses
    }
    
}

