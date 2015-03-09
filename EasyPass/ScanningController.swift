import UIKit

protocol ScanningViewController: class {
    /*!
     @method Add tabBarItem to a ciew and cofigure it.
    */
    func addTabBarItem()
}

public class ScanningController: UITabBarController, UITabBarControllerDelegate {
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.tabBarController?.delegate = self
        self.delegate = self
    }
    
    public func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        tabBarController.navigationItem.title = viewController.title
    }
}