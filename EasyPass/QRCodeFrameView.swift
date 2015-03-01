import UIKit

/*!
 @class QRCodeFrameView
*/
public class QRCodeFrameView: UIView {
    
    /*!
     @method highlightBox
    
     @brief
        Add higlighted border to frame
    
     @return
        Class instance
    */
    public func highlightBox() -> UIView {
        layer.borderColor = UIColor.greenColor().CGColor
        layer.borderWidth = 2
        return self
    }
}