import UIKit
import SnapKit
import Then
import DesignSystem

class SenderChatView: UIView {

    let dateLabel = UILabel().then {
        $0.font = .pretendardFont(.medium, size: 11)
        $0.textColor = .GrayScale.gray400
    }
    let emojiBackgroundView = UIView().then {
        $0.backgroundColor = .Main.main500
        $0.roundCorners(
            cornerRadius: 12,
            maskedCorners: [
                .layerMinXMinYCorner,
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner
            ]
        )
    }
    let emojiImageView = UIImageView().then {
        $0.backgroundColor = .black
        $0.sizeToFit()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        [
            dateLabel,
            emojiBackgroundView
        ].forEach { addSubview($0) }
        emojiBackgroundView.addSubview(emojiImageView)
        emojiBackgroundView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(108)
            $0.height.equalTo(100)
        }
        emojiImageView.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        dateLabel.snp.makeConstraints {
            $0.bottom.equalTo(emojiImageView.snp.bottom)
            $0.trailing.equalTo(emojiImageView.snp.trailing)
            $0.height.equalTo(13)
        }
    }
}
