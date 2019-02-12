//
//  Reminder.swift
//  ListingNotificationsIssue
//
//  Created by Alex Marchant on 09/02/2019.
//  Copyright © 2019 Alex Marchant. All rights reserved.
//

import UIKit
import UserNotifications

class Reminder {
    
    var Identifier: String
    var Time: Date
    var Message: String
    var WithSound: Bool
    var IsAPendingNotification: Bool
    
    
    init(identifier: String, time: Date, message: String, withSound: Bool, isAPendingNotification: Bool) {
        self.Identifier = identifier
        self.Time = time
        self.Message = message
        self.WithSound = withSound
        self.IsAPendingNotification = isAPendingNotification
    }
    
}

