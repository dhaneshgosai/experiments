//
//  ContactListViewController.swift
//  iOSUtility
//
//  Created by Sheshnath on 12/12/18.
//  Copyright © 2018 Exp. All rights reserved.
//

import UIKit
import Contacts

class ContactListViewController: UIViewController {

    var allPhoneNumbers: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        allPhoneNumbers = phoneNumberWithContryCode()
        print("All Phone Numbers List : \(allPhoneNumbers)")
        // Do any additional setup after loading the view.
    }
    
    func phoneNumberWithContryCode() -> [String] {
        
        let contacts = MyPhoneContacts.getContacts() // here calling the getContacts methods
        var arrPhoneNumbers = [String]()
        for contact in contacts {
//            print("namePrefix : \(contact.namePrefix)")
//            print("nameSuffix : \(contact.nameSuffix)")
            print("phoneNumbers : \(contact.phoneNumbers)")
//            print("contactType : \(contact.contactType)")
//            print("jobTitle : \(contact.jobTitle)")
//            print("birthday : \(String(describing: contact.birthday))")
//            print("departmentName : \(contact.departmentName)")
            print("emailAddresses : \(contact.emailAddresses)")
//            print("postalAddresses : \(contact.postalAddresses)")
//            print("imageDataAvailable : \(contact.imageDataAvailable)")
//            print("organizationName : \(contact.organizationName)")
//            print("Name : \(contact.middleName)")
            for ContctNumVar: CNLabeledValue in contact.phoneNumbers {
                if let fulMobNumVar  = ContctNumVar.value as? CNPhoneNumber {
                    //let countryCode = fulMobNumVar.value(forKey: "countryCode") get country code
                    if let MccNamVar = fulMobNumVar.value(forKey: "digits") as? String {
                        arrPhoneNumbers.append(MccNamVar)
                    }
                }
            }
        }
        return arrPhoneNumbers // here array has all contact numbers.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
