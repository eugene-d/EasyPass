import Quick
import Nimble
import EasyPass
import UIKit

class ScanningControllerTests: QuickSpec {
    
    let controllerIdentifier = "ScanningController"
    
    override func spec() {
        describe("Scanning Tab Bar Controller") {
            var controller: ScanningController!
            
            beforeEach {
                let storyboard = UIStoryboard(name: "Main",
                    bundle: NSBundle.mainBundle())
                controller = storyboard.instantiateViewControllerWithIdentifier(self.controllerIdentifier) as ScanningController
            }
            
            it("it shoud be UITabBarController") {
                expect(controller).to(beAKindOf(UITabBarController))
            }
        }
    }
}