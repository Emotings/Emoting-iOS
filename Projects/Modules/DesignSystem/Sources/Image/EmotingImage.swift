import UIKit
import Foundation

public extension UIImage {
    static func emotingImage(_ image: EmotingImage) -> UIImage {
        image.uiImage()
    }
}

public enum EmotingImage {
    case logo
    case kakao
    case naver
    case google
    case chat
    case humanPlus
    case store
    case userProfile
    case sendFill
}

extension EmotingImage {
    public func uiImage() -> UIImage {
        let dsImages = DesignSystemAsset.Images.self
        switch self {
        case .logo:
            return dsImages.logo.image

        case .kakao:
            return dsImages.kakao.image

        case .naver:
            return dsImages.naver.image

        case .google:
            return dsImages.google.image

        case .chat:
            return dsImages.chat.image

        case .humanPlus:
            return dsImages.humanPlus.image

        case .store:
            return dsImages.store.image

        case .userProfile:
            return dsImages.userProfile.image

        case .sendFill:
            return dsImages.sendFill.image
        }
    }
}
