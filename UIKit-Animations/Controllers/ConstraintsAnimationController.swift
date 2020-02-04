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
  @IBOutlet weak var upButton: UIButton!
  @IBOutlet weak var downButton: UIButton!
  
  let screen: CGRect = UIScreen.main.bounds
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    upButton.layer.cornerRadius = 6.0
    downButton.layer.cornerRadius = 6.0
  }
  
  @IBAction func animateViewUp(_ sender: UIButton) {
    buttonAnimation(sender)
    
    // constraint view upward movement
    if box.frame.origin.y < screen.origin.y { return }
    
    viewYConstraint.constant -= 100 // negative value to move up
    
    springAnimation()
  }
  
  private func springAnimation() {
    // when we change the constraints in iOS and we need this change to be animated we only need to animate self.view.layoutIfNeeded and the animation will take place
    
    // layoutIfNeeded will get called as the view is marked "dirty" by iOS when a constraint change is detected
    UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: [.curveEaseIn], animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
  
  private func buttonAnimation(_ sender: UIButton) {
    UIView.animate(withDuration: 0.3, animations: {
      //
      sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }) { (done) in
      sender.transform = CGAffineTransform.identity
    }
  }
  
  
  @IBAction func animateViewDown(_ sender: UIButton) {
    buttonAnimation(sender)
    
    // constraint view downward movement
    if box.frame.origin.y > screen.size.height * 0.9 { return }
    
    viewYConstraint.constant += 100 // positive value to go down
    
    springAnimation()
  }
  
}
