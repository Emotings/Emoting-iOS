import UIKit
import SnapKit
import Then
import DesignSystem
import RxSwift
import RxCocoa

public class PasswordSignupViewController: BaseReactorViewController<PasswordSignupReactor> {
    private let titleLabel = UILabel().then {
        $0.text = "비밀번호를 입력해주세요"
        $0.textColor = .black
        $0.font = .pretendardFont(.semibold, size: 26)
    }
    private let passwordTextField = EmotingTextField(placeholder: "비밀번호")
    private let passwordCheckTextField = EmotingTextField(placeholder: "비밀번호 재확인")
    private let nextButton = UIButton(type: .system).then {
        $0.backgroundColor = .Main.main500
        $0.layer.cornerRadius = 12
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .pretendardFont(.semibold, size: 18)
    }

    public override func configureNavigation() {
        self.navigationItem.title = "회원가입"
    }

    public override func bindAction() {
        nextButton.rx.tap.asObservable()
            .map { PasswordSignupReactor.Action.nextButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }

    public override func addView() {
        [
            titleLabel,
            passwordTextField,
            passwordCheckTextField,
            nextButton
        ].forEach(view.addSubview(_:))
    }

    public override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.topMargin.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(20)
        }
        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(44)
            $0.height.equalTo(57)
        }
        passwordCheckTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(54)
            $0.height.equalTo(57)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(54)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
