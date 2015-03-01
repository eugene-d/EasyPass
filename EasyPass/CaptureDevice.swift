import AVFoundation
import UIKit

/*!
 @class CaptureDevice
*/
public class CaptureDevice: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    
    /*!
     @property captureSession
    
     @brief
        Stored propery for AVCaptureSession instance.
    */
    private var captureSession: AVCaptureSession!
    
    /*!
     @property captureOutputDestination
    
     @brief
        Strored propery for EasyPassViewController instance.
    */
    public weak var captureOutputDestination: EasyPassViewController?
    
    /*!
     @property previewLayer
    
     @brief
        Computed property to get AVCaptureVideoPreviewLayer layer.
    */
    public var previewLayer: AVCaptureVideoPreviewLayer {
        get {
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            return previewLayer
        }
    }
    
    public override init() {
        super.init()
        captureSession = AVCaptureSession()
        inputDeviceForSession()
        
        if availableInputDevices().count > 0 {
            outputDeviceForSession()
        }
    }
    
    /*!
     @method availableInputDevices
    
     @brief
        Get available input devices.
    
     @return
        An Array with available input devices.
    */
    public func availableInputDevices() -> [AnyObject] {
        return captureSession.inputs
    }
    
    /*!
     @method startScanning
    
     @brief
        Start capturing video and scanning an object.
    */
    public func startScanning() {
        if availableInputDevices().count > 0 {
            captureSession.startRunning()
        }
    }

    /*!
     @method captureOutput:captureOutput:fromConnection
    
     @brief
        Conform AVCaptureMetadataOutputObjectsDelegate delegate.
    */
    public func captureOutput(captureOutput: AVCaptureOutput!,
        didOutputMetadataObjects metadataObjects: [AnyObject]!,
        fromConnection connection: AVCaptureConnection!) {
            
        var frame: CGRect = CGRectZero
        var message: String?
        
        if metadataObjects != nil || metadataObjects.count != 0 {
            let metadataObj = metadataObjects[0] as AVMetadataMachineReadableCodeObject
            
            if metadataObj.type == AVMetadataObjectTypeQRCode {
                let barCodeObject  = self.previewLayer.transformedMetadataObjectForMetadataObject(metadataObj as AVMetadataMachineReadableCodeObject) as AVMetadataMachineReadableCodeObject
                frame = barCodeObject.bounds;
                //                highlightQRCodeFrameView.frame = barCodeObject.bounds
                
                message = metadataObj.stringValue
            }
            
            captureOutputDestination?.highlightQRCodeFrameView.frame = frame
        }
    }
    
    /*!
     @method inputDeviceForSession
    
     @brief
        Create capture session with input devices.
    */
    private func inputDeviceForSession() {
        var error: NSError?
        let videoCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let inputDevice = AVCaptureDeviceInput.deviceInputWithDevice(videoCaptureDevice,
            error: &error) as AVCaptureInput!
        
        if error == nil {
            if captureSession.canAddInput(inputDevice) {
                captureSession.addInput(inputDevice)
            }
        } else {
            println("\(error!.localizedDescription)")
        }
    }
    
    /*!
     @method inputDeviceForSession
    
     @brief
        Add outputs to capture session and set delegate for output metadata.
    */
    private func outputDeviceForSession() {
        let captureMetadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(captureMetadataOutput) {
            captureSession.addOutput(captureMetadataOutput)
            
            if captureMetadataOutput.availableMetadataObjectTypes.count > 0 {
                captureMetadataOutput.setMetadataObjectsDelegate(self,
                    queue: dispatch_get_main_queue())
                captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            }
        }
    }
}
