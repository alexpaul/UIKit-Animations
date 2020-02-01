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

## Setting a UITabBarController as the root view controller for an app programmatically in the SceneDelegate

```swift 
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
  // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
  // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
  guard let windowScene = (scene as? UIWindowScene) else { return }
  window = UIWindow(frame: UIScreen.main.bounds)
  window?.windowScene = windowScene
  window?.rootViewController = AnimationsTabController()
  window?.makeKeyAndVisible()
}
```

## UIKit animatable properties 

1. frame
2. bounds
3. center
4. transform
5. alpha
6. backgroundColor
7. contentStretch

## CALayer animatable properties 

<details> 
  <summary>CALayer animatable properties</summary> 
<ul> 
  <li>anchorPoint</li>
  <li>backgroundColor</li>
  <li>backgroundColorFilters</li>
  <li>borderColor</li>
  <li>borderWidth</li>
  <li>bounds</li>
  <li>compositingFilter</li>
  <li>contents</li>
  <li>contentRect</li>
  <li>cornerRadius</li>
  <li>doubleSided</li>
  <li>filters</li>
  <li>hidden</li>
  <li>mask</li>
  <li>maskToBounds</li>
  <li>opacity</li>
  <li>position</li>
  <li>shadowColor</li>
  <li>shadowOffset</li>
  <li>shadowPath</li>
  <li>shadowRadius</li>
  <li>sublayers</li>
  <li>sublayerTransform</li>
  <li>transform</li>
  <li>zPosition</li>
</ul> 
</details>

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

## Reading resources 

1. [Animation properties in UIKit](https://developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/AnimatingViews/AnimatingViews.html)
1. [Animation properties on a CALayer](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html)
1. [UIView.animate with duration methods](https://developer.apple.com/documentation/uikit/uiview/1622418-animate)
1. [UIView.transition animations](https://developer.apple.com/documentation/uikit/uiview/1622574-transition)
1. [UIViewPropertyAnimator](https://developer.apple.com/documentation/uikit/uiviewpropertyanimator)
1. [UIView animate key frames](https://developer.apple.com/documentation/uikit/uiview/1622552-animatekeyframes)

![degrees and radians](https://www.1728.org/degrees.png)

