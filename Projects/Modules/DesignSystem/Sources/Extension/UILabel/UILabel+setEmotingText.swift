import UIKit

public extension UILabel {
    func setEmotingText(_ text: String, font: EmotingFontStyle, color: UIColor) {
        self.setTextWithLineHeight(text: text, font: font, color: color)
        self.font = .emotingFont(font)
    }
}

extension UILabel {
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
        self.attributedText = attrString
    }
}
