import Quick
import Nimble
import EasyPass
import AVFoundation

class CaptureDeviceTests: QuickSpec {
    
    class MockCaptureDevice: CaptureDevice {
        var inputDeviceForSessionWasCalled = false
        
        override func availableInputDevices() -> [AnyObject] {
            let devices = ["Camera"]
            return devices
        }
        
        override func startScanning() {
            if availableInputDevices().count > 0 {
                inputDeviceForSessionWasCalled = true
            }
        }
    }
    
    override func spec() {
        describe("Capture Device Model") {
            var сaptureDevice: MockCaptureDevice!
            
            beforeEach {
                сaptureDevice = MockCaptureDevice()
            }
            
            it("should have startScanning method") {
                expect(сaptureDevice.respondsToSelector("startScanning")).toNot(beNil())
            }
            
            it("should start capture video if input devide is available") {
                сaptureDevice.startScanning()
                expect((сaptureDevice as
                    MockCaptureDevice).inputDeviceForSessionWasCalled).to(beTruthy())
            }
            
            it("should provide previewLayer") {
                expect(сaptureDevice.previewLayer).to(beAKindOf(AVCaptureVideoPreviewLayer))
            }
            
            it("should should conform protocol") {
                expect(сaptureDevice.respondsToSelector("captureOutput")).toNot(beNil())
            }
        }
    }
}