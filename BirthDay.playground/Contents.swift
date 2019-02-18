//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var ar = [3,2,1,3]
let hasDuplicates = ar.count != Set(ar).count
let set = NSCountedSet.init(array: ar)
let totalDups = set.map { set.count(for: $0) }.filter {$0 > 1}.reduce(0, +)
