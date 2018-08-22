//
//  AppDelegate.swift
//  TestSwift
//
//  Created by Amit Bhonsle on 22/05/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        NotificationCenter.default.addObserver(self, selector: #selector(screenShotCaptured), name: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
        
        if #available(iOS 11.0, *) {
            NotificationCenter.default.addObserver(self, selector: #selector(screenCaptureChanged), name: NSNotification.Name.UIScreenCapturedDidChange, object: nil)
        } else {
            // Fallback on earlier versions
        }
        return true
    }
    
    @objc func screenCaptureChanged() {
      
            if #available(iOS 11.0, *) {
                let isCaptured = UIScreen.main.isCaptured
                if isCaptured {
                    print("Some one capturing your screen")
                }else{
                    print("Something happen with UI Screen so its state changed.")
                }
            } else {
                // Fallback on earlier versions
            }
            
            
        
    }
    
    @objc func screenShotCaptured() {
        
        let blankImage = UIImageView.init(frame: (self.window?.bounds)!)
        blankImage.backgroundColor = .blue
        
        self.window?.addSubview(blankImage)
        let globalQueue = DispatchQueue.global()
        
        let additionalTime: DispatchTimeInterval = .seconds(2)
        
        globalQueue.asyncAfter(deadline: .now() + additionalTime) {
            DispatchQueue.main.async {
                blankImage.removeFromSuperview()
            }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

