import Quick
import Nimble
import EasyPass
import UIKit

class EasyPassViewControllerTests: QuickSpec {
    override func spec() {
        describe("EasyPassViewController controller") {
            var viewContrller: EasyPassViewController!
            
            beforeEach {
                viewContrller = EasyPassViewController()
            }

            it("should have scanning handler action") {
                expect(viewContrller.respondsToSelector("scanning:")).to(beTruthy())
            }
        }
    }
}
