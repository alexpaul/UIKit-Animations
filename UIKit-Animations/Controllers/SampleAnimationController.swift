//
//  SampleAnimationController.swift
//  UIKit-Animations
//
//  Created by Alex Paul on 1/31/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SampleAnimationController: UIViewController {
  
  private let sampleAnimationsView = SampleAnimationView()
  
  override func loadView() {
    view = sampleAnimationsView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    scaleAnimation()
    //pulsatingAnimation()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    // function to reset defaults so animations start from their initial state when
    // the view controller return as the first responder and viewWillAppear gets called
    resetDefaultsForAnimation()
  }
  
  private func resetDefaultsForAnimation() {
    sampleAnimationsView.pursuitLogo.transform = CGAffineTransform.identity
    sampleAnimationsView.swiftLogo.layer.cornerRadius = 0
    sampleAnimationsView.pursuitLogo.alpha = 1.0
    sampleAnimationsView.swiftLogo.isHidden = true
  }
  
  private func scaleAnimation() {
    // properties we could animate
    /*
     - alpha
     - corner radius
     - position
     - center
     - transition
     - backgrounColor
     - shadow
     - opacity
     - tranform: scale, rotate, translate
     */
    
    // any transform value of 1.0 represents the identity of the view (original frame values)
    
    UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
      self.sampleAnimationsView.pursuitLogo.transform = CGAffineTransform(scaleX: 20.0, y: 20.0)
      self.sampleAnimationsView.pursuitLogo.alpha = 0.0
    }) { (done) in
      // gets called after initial animation is done
      UIView.animate(withDuration: 0.5) {
        self.sampleAnimationsView.swiftLogo.isHidden = false
        self.sampleAnimationsView.swiftLogo.layer.cornerRadius = self.sampleAnimationsView.swiftLogo.bounds.size.width / 2.0
      }
    }
  }
  
  private func pulsatingAnimation() {
    UIView.animate(withDuration: 0.3, delay: 0.0, options: [.repeat, .autoreverse], animations: {
      // animations block
      self.sampleAnimationsView.pursuitLogo.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }) { (done) in
      // code to be executed after animation is complete
      // options - you can reset view's values
      // options - create another animation
      
      UIView.animate(withDuration: 0.3) {
        self.sampleAnimationsView.pursuitLogo.transform = CGAffineTransform.identity // restores back to original state
      }
      
      // NB: if you want to go beyond creating an animation in this completion handler the better choice would be animateKeyFrames()
    }
  }
}
