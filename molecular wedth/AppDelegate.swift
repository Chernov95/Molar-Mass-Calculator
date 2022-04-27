//
//  AppDelegate.swift
//  molecular wedth
//
//  Created by Filip Cernov on 14/01/2020.
//  Copyright © 2020 Filip Cernov. All rights reserved.
//

//import UIKit
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//var window: UIWindow?
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        countUserLaunches()
//
//
//        return true
//    }
//
//    func countUserLaunches() {
//        var appLaunches = UserDefaults.standard.integer(forKey: "appLaunches")
//        appLaunches += 1
//        UserDefaults.standard.set(appLaunches, forKey: "appLaunches")
//    }
//
//    // MARK: UISceneSession Lifecycle
////
////    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
////        // Called when a new scene session is being created.
////        // Use this method to select a configuration to create the new scene with.
////        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
////    }
////
////    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
////        // Called when the user discards a scene session.
////        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
////        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
////    }
//
//
//}



import SwiftUI

@main
struct MolecularMassCalculatorApp: App {
   
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
