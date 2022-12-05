//
//  AppDelegate.swift
//  PreviewerDocument
//
//  Created by HuyVuong on 05/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        File.copyResourcesToDocumentsIfNeeded()
        return true
    }
}

