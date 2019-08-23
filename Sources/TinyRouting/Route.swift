// MARK: - Destination

public struct Route<Destination> {
    
    let destination: () -> Destination
    
    private(set) var _onArrive: (() -> Void)?
    
    public init(destination: @escaping () -> Destination) {
        
        self.destination = destination
        
    }
    
}

extension Route {
    
    public init(destination: @autoclosure @escaping () -> Destination) {
        
        self.init { destination() }
        
    }
    
}

extension Route {
    
    public func onArrive(perform: (() -> Void)? = nil) -> Route {
        
        var route = self
        
        route._onArrive = perform
        
        return route
        
    }
    
}

