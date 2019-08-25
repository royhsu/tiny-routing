// MARK: - Animation

public struct Animation {
   
    private(set) var source: Source?
    
}

// MARK: - Source

extension Animation {

   enum Source {
       
       case system(SystemAnimation)
       
   }
    
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
