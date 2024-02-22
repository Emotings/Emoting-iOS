import Foundation
import UIKit

public enum EmotingFontStyle {
    case titleLg(EmotingFontSize)
    case titleMd(EmotingFontSize)
    case titleSm(EmotingFontSize)
    case textLg(EmotingFontSize)
    case textMd(EmotingFontSize)
    case textSm(EmotingFontSize)
    case caption(EmotingFontSize)
}

public enum EmotingFontSize {
    case regular
    case semibold
    case extrabold
}

extension EmotingFontSize {
    func emotingFontSize(size: CGFloat) -> UIFont {
        let pretendard = DesignSystemFontFamily.Pretendard.self
        switch self {
        case .regular:
            return pretendard.regular.font(size: size)
        case .semibold:
            return pretendard.semiBold.font(size: size)
        case .extrabold:
            return pretendard.extraBold.font(size: size)
        }
    }
}
