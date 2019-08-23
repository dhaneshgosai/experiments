//: Playground - noun: a place where people can play

import UIKit

import Foundation

extension Array where Element: Comparable {
    
    func bubbleSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) { // 1
            for j in 0..<(data.count-i-1) where areInIncreasingOrder(data[j+1], data[j]) { // 2
                data.swapAt(j, j + 1)
            }
        }
        
        return data
    }
}

func swap<T: Comparable>(left: inout T, right: inout T) {
    print("Swapping \(left) and \(right)")
    let temp = right
    right = left
    left = temp
}

let myArray = [4, 2, 0, 1]

// by default the sort is ascending
let sorted = myArray.bubbleSort()

// ascending
let anotherSorted = myArray.bubbleSort(<)

// descending
let stillSorted = myArray.bubbleSort(>)
