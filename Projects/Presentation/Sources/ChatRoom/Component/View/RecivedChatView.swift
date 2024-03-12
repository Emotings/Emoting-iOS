import UIKit
import SnapKit
import Then
import DesignSystem

class RecivedChatView: UIView {

    let userImageView = UIImageView().then {
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .black
        $0.sizeToFit()
    }
    let userNameLabel = UILabel().then {
        $0.font = .pretendardFont(.regular, size: 14)
        $0.textColor = .GrayScale.gray900
    }
    let emojiBackgroundView = UIView().then {
        $0.backgroundColor = .GrayScale.gray50
        $0.roundCorners(
            cornerRadius: 12,
            maskedCorners: [
                .layerMinXMaxYCorner,
                .layerMaxXMaxYCorner,
                .layerMaxXMinYCorner
            ]
        )
    }
    let emojiImageView = UIImageView().then {
        $0.backgroundColor = .black
        $0.sizeToFit()
    }
    let dateLabel = UILabel().then {
        $0.font = .pretendardFont(.medium, size: 11)
        $0.textColor = .GrayScale.gray75
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        [
            userImageView,
            userNameLabel,
            emojiBackgroundView,
            dateLabel
        ].forEach { addSubview($0) }
        emojiBackgroundView.addSubview(emojiImageView)
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(24)
        }
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.top)
            $0.leading.equalTo(userImageView.snp.trailing).offset(8)
            $0.height.equalTo(20)
        }
        emojiBackgroundView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(userNameLabel)
            $0.width.equalTo(108)
            $0.height.equalTo(100)
        }
        emojiImageView.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        dateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(emojiBackgroundView.snp.trailing).offset(8)
            $0.height.equalTo(13)
        }
    }
}
