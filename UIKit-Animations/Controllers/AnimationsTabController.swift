//
//  AnimationsTabController.swift
//  UIKit-Animations
//
//  Created by Alex Paul on 1/31/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class AnimationsTabController: UITabBarController {
  
  private lazy var sampleAnimationsVC: SampleAnimationController = {
    let viewcontroller = SampleAnimationController()
    viewcontroller.tabBarItem = UITabBarItem(title: "Sample Animations", image: UIImage(systemName: "1.circle"), tag: 0)
    return viewcontroller
  }()
  
  private lazy var constraintsAnimationVC: ConstraintsAnimationController = {
    // ConstraintsAnimationController instance from storyboard
    
    // step 1: get instance of storboard
    let constraintsAnimationStoryboard = UIStoryboard(name: "ConstraintsAnimation", bundle: nil)
    
    // step 2: instantiate view controller from storyboard instance
    guard let viewcontroller =  constraintsAnimationStoryboard.instantiateViewController(identifier: "ConstraintsAnimationController") as? ConstraintsAnimationController else {
      fatalError("could not load ConstraintsAnimationController")
    }
    viewcontroller.tabBarItem = UITabBarItem(title: "Constraints Animation", image: UIImage(systemName: "2.circle"), tag: 1)
    return viewcontroller
  }()
  
  private lazy var transtionAnimationsVC: TransitionAnimationsController = {
    
    // step 1: get instance of storboard
    let constraintsAnimationStoryboard = UIStoryboard(name: "TransitionAnimations", bundle: nil)
    
    // step 2: instantiate view controller from storyboard instance
    guard let viewcontroller =  constraintsAnimationStoryboard.instantiateViewController(identifier: "TransitionAnimationsController") as? TransitionAnimationsController else {
      fatalError("could not load TransitionAnimationsController")
    }
    viewcontroller.tabBarItem = UITabBarItem(title: "Transitions", image: UIImage(systemName: "3.circle"), tag: 2)
    return viewcontroller
  }()
  
  private lazy var propertyAnimatorVC: PropertyAnimatorController = {
    
    // step 1: get instance of storboard
    let storyboard = UIStoryboard(name: "PropertyAnimator", bundle: nil)
    
    // step 2: instantiate view controller from storyboard instance
    guard let viewcontroller =  storyboard.instantiateViewController(identifier: "PropertyAnimatorController") as? PropertyAnimatorController else {
      fatalError("could not load PropertyAnimatorController")
    }
    viewcontroller.tabBarItem = UITabBarItem(title: "Property Animator", image: UIImage(systemName: "4.circle"), tag: 3)
    return viewcontroller
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // set viewcontrollers for the tab bar
    // in our app we will have two tabs
    viewControllers = [sampleAnimationsVC, constraintsAnimationVC, transtionAnimationsVC, propertyAnimatorVC]
  }
}
