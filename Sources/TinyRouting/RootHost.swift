#if canImport(UIKit)

// MARK: - RootHost

import UIKit

public struct RootHost {
    
    private let window: () -> UIWindow
    
    private var transition: AnyTransition?
    
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
        
        var duration: Double?
        
        var options: UIView.AnimationOptions = [ .transitionFlipFromLeft ]
            
        switch transition?.source {
            
        case let .system(transition):
            
            switch transition.kind {
                
            case .flipFromLeft: options.insert(.transitionFlipFromLeft)
                
            case .flipFromRight: options.insert(.transitionFlipFromRight)
                
            case .flipFromTop: options.insert(.transitionFlipFromTop)
                
            case .flipFromBottom: options.insert(.transitionFlipFromBottom)
                
            case .curlUp: options.insert(.transitionCurlUp)
                
            case .curlDown: options.insert(.transitionCurlDown)
                
            }
            
            switch transition.animation {
                
            case let .easeIn(d):
                
                duration = d
                
                options.insert(.curveEaseIn)
                
            case let .easeInOut(d):
                
                duration = d
                
                options.insert(.curveEaseInOut)
                
            case let .easeOut(d):
                
                duration = d
                
                options.insert(.curveEaseOut)
                
            case let .linear(d):
                
                duration = d
                
                options.insert(.curveLinear)
                
            case .none: break
                
            }
            
        case .none: break
            
        }
        
        UIView.transition(
            with: currentWindow,
            duration: duration ?? 0.5,
            options: options,
            animations: {
                
                currentWindow.rootViewController = route.destination()
                
            },
            completion: { _ in route._onArrive?() }
        )
        
    }
    
}

// MARK: - Transition

extension RootHost {
    
    public func transition(_ transition: AnyTransition) -> RootHost {
        
        var rootHost = self
        
        rootHost.transition = transition
        
        return rootHost
        
    }
    
}

#endif
