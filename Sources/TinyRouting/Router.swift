// MARK: - Router

public protocol Router {
    
    associatedtype Destination
    
    func start(_ route: Route<Destination>)
    
}
