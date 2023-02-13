//
//  NotificationsViewController.swift
//  cs50project
//
//  Created by Adetorera Marcus on 30/10/2021.
//

import UIKit
import UserNotifications

class NotificationsViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Step 1: Ask for permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        // Step 2: Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Manifestation Time!"
        content.body = "It's time for your evening manifestation!"
        
        // Step 3: Create the notification trigger
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Step 4: Create the request
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Step 5: Register the request
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
    }


}

