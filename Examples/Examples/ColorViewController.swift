//
//  ColorViewController.swift
//  Examples
//
//  Created by Roy Hsu on 2019/8/23.
//  Copyright © 2019 TinyWorld. All rights reserved.
//

// MARK: - ColorViewController

import TinyRouting
import UIKit

class ColorViewController: UIViewController {

    let rootHost: RootHost
    
    init(rootHost: RootHost) {
        
        self.rootHost = rootHost
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let colors: [UIColor] = [
            .red,
            .orange,
            .blue,
            .purple,
            .darkGray,
            .brown,
            .magenta,
        ]
        
        view.backgroundColor = colors.randomElement()
        
        let button = UIButton(type: .system)
        
        button.setTitle("Next", for: .normal)
        
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(
            self,
            action: #selector(showNext),
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
    func showNext(_ sender: UIButton) {
        
        rootHost
            .transition(
                AnyTransition
                    .flipFromBottom
                    .animation(.linear(duration: 2.0))
            )
            .start(
                Route(destination: makeNextViewController)
            )
        
//        presenter.start(Route(destination: makeNextViewController))
        
    }
    
    private func makeNextViewController() -> UIViewController {
        
        return ColorViewController(rootHost: rootHost)
        
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
