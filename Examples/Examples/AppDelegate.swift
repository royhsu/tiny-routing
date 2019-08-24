//
//  AppDelegate.swift
//  Examples
//
//  Created by Roy Hsu on 2019/8/23.
//  Copyright © 2019 TinyWorld. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let viewController = ViewController(rootHost: RootHost(window: { self.window }))
        
        viewController.view.backgroundColor = .white
        
        window.rootViewController = viewController

        window.makeKeyAndVisible()
        
        return true
        
    }

}
