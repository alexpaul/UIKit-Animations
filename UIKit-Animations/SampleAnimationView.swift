//
//  SampleAnimationView.swift
//  UIKit-Animations
//
//  Created by Alex Paul on 1/31/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SampleAnimationView: UIView {
  
  public lazy var pursuitLogo: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "pursuit-logo")
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  public lazy var swiftLogo: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "swift-logo")
    imageView.contentMode = .scaleAspectFit
    imageView.isHidden = true
    imageView.clipsToBounds = true
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  // only coming from Storyboard
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    setupPursuitLogoContraints()
    setupSwiftLogoContraints()
  }
  
  private func setupPursuitLogoContraints() {
    addSubview(pursuitLogo)
    pursuitLogo.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      pursuitLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
      pursuitLogo.centerYAnchor.constraint(equalTo: centerYAnchor),
      pursuitLogo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
      pursuitLogo.heightAnchor.constraint(equalTo: pursuitLogo.widthAnchor) // square
    ])
  }
  
  private func setupSwiftLogoContraints() {
    addSubview(swiftLogo)
    swiftLogo.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      swiftLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
      swiftLogo.centerYAnchor.constraint(equalTo: centerYAnchor),
      swiftLogo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
      swiftLogo.heightAnchor.constraint(equalTo: swiftLogo.widthAnchor) // square
    ])
  }
}
