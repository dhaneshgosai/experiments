//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

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
        
        concurrentQueue()
        
    }
    
    func concurrentQueue(){
        let anotherQueue = DispatchQueue(label: "com.cisco.concurrentQueue", qos: .utility, attributes: .initiallyInactive)
        
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
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()



