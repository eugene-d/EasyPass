import Quick
import Nimble
import EasyPass
import UIKit

class QRCodeFrameViewTests: QuickSpec {
    override func spec() {
        describe("QRCodeFrameView view") {
            var frameView: QRCodeFrameView!
            
            beforeEach {
                frameView = QRCodeFrameView()
            }
            
            it("should have highlightedBox method") {
                expect(frameView.respondsToSelector("highlightedBox")).toNot(beNil())
            }
            
            it("should shoud return UIView layer") {
                let layer = frameView.highlightBox();
                expect(layer).to(beAKindOf(UIView))
            }
        }
    }
}