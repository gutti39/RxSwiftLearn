//
//  AppDelegate.swift
//  RxSwiftLearn
//
//  Created by VEERA GUTTI on 26/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Enable adjustsFontSizeToFitWidth and adjustsFontForContentSizeCategory for UILabel
        UILabel.appearance().adjustsFontSizeToFitWidth = true
        UILabel.appearance().adjustsFontForContentSizeCategory = true

        // Enable adjustsFontSizeToFitWidth and adjustsFontForContentSizeCategory for UIButton
        UIButton.appearance().titleLabel?.adjustsFontSizeToFitWidth = true
        UIButton.appearance().titleLabel?.adjustsFontForContentSizeCategory = true

        // Enable adjustsFontSizeToFitWidth and adjustsFontForContentSizeCategory for UITextField
        UITextField.appearance().adjustsFontSizeToFitWidth = true
        UITextField.appearance().adjustsFontForContentSizeCategory = true

        // Enable adjustsFontForContentSizeCategory for UITextView
        UITextView.appearance().adjustsFontForContentSizeCategory = true

        // iOS 15 or later: Set maximum and minimum content size categories for UILabel, UIButton, UITextField, and UITextView
        if #available(iOS 15.0, *) {
            UILabel.appearance().maximumContentSizeCategory = .accessibilityLarge
            UILabel.appearance().minimumContentSizeCategory = .large
            
            UIButton.appearance().maximumContentSizeCategory = .accessibilityLarge
            UIButton.appearance().minimumContentSizeCategory = .large
            
            UITextField.appearance().maximumContentSizeCategory = .accessibilityLarge
            UITextField.appearance().minimumContentSizeCategory = .large
            
            UITextView.appearance().maximumContentSizeCategory = .accessibilityLarge
            UITextView.appearance().minimumContentSizeCategory = .large
        } else {
            // Fallback on earlier versions
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

