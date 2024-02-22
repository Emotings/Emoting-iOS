import UIKit
import Then
import SnapKit
import TextFieldEffects

public class EmotingTextField: HoshiTextField {
//    public let textField = HoshiTextField().then {
//        $0.placeholderLabel.textColor = .System.gray2
//        $0.textColor = .black
//    }
    public init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholderLabel.textColor = .System.gray2
        self.textColor = .black
        self.placeholder = placeholder
        self.placeholderFontScale = self.isTextDropActive ? 0.8 : 1
        self.placeholderColor = .System.gray2
        self.placeholderLabel.text = placeholder
        self.placeholderLabel.font = .emotingFont(.caption(.regular))
        self.placeholderLabel.textColor = .System.gray2
        self.borderActiveColor = .Main.main500
        self.borderInactiveColor = .System.gray1
        self.borderStyle = .line
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
