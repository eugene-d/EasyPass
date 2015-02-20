import AVFoundation

public class CaptureDevice: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    
    private var captureSession: AVCaptureSession!
    
    public var previewLayer: AVCaptureVideoPreviewLayer {
        get {
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            return previewLayer
        }
    }
    
    override public init() {
        super.init()
        captureSession = AVCaptureSession()
        inputDeviceForSession()
        
        if availableInputDevices().count > 0 {
            outputDeviceForSession()
        }
    }
    
    public func availableInputDevices() -> [AnyObject] {
        return captureSession.inputs
    }
    
    public func startScanning() {
        if availableInputDevices().count > 0 {
            captureSession.startRunning()
        }
    }
    
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
