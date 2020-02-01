# UIKit-Animations

Adding a programmatic UITabBarController and working with UIKit Animations. 

![uikit animations](Assets/uikitanimations.gif)

## Setting up a UITabBarController subclass and setting its relationship view controllers 

```swift 
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // set viewcontrollers for the tab bar
    // in our app we will have two tabs
    viewControllers = [sampleAnimationsVC, constraintsAnimationVC]
  }
}
```

## Adding transformm and layer animations to a view 

```swift 
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
```

## Adding constraints based animations 

```swift 
@IBOutlet weak var viewYConstraint: NSLayoutConstraint!
```

> When we change the constraints in iOS and we need this change to be animated we only need to animate   self.view.layoutIfNeeded and the animation will take place

**layoutIfNeeded** will get called as the view is marked "dirty" by iOS when a constraint change is detected
```swift 
UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: [.curveEaseIn], animations: {
  self.view.layoutIfNeeded()
}, completion: nil)
```
