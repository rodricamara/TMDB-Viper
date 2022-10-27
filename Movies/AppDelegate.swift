//
//  AppDelegate.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import UIKit
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        let initialVC = MoviesListViewController(dictionary: nil)
        let navController = UINavigationController(rootViewController: initialVC)
        self.window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}
