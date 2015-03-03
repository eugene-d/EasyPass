import UIKit

/*!
 @class EasyPassViewController
*/
public class EasyPassViewController: UIViewController {
    
    /*!
     @method scanning
    
     @brief
        IBAction method to perform segue.
    */
    @IBAction public func scanning(sender: UIBarButtonItem) {
        performSegueWithIdentifier("Scanning", sender: nil)
    }
}