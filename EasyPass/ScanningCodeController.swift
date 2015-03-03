import UIKit

public class ScanningCodeController: UIViewController {
    /*!
     @property captureDevice
    
     @brief
        Stored propery for CaptureDevice instance.
    */
    lazy public var captureDevice = CaptureDevice()
    
    /*!
     @property highlightQRCodeFrameView
    
     @brief
        Stored propery for CaptureDevice QRCodeFrameView.
    */
    lazy public var highlightQRCodeFrameView = QRCodeFrameView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(captureDevice.previewLayer)
        captureDevice.captureOutputDestination = self
        captureDevice.startScanning()
        highlightQRCodeInFrame()
    }
    
    /*!
     @method highlightQRCodeInFrame
    
     @brief
        Add sub view with higlighted box.
    */
    private func highlightQRCodeInFrame() {
        highlightQRCodeFrameView.highlightBox()
        view.addSubview(highlightQRCodeFrameView)
    }
}
