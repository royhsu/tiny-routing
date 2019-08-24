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

#endif

enum SystemTransitionKind {
    
    case flipFromLeft
    
    case flipFromRight
    
    case flipFromTop
    
    case flipFromBottom
    
    case curlUp
    
    case curlDown
    
}

struct SystemTransition {
    
    var kind: SystemTransitionKind
    
    var animation: SystemAnimation?
    
}

public struct AnyTransition {
    
    enum TransitionSource {
        
        case system(SystemTransition)
        
    }
    
    private(set) var source: TransitionSource
    
}

extension RootHost {
    
    public func transition(_ transition: AnyTransition) -> RootHost {
        
        var rootHost = self
        
        rootHost.transition = transition
        
        return rootHost
        
    }
    
}

extension AnyTransition {
    
    public static var flipFromLeft: AnyTransition {
        
        return AnyTransition(
            source: .system(SystemTransition(kind: .flipFromLeft))
        )
        
    }
    
    public static var flipFromRight: AnyTransition {
        
        return AnyTransition(
            source: .system(SystemTransition(kind: .flipFromRight))
        )
        
    }
    
    public static var flipFromTop: AnyTransition {
        
        return AnyTransition(
            source: .system(SystemTransition(kind: .flipFromTop))
        )
        
    }
    
    public static var flipFromBottom: AnyTransition {
        
        return AnyTransition(
            source: .system(SystemTransition(kind: .flipFromBottom))
        )
        
    }
    
    public static var curlUp: AnyTransition {
        
        return AnyTransition(
            source: .system(SystemTransition(kind: .curlUp))
        )
        
    }
    
    public static var curlDown: AnyTransition {
        
        return AnyTransition(
            source: .system(SystemTransition(kind: .curlDown))
        )
        
    }
    
}

extension AnyTransition {
    
    public func animation(_ animation: Animation) -> AnyTransition {
        
        var transition = self
        
        switch transition.source {
            
        case var .system(systemTransition):
            
            systemTransition.animation = animation.source.map { source in
                
                switch source {
                    
                case let .system(animation): return animation
                    
                }
                
            }

            transition.source = .system(systemTransition)
            
        }
        
        return transition
        
    }
    
}

public struct Animation {
    
    enum Source {
        
        case system(SystemAnimation)
        
    }

    private(set) var source: Source?
    
}

extension Animation {
    
    public static func easeIn(duration: Double) -> Animation {
        
        return Animation(source: .system(.easeIn(duration: duration)))
        
    }
    
    public static func easeInOut(duration: Double) -> Animation {
        
        return Animation(source: .system(.easeInOut(duration: duration)))
        
    }
    
    public static func easeOut(duration: Double) -> Animation {
        
        return Animation(source: .system(.easeOut(duration: duration)))
        
    }
    
    public static func linear(duration: Double) -> Animation {
        
        return Animation(source: .system(.easeOut(duration: duration)))
        
    }
    
}

enum SystemAnimation {

    case easeIn(duration: Double)
    
    case easeInOut(duration: Double)
    
    case easeOut(duration: Double)
    
    case linear(duration: Double)

}
