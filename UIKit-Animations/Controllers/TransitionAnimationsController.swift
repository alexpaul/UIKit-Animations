//
//  TransitionAnimationsController.swift
//  UIKit-Animations
//
//  Created by Alex Paul on 2/4/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class TransitionAnimationsController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  // create tap gesture
  private lazy var tapGesture: UITapGestureRecognizer = {
    let gesture = UITapGestureRecognizer()
    gesture.addTarget(self, action: #selector(animate))
    return gesture
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // set default image
    imageView.image = UIImage(named: "dog")
    imageView.backgroundColor = .systemGreen
    
    // enable user interaction on the image view or a label as those two UI elements are set to false by default
    imageView.isUserInteractionEnabled = true
    
    // add gesture to the image view
    imageView.addGestureRecognizer(tapGesture)
  }
  
  @objc private func animate() {
    let duration: Double = 2.0 // seconds
    let curveOption: UIView.AnimationOptions = .curveEaseInOut
    
    // the four built-in bezier animation curves
    // curveEaseInOut
    // curveEaseIn
    // curveEaseOut
    // curveLinear
    
    if imageView.image == UIImage(named:"dog") {
      UIView.transition(with: imageView, duration: duration, options: [.transitionFlipFromRight, curveOption], animations: {
        // animation block go here
        self.imageView.image = UIImage(named: "cat")
        self.imageView.backgroundColor = .systemBlue
      }, completion: nil)
    } else {
      UIView.transition(with: imageView, duration: duration, options: [.transitionFlipFromLeft, curveOption], animations: {
        // animation block go here
        self.imageView.image = UIImage(named: "dog")
        self.imageView.backgroundColor = .systemGreen
      }, completion: nil)
    }
  }
  
}
