//
//  PropertyAnimatorController.swift
//  UIKit-Animations
//
//  Created by Alex Paul on 2/4/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class PropertyAnimatorController: UIViewController {
  
  @IBOutlet weak var duckImage: UIImageView!
  
  @IBOutlet weak var slider: UISlider!
  
  // need an instance to a UIViewPropertyAnimator
  private var animator: UIViewPropertyAnimator!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // instantiate the animator property
    animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut, animations: {
      // here we declare the animation
      // perform a tranform
      self.duckImage.transform = CGAffineTransform(scaleX: 3.0, y: 1)
    })
  }
  
  @IBAction func sliderDidChange(_ sender: UISlider) {
    
    animator.fractionComplete = CGFloat(sender.value)
    
  }
  
  
}
