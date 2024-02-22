import UIKit

public extension UIButton {
    func setEmotingText(_ text: String, font: EmotingFontStyle, color: UIColor) {
        self.setTextWithLineHeight(text: text, font: font, color: color)
        self.titleLabel?.font = .emotingFont(font)
        self.setTitleColor(color, for: .normal)
    }
}

extension UIButton {
    func setTextWithLineHeight(text: String, font: EmotingFontStyle, color: UIColor) {
        let style = NSMutableParagraphStyle()
        style.maximumLineHeight = font.lineHeight()
        style.minimumLineHeight = font.lineHeight()
        style.lineBreakMode = .byTruncatingTail

        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: style,
            .baselineOffset: (font.lineHeight() - font.size()) / 4,
            .foregroundColor: color
        ]

        let attrString = NSMutableAttributedString(string: text, attributes: attributes)
        self.titleLabel?.attributedText = attrString
        self.setTitle(text, for: .normal)
    }
}
