import Quick
import Nimble
import EasyPass
import UIKit

extension UIBarButtonItem {
    func specsSimulateTap () {
        UIApplication.sharedApplication()
            .sendAction(self.action, to: self.target, from: self, forEvent: nil)
    }
}

class EasyPassViewControllerTests: QuickSpec {
    
    let controllerIdentifier = "EasyPassViewController"
    
    override func spec() {
        describe("EasyPassViewController controller") {
            var controller: EasyPassViewController!
            
            beforeEach {
                let storyboard = UIStoryboard(name: "Main",
                    bundle: NSBundle.mainBundle())
                
                controller = storyboard.instantiateViewControllerWithIdentifier(self.controllerIdentifier) as EasyPassViewController
                UIApplication.sharedApplication().keyWindow?.rootViewController = controller
            }

            describe("right bar button item") {
                var barButtonItem: UIBarButtonItem!
                
                beforeEach {
                    barButtonItem = controller.navigationItem.rightBarButtonItem
                }
                
                it("should have a title") {
                    expect(barButtonItem.title).to(equal(NSLocalizedString("Scan Code", comment: "")))
                }
                
                describe("when it is tapped") {
                    beforeEach {
                        barButtonItem.specsSimulateTap()
                    }
                    
                    it("should tell the controller to perform the segue") {
                        expect(controller.presentedViewController).to(beAnInstanceOf(ScanningController))
                    }
                }
            }
        }
    }
}
