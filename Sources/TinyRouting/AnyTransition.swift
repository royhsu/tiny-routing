// MARK: - AnyTransition

public struct AnyTransition {
    
    enum TransitionSource {
        
        case system(SystemTransition)
        
    }
    
    private(set) var source: TransitionSource
    
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

// MARK: - Animation

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
