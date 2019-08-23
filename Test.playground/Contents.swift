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
    }
    
//    func xyz(newa:[String])-> [String]{
//        return newa;
//    }
//
//    xyz(newa:["test1","test2"])
    
    func greetAgain(persons: [String]) -> String {
        return "Hello again, " + persons[0] + "!"
    }
    
    let testStr = self.greetAgain(persons: ["Anna","Dhanesh","Ginni"])
    
    print()
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
