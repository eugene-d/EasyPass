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
                
                dispatch_async(dispatch_get_main_queue(), {
                    controller.loadView()
                })
            }
            
            it("it shoud be UITableViewController") {
                expect(controller).to(beAKindOf(UITableViewController))
            }
            
            it("should have table view subview") {
                let subviews = controller.view.subviews
                expect(controller.tableView).toNot(beNil())
            }
            
            context("table view controller") {
                let initialRows = 6
                it("should have \(initialRows) rows in sections") {
                    expect(controller.tableView(controller.tableView, numberOfRowsInSection: 0)).to(equal(initialRows))
                }
            }
        }
    }
}
