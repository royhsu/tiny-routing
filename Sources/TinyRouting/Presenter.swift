// MARK: - Presenter

public struct Presenter<Destination>: Router {
    
    public typealias Presentation = (
        _ destionation: Destination,
        _ completion: @escaping () -> Void
    )
    -> Void
    
    private let presentation: Presentation
    
    public init(presentation: @escaping Presentation) {
        
        self.presentation = presentation
        
    }
    
    public func start(_ route: Route<Destination>) {
        
        presentation(route.destination()) { route._onArrive?() }
        
    }
    
}
