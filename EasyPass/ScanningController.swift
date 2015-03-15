import UIKit

protocol ScanningViewController: class {
    /*!
     @method Add tabBarItem to a view and cofigure it.
    */
    func addTabBarItem()
}

public class ScanningController: UITabBarController, UITabBarControllerDelegate {
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.tabBarController?.delegate = self
        self.delegate = self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if viewControllers?.count > 0 {
            self.navigationItem.title = viewControllers?[0].title
        }
    }
    
    public func tabBarController(tabBarController: UITabBarController,
        didSelectViewController viewController: UIViewController) {
        var destination = viewController
        
        if let vc = destination as? UINavigationController {
            destination = vc.visibleViewController
        }
        
        tabBarController.navigationItem.title = destination.title
    }
}