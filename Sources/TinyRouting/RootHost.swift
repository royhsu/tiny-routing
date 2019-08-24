#if canImport(UIKit)

// MARK: - RootHost

import UIKit

public struct RootHost {
    
    private let window: () -> UIWindow
    
    public init(window: @escaping () -> UIWindow) { self.window = window }
    
}

extension RootHost {
    
    public init(window: @autoclosure @escaping () -> UIWindow) {
        
        self.init { window() }
        
    }
    
}

// MARK: - Router

extension RootHost: Router {
    
    public func start(_ route: Route<UIViewController>) {
        
        let currentWindow = window()
        
        UIView.transition(
            with: currentWindow,
            duration: 0.5,
            options: [ .transitionFlipFromLeft ],
            animations: {
                
                currentWindow.rootViewController = route.destination()
                
            },
            completion: { _ in route._onArrive?() }
        )
        
    }
    
}

#endif
