//
//  UpdateReminderTableViewController.swift
//  ListingNotificationsIssue
//
//  Created by Alex Marchant on 09/02/2019.
//  Copyright © 2019 Alex Marchant. All rights reserved.
//

import UIKit
import UserNotifications

class UpdateReminderTableViewController: UITableViewController {
    
    @IBOutlet weak var reminderDatePicker: UIDatePicker!
    @IBOutlet weak var reminderMessageTextField: UITextField!
    @IBOutlet weak var reminderSoundSwitch: UISwitch!
    
    var reminder: Reminder?
    
    @IBAction func updateReminderButton(_ sender: Any) {
        rescheduleNotification()
        performSegue(withIdentifier: "unwindSegueToReminders", sender: self)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToReminders", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reminderDatePicker.setDate((reminder?.Time)!, animated: true)
        reminderMessageTextField.text = reminder?.Message
        reminderSoundSwitch.isOn = (reminder?.WithSound)!
    }
    
    func rescheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time!"
        content.body = reminderMessageTextField.text ?? "Lets get this done!"
        
        if(reminderSoundSwitch.isOn) {
            content.sound = UNNotificationSound.default
        }
        
        let selectedTime = reminderDatePicker.date
        let triggerTime = Calendar.current.dateComponents([.hour, .minute], from: selectedTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerTime, repeats: true)
        
        if let identifier = reminder?.Identifier {
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        } else {
            print("Inconsistency with notification identifiers")
        }
    }
    
}

