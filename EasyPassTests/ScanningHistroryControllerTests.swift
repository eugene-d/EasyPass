import Quick
import Nimble
import EasyPass
import UIKit

class ScanningHistroryControllerTests: QuickSpec {
    
    let controllerIdentifier = "ScanningHistoryController"
    
    override func spec() {
        describe("Scanning Code Controller") {
            var controller: ScanningHistoryController!
            
            beforeEach {
                let storyboard = UIStoryboard(name: "Main",
                    bundle: NSBundle.mainBundle())
                controller = storyboard.instantiateViewControllerWithIdentifier(self.controllerIdentifier) as ScanningHistoryController
            }
            
            it("it shoud be UIViewController") {
                expect(controller).to(beAKindOf(UIViewController))
            }
        }
    }
}
