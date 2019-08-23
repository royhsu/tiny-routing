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

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        
        button.setTitle("Present", for: .normal)
        
        button.addTarget(
            self,
            action: #selector(presentRed),
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
    func presentRed(_ sender: UIButton) {
        
        Presenter<UIViewController> { destinationViewController, completion in
            
            self.present(
                destinationViewController,
                animated: true,
                completion: completion
            )
            
        }
        .start(
            Route {
                
                let redViewController = UIViewController()
                
                redViewController.view.backgroundColor = .red
                
                return redViewController
            
            }
                .onArrive { print("Red!") }
        )
        
    }

}
