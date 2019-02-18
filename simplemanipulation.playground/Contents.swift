//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var ar1 = [80,20,30,40]
var ar2 = ["Dhanesh","Mohan","Param","Ruhi"]
var zip_array = zip(ar1,ar2)
print(zip_array)

let d = ["john" : 2, "jems":3,"ram":4]
let x = d.sorted{$0.1 < $1.1}.map{$0.0}
print(x)
