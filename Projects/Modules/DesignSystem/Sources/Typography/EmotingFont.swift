import UIKit

public extension UIFont {
    static func emotingFont(_ font: EmotingFontStyle) -> UIFont {
        font.uiFont()
    }
}

extension EmotingFontStyle {
    func lineHeight() -> CGFloat {
        switch self {
        case .titleLg:
            return 36

        case .titleMd:
            return 31.2

        case .titleSm:
            return 26

        case .textLg:
            return 25.2

        case .textMd:
            return 22.4

        case .textSm:
            return 19.6

        case .caption:
            return 16.8
        }
    }

    func uiFont() -> UIFont {
        switch self {
        case let .titleLg(size):
            return size.emotingFontSize(size: 30)

        case let .titleMd(size):
            return size.emotingFontSize(size: 26)

        case let .titleSm(size):
            return size.emotingFontSize(size: 20)

        case let .textLg(size):
            return size.emotingFontSize(size: 18)

        case let .textMd(size):
            return size.emotingFontSize(size: 16)

        case let .textSm(size):
            return size.emotingFontSize(size: 14)

        case let .caption(size):
            return size.emotingFontSize(size: 12)
        }
    }

    func size() -> CGFloat {
        switch self {
        case .titleLg:
            return 30

        case .titleMd:
            return 26

        case .titleSm:
            return 20

        case .textLg:
            return 18

        case .textMd:
            return 16

        case .textSm:
            return 14

        case .caption:
            return 12
        }
    }
}
