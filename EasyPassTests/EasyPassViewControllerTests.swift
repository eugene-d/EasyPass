import Quick
import Nimble
import EasyPass

class EasyPassViewControllerTests: QuickSpec {
    class FakeCaptureDevice: CaptureDevice {
        var startCaptureWasCalled = false
        
        override func startScanning() {
            self.startCaptureWasCalled = true
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
            
            it("should start scanning QR-code") {
                
                viewContrller.captureDevice = FakeCaptureDevice()
                viewContrller.viewDidLoad()
                expect((viewContrller.captureDevice as
                    FakeCaptureDevice).startCaptureWasCalled).to(beTruthy())
            }
        }
    }
}
