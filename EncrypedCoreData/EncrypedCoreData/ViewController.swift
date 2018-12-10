//
//  ViewController.swift
//  EncrypedCoreData
//
//  Created by Sheshnath on 05/12/18.
//  Copyright © 2018 Exp. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Helpers
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appdelegate.persistentContainer.viewContext
        
        
        // Create User
        let user = User(context: managedObjectContext)
        
        // Configure User
        user.firstName = "First1"
        user.lastName = "Last1"
        user.age = 10
        user.surname = "Sur1"
        
        // Create User
        let user1 = User(context: managedObjectContext)
        
        // Configure User
        user1.firstName = "First2"
        user1.lastName = "Last2"
        user1.age = 20
        user1.surname = "sur2"
        
        // Create User
        let user2 = User(context: managedObjectContext)
        
        // Configure User
        user2.firstName = "First3"
        user2.lastName = "Last3"
        user2.age = 30
        user2.surname = "sur3"
        
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Failed saving")
        }
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do {
            let result = try managedObjectContext.fetch(request)
            for data in result as! [User] {
                print(data.firstName ?? "No firstName")
                print(data.lastName ?? "No lastName")
                print(data.surname ?? "No surname")
                print(data.age )
            }
        } catch  {
            print("Fetch Failed")
        }
        
    }


}

