//
//  ViewController.swift
//  Examples
//
//  Created by Roy Hsu on 2019/8/23.
//  Copyright © 2019 TinyWorld. All rights reserved.
//

import UIKit
import TinyRouting

class ViewController: UIViewController {

    let rootHost: RootHost<UIViewController>
    
    init(rootHost: RootHost<UIViewController>) {
        
        self.rootHost = rootHost
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        
        button.setTitle("Show destination", for: .normal)
        
        button.addTarget(
            self,
            action: #selector(showDestination),
            for: .touchUpInside
        )
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate(
            [
                view.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                view.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            ]
        )
        
    }
    
    @objc
    func showDestination(_ sender: UIButton) {
        
        presenter
            .start(
                Route(destination: makeDestinationViewController)
                    .onArrive { print("Destination arrvies!") }
            )
        
    }
    
    private func makeDestinationViewController() -> UIViewController {
           
        let redViewController = UIViewController()
        
        redViewController.view.backgroundColor = .red
        
        return redViewController
        
    }
    
    private var presenter: Presenter<UIViewController> {
        
        Presenter { destinationViewController, completion in

            self.present(
                destinationViewController,
                animated: true,
                completion: completion
            )

        }
        
    }

}
