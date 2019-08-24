//
//  RootHost.swift
//  Examples
//
//  Created by Roy Hsu on 2019/8/24.
//  Copyright © 2019 TinyWorld. All rights reserved.
//

// MARK: - RootHost

import TinyRouting
import UIKit

struct RootHost<Destination> where Destination: UIViewController {
    
    private let window: () -> UIWindow
    
    init(window: @escaping () -> UIWindow) { self.window = window }
    
}

// MARK: - Router

extension RootHost: Router {
    
    public func start(_ route: Route<Destination>) {
        
//        let newRootViewController = route.destination()
        
        let mockViewController = UIViewController()
        
        mockViewController.view.backgroundColor = .blue
        
        let currentWindow = window()
        
        UIView.transition(
            with: currentWindow,
            duration: 0.5,
            options: .transitionFlipFromLeft,
            animations: {
        
                currentWindow.rootViewController = mockViewController
                
            },
            completion: nil
        )
        
//        route()._onArrive?()
        
    }
    
}
