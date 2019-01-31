//
//  MyPhoneContacts.swift
//  iOSUtility
//
//  Created by Sheshnath on 31/01/19.
//  Copyright © 2019 Exp. All rights reserved.
//

import UIKit
import ContactsUI
import Contacts

enum ContactsFilter {
    case none
    case mail
    case message
}

class MyPhoneContacts: NSObject {
    
    class func getContacts(filter: ContactsFilter = .none) -> [CNContact] { //  ContactsFilter is Enum find it below
        
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactThumbnailImageDataKey,
            ] as [Any]
        
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            //Debug.Log(message: "Error fetching containers") // you can use print()
            print("Error fetching containers")
        }
        
        var results: [CNContact] = []
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
            } catch {
//                Debug.Log(message: "Error fetching containers")
                print("Error fetching containers")
            }
        }
        return results
    }

}
