import UIKit
import Then
import SnapKit

public class HumanTableViewCell: UITableViewCell {

    public static let cellIdentifier: String = "HumanTableViewCell"
    let cellBackgroundView = UIView()
    let profileImage = UIImageView().then {
        $0.layer.cornerRadius = 48/2
        $0.backgroundColor = .GrayScale.gray200
    }
    let userNameLabel = UILabel().then {
        $0.font = .pretendardFont(.semibold, size: 16)
        $0.text = "홍길동"
    }
    let detailLabel = UILabel().then {
        $0.font = . pretendardFont(.regular, size: 14)
        $0.text = "읽지 않은 메시지가 있음"
    }

    public func setup() {
        self.selectionStyle = .none
        addView()
        setLayout()
    }
    private func addView() {
        addSubview(cellBackgroundView)
        [
            profileImage,
            userNameLabel,
            detailLabel
        ].forEach { cellBackgroundView.addSubview($0) }
    }
    private func setLayout() {
        cellBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.greaterThanOrEqualTo(detailLabel.snp.bottom).offset(31)
            $0.bottom.equalToSuperview()
        }
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(48)
        }
        userNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(profileImage.snp.centerY)
            $0.leading.equalTo(profileImage.snp.trailing).offset(8)
            $0.height.equalTo(22)
        }
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom)
            $0.leading.equalTo(profileImage.snp.trailing).offset(8)
            $0.height.equalTo(20)
        }
    }
}
