//
//  ZamzamManager.swift
//  ZamzamKit
//
//  Created by Basem Emara on 5/6/15.
//  Copyright (c) 2015 Zamzam. All rights reserved.
//

import Foundation

public class NotificationService: NSObject {
    
    public var dateTimeService: DateTimeService!
    
    override init() {
        // Inject service dependencies
        dateTimeService = DateTimeService()
    }
    
    public func register(application: UIApplication,
        _ notifications: [UIMutableUserNotificationAction],
        category: String = "mainCategory",
        type: UIUserNotificationType = .Alert | .Badge | .Sound) {
            // Notification category
            var mainCategory = UIMutableUserNotificationCategory()
            mainCategory.identifier = category
            
            let defaultActions = notifications
            let minimalActions = notifications
            
            mainCategory.setActions(defaultActions, forContext: .Default)
            mainCategory.setActions(minimalActions, forContext: .Minimal)
            
            // Configure notifications
            let notificationSettings = UIUserNotificationSettings(
                forTypes: type,
                categories: NSSet(objects: mainCategory) as Set<NSObject>)
    
            // Register notifications
            application.registerUserNotificationSettings(notificationSettings)
    }
    
    public func schedule(application: UIApplication, date: NSDate, body: String,
        title: String? = nil,
        indentifier: String? = nil,
        category: String = "mainCategory",
        badge: Int = 0,
        sound: String? = UILocalNotificationDefaultSoundName,
        removeDuplicates: Bool = false) {
            
        // De-dup previous notifications if applicable
        if let id = indentifier where removeDuplicates {
            remove(application, id)
        }
        
        // Initialize and configure notification
        var notification = UILocalNotification()
        notification.category = category
        notification.alertTitle = title
        notification.alertBody = body
        notification.fireDate = dateTimeService.incrementDayIfPast(date)
        notification.applicationIconBadgeNumber = badge
        notification.soundName = sound
        
        // Provide unique identifier for later use
        if let id = indentifier {
            notification.userInfo = ["indentifier": id]
        }
        
        application.scheduleLocalNotification(notification)
    }
    
    public func remove(application: UIApplication, _ indentifier: String) {
        if let notifications = application.scheduledLocalNotifications {
            for item in notifications {
                var notification = item as! UILocalNotification
                
                // Find matching to delete
                if let userInfo = notification.userInfo as? [String: String]
                    where userInfo["indentifier"] == indentifier {
                    // Cancel notification
                    application.cancelLocalNotification(notification)
                }
            }
        }
    }
    
}
