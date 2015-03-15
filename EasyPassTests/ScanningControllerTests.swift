import Quick
import Nimble
import EasyPass
import UIKit

class ScanningControllerTests: QuickSpec {
    
    let controllerIdentifier = "ScanningController"
//    let viewControllerIdentifier = "ScanningCodeController"
//    let navigationControllerIdentifier = "TabBarToScanningHistoryController"
    
    override func spec() {
        describe("Scanning Tab Bar Controller") {
            var controller: ScanningController!
            
            beforeEach {
                let storyboard = UIStoryboard(name: "Main",
                    bundle: NSBundle.mainBundle())
                controller = storyboard.instantiateViewControllerWithIdentifier(self.controllerIdentifier) as ScanningController
                UIApplication.sharedApplication().keyWindow?.rootViewController = controller
            }
            
            it("it shoud be UITabBarController") {
                expect(controller).to(beAKindOf(UITabBarController))
            }
            
            it("should has 2 tab view controllers") {
                expect(controller.viewControllers?.count).to(equal(2))
            }
            
            context("when first view controller is select") {
                let title1 = NSLocalizedString("Scan Code",  comment: "")
                it("navigation title should be \(title1)") {
                    let vc = controller.viewControllers?[0] as ScanningCodeController
                    controller.tabBarController(controller, didSelectViewController: vc)
                    expect(controller.navigationItem.title).to(equal(title1))
                }
                
                let title2 = NSLocalizedString("Scanning History", comment: "")
                it("navigation title should be \(title2)") {
                    let vc = controller.viewControllers?[1] as UINavigationController
                    controller.tabBarController(controller, didSelectViewController: vc)
                    expect(controller.navigationItem.title).to(equal(title2))
                }
            }
        }
    }
}