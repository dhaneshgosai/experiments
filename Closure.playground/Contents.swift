//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        
        for chars in "Swift" {
            print(chars, terminator: "#")
        }
        
        var someInts = [Int](repeating: 10, count:3)
        
        let evens: Set = [10,12,14,16,18]
        let odds: Set = [5,7,9,11,13]
        let primes = [2,3,5,7]
        odds.union(evens).sorted()
        // [5,7,9,10,11,12,13,14,16,18]
        odds.intersection(evens).sorted()
        //[]
        odds.subtracting(primes).sorted()
        //[3,4,4,4,13]
            {
                var cities = ["Delhi","Bangalore","Hyderabad"]
                var Distance = [2000,10, 620]
                let cityDistanceDict = Dictionary(uniqueKeysWithValues: zip(cities, Distance))
            }
        
        
        //Example 1
        let studname = { print("Welcome to Swift Closures") }
        studname()
        
        
        
        //Example 2
        let divide = {
            (val1: Int, val2: Int) -> Int in
            return val1 / val2
        }

        let result = divide(200, 20)
        print (result)

        //Example 3
        func ascend(s1: String, s2: String) -> Bool {
            return s1 > s2
        }

        
        let stringcmp = ascend(s1: "Swift 4", s2: "great")
        print (stringcmp)

        //Example 4
        let sum = {
            (no1: Int, no2: Int) -> Int in
            return no1 + no2
        }

        let digs = sum(10, 20)
        print(digs)

        //Example 5
        let count:[Int] = [5, 10, -6, 75, 20]
        let descending = count.sorted(by: { n1, n2 in n1 > n2 })
        let ascending = count.sorted(by: { n1, n2 in n1 < n2 })

        print(descending)
        print(ascending)


        //Example 6
        let sub = {
            (no1: Int, no2: Int) -> Int in
            return no1 - no2
        }

        let digits = sub(10, 20)
        print(digits)

        //Example 7
        var shorthand: (String, String) -> String
        shorthand = { $1 }
        print(shorthand("100", "200"))

//        //Example 8
//        let numb = [98, -20, -30, 42, 18, 35]
//        var sortedNumbers = numb.sorted ({
//            (left: Int, right: Int) -> Bool in
//            return left < right
//        })
//
//        let asc = numb.sorted(<)
//        print(asc)

        //Example 9
//        var letters = ["North", "East", "West", "South"]
//
//        let twoletters = letters.map({
//            (state: String) -> String in
//            return state.substringToIndex(advance(state.startIndex, 2)).uppercaseString
//        })
//
//        let stletters = letters.map() {
//            $0.substringToIndex(advance($0.startIndex, 2)).uppercaseString
//        }
//        print(stletters)
//
//        //Example 11
//        func calcDecrement(forDecrement total: Int) -> () -> Int {
//            var overallDecrement = 100
//            func decrementer() -> Int {
//                overallDecrement -= total
//                print(overallDecrement)
//                return overallDecrement
//            }
//            return decrementer
//        }
//
//        let decrem = calcDecrement(forDecrement: 18)
//        decrem()
//        decrem()
//        decrem()
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
