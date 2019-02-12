//
//  RemindersTableViewController.swift
//  ListingNotificationsIssue
//
//  Created by Alex Marchant on 09/02/2019.
//  Copyright © 2019 Alex Marchant. All rights reserved.
//

import UIKit
import UserNotifications

class RemindersTableViewController: UITableViewController {
    
    
    @IBAction func unwindToRemindersTableViewController(segue: UIStoryboardSegue) {
    }
    
    var reminders = [Reminder]()
    var selectedReminder: Reminder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Reminder")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        generateReminders()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Reminders"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reminders.count
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reminder", for: indexPath)
        var text = ""
        var detailText = ""
        
        
        let reminder = reminders[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        text = formatter.string(from: reminder.Time)
        detailText = reminder.Message
        
        
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = detailText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteReminder(row: indexPath.row)
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < self.reminders.count) {
            selectedReminder = reminders[indexPath.row]
            self.performSegue(withIdentifier: "UpdateReminderSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateReminderSegue" {
            let destination = segue.destination as! UpdateReminderTableViewController
            if let reminder = selectedReminder {
                destination.reminder = reminder
            }
        }
    }
    
    func generateReminders()
    {
        
        //Remove old objects
        reminders.removeAll()
        
        let center = UNUserNotificationCenter.current()
        let dq = DispatchQueue.global(qos: .userInteractive)
        dq.async {
            center.getPendingNotificationRequests { (notifications) in
                for item in notifications {
                    if let trigger = item.trigger as? UNCalendarNotificationTrigger,
                        let triggerDate = trigger.nextTriggerDate() {
                        var withSound = true
                        if(item.content.sound != UNNotificationSound.default)
                        {
                            withSound = false
                        }
                        self.reminders.append(Reminder(identifier: item.identifier, time: triggerDate, message: item.content.body, withSound: withSound, isAPendingNotification: true))
                    }
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    func deleteReminder(row: Int)
    {
        let center = UNUserNotificationCenter.current()
        let reminder = reminders[row]
        
        switch(reminder.IsAPendingNotification) {
        case true:
            center.removePendingNotificationRequests(withIdentifiers: [reminder.Identifier])
        default:
            center.removeDeliveredNotifications(withIdentifiers: [reminder.Identifier])
        }
        
        reminders.remove(at: row)
    }
}

