import UIKit
import SnapKit
import Then
import DesignSystem

public class EmailLoginViewController: BaseReactorViewController<EmailLoginReactor> {
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
    private let emailTextField = EmotingTextField(placeholder: "이메일")
    private let passwordTextField = EmotingTextField(placeholder: "비밀번호")
    private let loginButton = UIButton(type: .system).then {
        $0.backgroundColor = .Main.main500
        $0.layer.cornerRadius = 12
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .pretendardFont(.semibold, size: 18)
    }

    public override func configureNavigation() {
        self.navigationItem.hidesBackButton = true
    }

    public override func addView() {
        [
            titleLabel,
            subTitleLabel,
            emailTextField,
            passwordTextField,
            loginButton
        ].forEach(view.addSubview(_:))
    }

    public override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.topMargin.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(56)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(23)
        }
        emailTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(51)
            $0.height.equalTo(57)
        }
        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(emailTextField.snp.bottom).offset(54)
            $0.height.equalTo(57)
        }
        loginButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(54)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
