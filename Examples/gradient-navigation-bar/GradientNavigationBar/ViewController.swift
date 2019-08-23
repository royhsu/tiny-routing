//
//  ViewController.swift
//  GradientNavigationBar
//
//  Created by Roy Hsu on 22/06/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Approach 1
        // issue: should re-generate background image when rotating the device to match the new navigation bar size
        //        if let navigationBar = navigationController?.navigationBar {
        //
        //            typealias GradientColor = UIImage.GradientColor
        //
        //            let gradientImage = UIImage.gradient(
        //                size: navigationBar.bounds.size,
        //                colors: [
        //                    GradientColor(color: .red, location: 0.0),
        //                    GradientColor(color: .green, location: 1.0)
        //                ]
        //            )
        //
        //            navigationBar.setBackgroundImage(gradientImage, for: .default)
        //
        //        }
        
        // Approach 2
        // issue: won't affect the background of the status bar.
        //        if let navigationBar = navigationController?.navigationBar {
        //
        //            gradientLayer.frame = CGRect(
        //                x: 0.0,
        //                y: 0.0,
        //                width: navigationBar.bounds.size.width,
        //                height: navigationBar.bounds.size.height
        //            )
        //
        //            gradientLayer.colors = [
        //                UIColor(red: 3.0 / 255.0, green: 63.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0).cgColor,
        //                UIColor(red: 4.0 / 255.0, green: 107.0 / 255.0, blue: 149.0 / 255.0, alpha: 1.0).cgColor
        //            ]
        //
        //            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        //
        //            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        //
        //            navigationBar.layer.insertSublayer(gradientLayer, at: 0)
        //
        //        }
        
        // Approach 3
        // Reference: https://stackoverflow.com/questions/41047540/setting-gradient-both-on-navigation-bar-and-status-bar
        
        if let navigationBar = navigationController?.navigationBar {
            
            //Make navigation bar transparent
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.isTranslucent = true
            
            let backgroundGradientView = UIView(
                frame: CGRect(
                    x: 0,
                    y: 0,
                    width: navigationBar.bounds.size.width,
                    height: navigationBar.frame.origin.y + navigationBar.bounds.size.height
                )
            )
            
            gradientLayer.frame = backgroundGradientView.bounds
            
            gradientLayer.colors = [
                UIColor(red: 3.0 / 255.0, green: 63.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0).cgColor,
                UIColor(red: 4.0 / 255.0, green: 107.0 / 255.0, blue: 149.0 / 255.0, alpha: 1.0).cgColor
            ]
            
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
            
            backgroundGradientView.layer.insertSublayer(gradientLayer, at: 0)
            
            navigationController?.view.insertSubview(backgroundGradientView, belowSubview: navigationBar)
            
        }
        
        // todo: use an animation to fix gradient resizing appearance when rotating the device
        
    }
    
}

