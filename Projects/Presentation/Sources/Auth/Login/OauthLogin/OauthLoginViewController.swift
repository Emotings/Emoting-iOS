import UIKit
import SnapKit
import Then
import DesignSystem
import RxSwift
import RxCocoa

public class OauthLoginViewController: BaseReactorViewController<OauthLoginReactor> {
    private let titleLabel = UILabel().then {
        $0.text = "Emoting"
        $0.textColor = .black
        $0.font = .pretendardFont(.semibold, size: 40)
    }
    private let subTitleLabel = UILabel().then {
        $0.text = "소통에 간단함을 더하다"
        $0.textColor = .black
        $0.font = .pretendardFont(.regular, size: 16)
    }
    private let logoImageView = UIImageView().then {
        $0.image = .emotingImage(.logo)
    }
    private let oauthStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 20
    }
    private let kakaoLoginButton = UIButton(type: .system).then {
        $0.setBackgroundImage(.emotingImage(.kakao), for: .normal)
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
    }
    private let naverLoginButton = UIButton(type: .system).then {
        $0.setBackgroundImage(.emotingImage(.naver), for: .normal)
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
    }
    private let googleLoginButton = UIButton(type: .system).then {
        $0.setBackgroundImage(.emotingImage(.google), for: .normal)
        $0.layer.cornerRadius = 24
        $0.clipsToBounds = true
    }
    private let emailStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
    }
    private let emailSignupButton = UIButton(type: .system).then {
        $0.setTitle("이메일 회원가입", for: .normal)
        $0.setTitleColor(.System.gray2, for: .normal)
    }
    private let lineView = UIView().then {
        $0.backgroundColor = .System.gray2
    }
    private let emailLoginButton = UIButton(type: .system).then {
        $0.setTitle("이메일 로그인", for: .normal)
        $0.setTitleColor(.System.gray2, for: .normal)
    }

    public override func bindAction() {
        emailLoginButton.rx.tap.asObservable()
            .map { OauthLoginReactor.Action.emailLoginButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        emailSignupButton.rx.tap.asObservable()
            .map { OauthLoginReactor.Action.emailSignupButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }

    public override func addView() {
        [
            titleLabel,
            subTitleLabel,
            logoImageView,
            oauthStackView,
            emailStackView
        ].forEach(view.addSubview(_:))
        [
            kakaoLoginButton,
            naverLoginButton,
            googleLoginButton
        ].forEach(oauthStackView.addArrangedSubview(_:))
        [
            emailSignupButton,
            lineView,
            emailLoginButton
        ].forEach(emailStackView.addArrangedSubview(_:))
    }

    public override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(189)
            $0.centerX.equalToSuperview()
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(28)
            $0.width.height.equalTo(160)
        }
        kakaoLoginButton.snp.makeConstraints {
            $0.width.height.equalTo(48)
        }
        naverLoginButton.snp.makeConstraints {
            $0.width.height.equalTo(48)
        }
        googleLoginButton.snp.makeConstraints {
            $0.width.height.equalTo(48)
        }
        oauthStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom).offset(40)
        }
        emailStackView.snp.makeConstraints {
            $0.top.equalTo(oauthStackView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        lineView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(18)
        }
    }
}
