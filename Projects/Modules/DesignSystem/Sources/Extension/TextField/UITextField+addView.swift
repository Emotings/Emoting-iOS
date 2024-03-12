import UIKit

public extension UITextField {
    func addLeftView() {
        let leftView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 12,
                height: self.frame.height
            )
        )
        self.leftView = leftView
        self.leftViewMode = ViewMode.always
    }
    func addRightView() {
        let rightView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 50,
                height: self.frame.height
            )
        )
        self.rightView = rightView
        self.rightViewMode = ViewMode.always
    }
}
