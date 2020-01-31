//
//  AnimationsTabController.swift
//  UIKit-Animations
//
//  Created by Alex Paul on 1/31/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class AnimationsTabController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // set viewcontrollers for the tab bar
    // in our app we will have two tabs
    
    viewControllers = [SampleAnimationController(), ConstraintsAnimationController()]
  }
  
}
