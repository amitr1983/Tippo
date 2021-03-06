//
//  AppDelegate.swift
//  Tippo
//
//  Created by amit kumar on 8/10/17.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let defaults:UserDefaults = UserDefaults.standard


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        changeNavigationColor()
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        defaults.set(NSDate(), forKey: "closeDate")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        resetSavedContent()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func changeNavigationColor() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 84.0/255.0, green: 199/255.0, blue: 253/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
    func compareDate() ->Double{
        var pastDate: NSDate? = nil
        
        if defaults.value(forKey: "closeDate") != nil {
            pastDate = defaults.value(forKey: "closeDate")! as? NSDate
        } else {
            pastDate=NSDate()
        }
        
        let difference = pastDate?.timeIntervalSinceNow
        return(abs(difference!))
    }
    
    func resetSavedContent() {
                let diff=compareDate()
                print(diff)
                if (diff > abs(600)) {
                    let appDomain = Bundle.main.bundleIdentifier!
                    defaults.removePersistentDomain(forName: appDomain)
                    
                }
    }
}




