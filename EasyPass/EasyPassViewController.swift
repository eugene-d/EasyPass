import UIKit

public class EasyPassViewController: UIViewController {
    
    lazy public var captureDevice = CaptureDevice()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(captureDevice.previewLayer)
        captureDevice.startScanning()
    }
}