import UIKit

public class ScanningCodeController: UIViewController, ScanningViewController {
    
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
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.title =
            NSLocalizedString("Scan Code",  comment: "")
        
        addTabBarItem()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        captureDevice.previewLayer.frame = view.layer.bounds
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
        view.bringSubviewToFront(highlightQRCodeFrameView)
    }
    
    internal func addTabBarItem() {
        let tabBarItem = UITabBarItem(tabBarSystemItem: .Search, tag: 0)
        self.tabBarItem = tabBarItem
    }
}
