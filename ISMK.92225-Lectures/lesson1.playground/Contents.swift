//: Playground - noun: a place where people can play

import UIKit

//Veri Türleri


//let lname = "Yılmaz"
var age : Int = 28
var age2 = 21
//print("Adı : \(name) Soyadı: \(lname) Yaşı: \(age)")

let n1 = 11
let result = (n1 + 2) * 3

//convert


let integer : Int = 10
let double : Double = 11.3
//let result2 : Double = Double(integer * double)

//
let isEquals : Bool = (1 == 1)
let isEquals2 : Bool = (1 < 1)
let isEquals3 = (1 == 1) && true
let isEquals4 = false || true

////////////lesson 2 

let hourOfDay = 12
var timeOfDay : String
let name = "Yunus"

if hourOfDay < 6 {
    timeOfDay = "Early morning"
}else if hourOfDay < 12 {
    timeOfDay = "Afternon"
}
else {
    timeOfDay = "Evening"
}
print(" \(timeOfDay)")

if 1 < 2 && name == "Yunus" {
    //print("true")
    if name == "Yılmaz" {
        print("")
    }
    else {
        print("")
    }
}
else {
    print("")
}
if 3 == 3 || name == "Yılmaz" {
    print("veya")
}
//scope kavramı

var houseWorked = 45

var price = 0

if houseWorked < 40 {
   // let houseWorked = houseWorked - 40 hata çünkü global scope local scope'u ezer.
    price += houseWorked
}
//? operator
let a = 10
let b : Int = 20

let min = a < b ? a : b
let max = a > b ? a : b

//loops

//while loop

var sum = 1

while sum < 10 {
    sum += 1
    //print(sum)
}
sum = 0
repeat {
    print(sum)
    sum += 1
} while sum == 0
print(sum)

while true {
    sum += 1
    if sum >= 100 {
        break
    }
    print(sum)
}









