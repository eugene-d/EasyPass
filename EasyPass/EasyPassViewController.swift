import UIKit

/*!
 @class EasyPassViewController
*/
public class EasyPassViewController: UIViewController {
    
    func scanCode(sender: UIBarButtonItem) {
        performSegueWithIdentifier("Scanning", sender: nil)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: NSLocalizedString("Scan Code", comment: ""),
            style: .Plain,
            target: self,
            action: "scanCode:")
    }
}