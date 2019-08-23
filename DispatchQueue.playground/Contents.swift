//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func initWithPersons(_ persons: [String], _ name: String, _ age: Int) -> [String] {
    return persons
}
let namesArray = ["Anna","Dhanesh","Ginni"]
let testStr = initWithPersons(namesArray,"Dhanesh",24)

print(testStr)

func concurrentQueue(){
    let anotherQueue = DispatchQueue(label: "com.cisco.concurrentQueue", qos: .utility)
    
    anotherQueue.async {
        for i in 0..<10 {
            print("Ⓜ️",i)
        }
    }
    
    anotherQueue.async {
        for i in 0..<10 {
            print("$",i)
        }
    }
    anotherQueue.async {
        for i in 0..<10 {
            print("#",i)
        }
    }
    anotherQueue.async {
        for i in 0..<10 {
            print("*",i)
        }
    }
}


