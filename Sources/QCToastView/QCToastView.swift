import UIKit

public class QCToastView {
    
    public init() {}
    
    public static let shared = QCToastView()
    
    private(set) public var font:UIFont = UIFont.systemFont(ofSize: 16)
    private(set) public var theme:ToastTheme = .dark
    private(set) public var displayTime:Double = 2.0
    
    /// shows a toast message at bottom  ( default: 2 seconds )
    /// - Parameters:
    ///   - message: a string value to be shown in toast
    ///   - vc: a ViewController where the toast is to be shown
    public func showToast(message: String, vc:UIViewController) {
        guard let view = vc.view.window else {
            return
        }

        view.subviews.forEach{$0.accessibilityLabel == "QCToast" ? $0.removeFromSuperview() : ()}
        
        let toastLbl = UILabel()
        toastLbl.numberOfLines = 0
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = font
        toastLbl.accessibilityLabel = "QCToast"
        
        switch theme {
        case .light:
            toastLbl.textColor = UIColor.black
            toastLbl.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        case .dark:
            toastLbl.textColor = UIColor.white
            toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        case .custom(textColor: let textColor, backgroundColor: let backgroundColor):
            toastLbl.textColor = textColor
            toastLbl.backgroundColor = backgroundColor.withAlphaComponent(0.6)
        }
                
        let textSize = toastLbl.intrinsicContentSize
        let labelHeight = ( textSize.width / view.frame.width ) * 30
        let labelWidth = min(textSize.width, view.frame.width - 40)
        let adjustedHeight = max(labelHeight, textSize.height + 20)
        
        toastLbl.frame = CGRect(x: 20, y: (view.frame.height - 90 ) - adjustedHeight, width: labelWidth + 20, height: adjustedHeight)
        toastLbl.center.x = view.center.x
        toastLbl.layer.cornerRadius = 10
        toastLbl.layer.masksToBounds = true
        
        view.addSubview(toastLbl)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + displayTime) {
            UIView.animate(withDuration: 1.0, animations: {
                toastLbl.alpha = 0
            }) { (_) in
                toastLbl.removeFromSuperview()
            }
        }
    }
    
    @discardableResult
    public func font(_ labelFont:UIFont) -> QCToastView {
        font = labelFont
        return self
    }
    @discardableResult
    public func theme(_ themeType:ToastTheme) -> QCToastView {
        theme = themeType
        return self
    }
    @discardableResult
    public func displayTime(_ time:Double) -> QCToastView {
        displayTime = time
        return self
    }
    
    public enum ToastTheme {
        case light
        case dark
        case custom(textColor:UIColor,backgroundColor:UIColor)
    }
}
