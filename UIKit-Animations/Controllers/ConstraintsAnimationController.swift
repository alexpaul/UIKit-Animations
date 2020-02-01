//
//  ConstraintsAnimationController.swift
//  UIKit-Animations
//
//  Created by Alex Paul on 1/31/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class ConstraintsAnimationController: UIViewController {
  
  
  @IBOutlet weak var viewYConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var box: UIView!
  
  let screen: CGRect = UIScreen.main.bounds
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
  }
  
  
  @IBAction func animateViewUp(_ sender: UIButton) {
    // animate button
    
    UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [], animations: {
      //
      sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }) { (done) in
      sender.transform = CGAffineTransform.identity
    }
    
    // negative value to move up
    
    // constraint view upward movement to top of device, where y = 0
    // outlet to the blue box
    
    // TODO: determine if view.frame.origin.y == 0 { return }
    print("box y origin: \(box.frame.origin.y)")
    print("screen y origin: \(screen.origin.y)")
    
    if box.frame.origin.y < screen.origin.y { return }
    
    viewYConstraint.constant -= 100
    
    // when we change the constraints in iOS and we need this change to be animated we only need to animate self.view.layoutIfNeeded and the animation will take place
    
    // layoutIfNeeded will get called as the view is marked "dirty" by iOS, we implementing self.view.layoutIfNeeded in the animation block will cause the animation
    
    UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: [.curveEaseIn], animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
  
  
  @IBAction func animateViewDown(_ sender: UIButton) {
    // positive value to go down
    
    print("box y origin: \(box.frame.origin.y)")
    print("screen y origin: \(screen.origin.y)")
    
    if box.frame.origin.y > screen.size.height * 0.9 { return }
  
    viewYConstraint.constant += 100
    
    UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: [.curveEaseInOut], animations: {
         self.view.layoutIfNeeded()
       }, completion: nil)
  }
  
}
