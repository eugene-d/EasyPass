import Quick
import Nimble
import EasyPass
import UIKit

class EasyPassViewControllerTests: QuickSpec {
    class FakeCaptureDevice: CaptureDevice {
        var startCaptureWasCalled = false
        var frameToHighlightQRCodeWasCalled = false
        
        override func startScanning() {
            self.startCaptureWasCalled = true
        }
        
        private func frameToHighlightQRCode() {
            var frameToHighlightQRCodeWasCalled = true
        }
    }
    
    class FakeQRCodeFrameView: QRCodeFrameView {
        var higligtedBoxWasCalled = false
        
        override func highlightBox() -> UIView {
            higligtedBoxWasCalled = true
            return self
        }
    }
    
    override func spec() {
        describe("EasyPassViewController controller") {
            var viewContrller: EasyPassViewController!
            
            beforeEach {
                viewContrller = EasyPassViewController()
            }

            it("should provide viewDidLoad method") {
                expect(viewContrller.viewDidLoad).toNot(beNil())
            }
            
            it("should set itself as delegate to capture device") {
                viewContrller.viewDidLoad()
                expect(viewContrller.captureDevice.captureOutputDestination)
                    .to(beAKindOf(EasyPassViewController))
            }
            
            it("should start scanning QR-code") {
                viewContrller.captureDevice = FakeCaptureDevice()
                viewContrller.viewDidLoad()
                expect((viewContrller.captureDevice as
                    FakeCaptureDevice).startCaptureWasCalled).to(beTruthy())
            }
            
            it("should create frame to highlight QR code") {
                viewContrller.highlightQRCodeFrameView = FakeQRCodeFrameView()
                viewContrller.viewDidLoad()
                expect((viewContrller.highlightQRCodeFrameView as
                    FakeQRCodeFrameView).higligtedBoxWasCalled).to(beTruthy())
            }
        }
    }
}
