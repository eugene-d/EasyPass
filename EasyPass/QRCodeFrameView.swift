import UIKit

public class QRCodeFrameView: UIView {
    public func highlightedBox() -> UIView {
        layer.borderColor = UIColor.greenColor().CGColor
        layer.borderWidth = 2
        return self
    }
}