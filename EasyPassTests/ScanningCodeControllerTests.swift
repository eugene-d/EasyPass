import Quick
import Nimble
import EasyPass
import UIKit

class ScanningCodeControllerTests: QuickSpec {
    
    let controllerIdentifier = "ScanningCodeController"
    
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
        describe("Scanning Code Controller") {
            var controller: ScanningCodeController!
            
            beforeEach {
                let storyboard = UIStoryboard(name: "Main",
                    bundle: NSBundle.mainBundle())
                controller = storyboard.instantiateViewControllerWithIdentifier(self.controllerIdentifier) as ScanningCodeController
            }
            
            it("it shoud be UIViewController") {
                expect(controller).to(beAKindOf(UIViewController))
            }
            
            it("should set itself as delegate to capture device") {
                controller.viewDidLoad()
                expect(controller.captureDevice.captureOutputDestination)
                    .to(beAnInstanceOf(ScanningCodeController))
            }
            
            it("should start scanning QR-code") {
                controller.captureDevice = FakeCaptureDevice()
                controller.viewDidLoad()
                expect((controller.captureDevice as
                    FakeCaptureDevice).startCaptureWasCalled).to(beTruthy())
            }
            
            it("should create frame to highlight QR code") {
                controller.highlightQRCodeFrameView = FakeQRCodeFrameView()
                controller.viewDidLoad()
                expect((controller.highlightQRCodeFrameView as
                    FakeQRCodeFrameView).higligtedBoxWasCalled).to(beTruthy())
            }
        }
    }
}