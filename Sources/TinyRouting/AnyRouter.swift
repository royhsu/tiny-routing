// MARK: - AnyRouter

public struct AnyRouter<Destination> {
    
    private let _start: (Route<Destination>) -> Void
    
    public init<R>(_ router: R)
    where
        R: Router,
        R.Destination == Destination { self._start = router.start }
    
}

// MARK: - Router

extension AnyRouter: Router {
    
    public func start(_ route: Route<Destination>) { _start(route) }
    
}
