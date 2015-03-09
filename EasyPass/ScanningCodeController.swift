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
        
        addTabBarItem()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.navigationItem.title =
            NSLocalizedString("Scan Code",  comment: "")
        
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
    
    public func addTabBarItem() {
        let tabBarItem = UITabBarItem(tabBarSystemItem: .Search, tag: 0)
        self.tabBarItem = tabBarItem
    }
}
