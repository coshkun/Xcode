//: Playground - noun: a place where people can play

import UIKit

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








