//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Addable {}
extension Double: Addable {}
extension Float: Addable {}
extension String: Addable {}
extension Array: Addable {}


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
        
        
        //With Normal Function
        let total = additionOfVal(10,20)
        //        let finalString = additionOfVal(firstVal: "Hello", secondVal: "World")
        print("Normal Function Addition: ",total)
        
        //With Numeric Protocol
        let output = additionOfValGeneric(val1: 10, val2: 20)
        let output1 = additionOfValGeneric(val1: 10.2, val2: 20.3)
        let output2 = additionOfValGeneric(val1: 10.001, val2: 20.002)
        //Error in next line with String type
//        let output3 = additionOfValGeneric(val1: "Hello", val2: "World")
        print("Int Addition: ", output, "\nFloat Addition: ", output1, "\nDouble Addition: ", output2)
        
        //With Addable Protocol
        let intAdd = additionOfValGenericWithAddable(val1: 10, val2: 20)
        let floatAdd = additionOfValGenericWithAddable(val1: 10.20, val2: 20.30)
        let doubleAdd = additionOfValGenericWithAddable(val1: 10.003, val2: 20.021)
        let stringAdd = additionOfValGenericWithAddable(val1: "Hello", val2: "World")
        let arrayAdd = additionOfValGenericWithAddable(val1: ["Hello","Test"], val2: ["World", "Test1"])
        
        print("Int Addition: ", intAdd, "\nFloat Addition: ", floatAdd, "\nDouble Addition: ", doubleAdd, "\nString Addition: ", stringAdd, "\nArray Addition: ", arrayAdd)
        
        var firstVal = 10.0
        var secondVal = 20.0
        print("Firts Value: ", firstVal, "Second Value: ", secondVal)
        swapTwoDoubles(&firstVal, &secondVal)
        print("After Swipe\nFirts Value: ", firstVal, "Second Value: ", secondVal)
        
        
        var str1 = "Hello"
        var str2 = "World"
        print("Firts String: ", str1, "Second String: ", str2)
        swapTwoValues(&str1,&str2)
        print("After Swipe\nFirts String: ", str1, "Second String: ", str2)
        var array1 = ["Hello","Test"]
        var array2 = ["World", "Test1"]
        print("Firts Array: ", array1, "Second Array: ", array2)
        swapTwoValues(&array1,&array2)
        print("After Swipe\nFirts Array: ", array1, "Second Array: ", array2)
        
        let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
        print("Index: ",doubleIndex ?? "Index not found")
        let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
        print("Index: ",stringIndex ?? "Index not found")
    }
    
    func additionOfVal(_ firstVal : Int,_ secondVal: Int) -> Int {
        return firstVal + secondVal
    }
    
    func additionOfValGeneric<T: Numeric>(val1 : T, val2 : T) -> T {
        return val1 + val2
    }
    
    func additionOfValGenericWithAddable<T: Addable>(val1 : T, val2 : T) -> T {
        return val1 + val2
    }
    
    func swapTwoStrings(_ a: inout String, _ b: inout String) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func swapTwoDoubles(_ a: inout Double,_ b: inout Double) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func swapTwoValues<T>(_ a: inout T,_ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    //Generic Function with Different types
    func findIndex<T: Equatable>(of string: T,in array: [T]) -> Int? {
        for (index, str) in array.enumerated() {
            if str == string {
                return index
            }
        }
        return nil
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
