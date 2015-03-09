import UIKit

/*!
 @class EasyPassViewController
*/
public class EasyPassViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: NSLocalizedString("Scan Code", comment: ""),
            style: .Plain,
            target: self,
            action: "scanCode:")
    }
    
    func scanCode(sender: UIBarButtonItem) {
        performSegueWithIdentifier("Scanning", sender: nil)
    }
}