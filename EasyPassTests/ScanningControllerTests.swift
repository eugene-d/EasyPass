import Quick
import Nimble
import EasyPass
import UIKit

class ScanningControllerTests: QuickSpec {
    override func spec() {
        describe("Scanning Tab Bar Controller") {
            var scanningController: ScanningController!
            
            beforeEach {
                scanningController = ScanningController()
            }
            it("it shoud be UITabBarController") {
                expect(scanningController).to(beAKindOf(UITabBarController))
            }
        }
    }
}