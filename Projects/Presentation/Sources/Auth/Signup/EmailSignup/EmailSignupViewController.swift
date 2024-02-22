import UIKit
import SnapKit
import Then
import DesignSystem
import RxSwift
import RxCocoa

public class EmailSignupViewController: BaseReactorViewController<EmailSignupReactor> {
    private let titleLabel = UILabel().then {
        $0.text = "이메일을 입력해주세요"
        $0.textColor = .black
        $0.font = .pretendardFont(.semibold, size: 26)
    }
    private let emailTextField = EmotingTextField(placeholder: "이메일")
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
            .map { EmailSignupReactor.Action.nextButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }

    public override func addView() {
        [
            titleLabel,
            emailTextField,
            nextButton
        ].forEach(view.addSubview(_:))
    }

    public override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.topMargin.equalToSuperview().inset(40)
            $0.leading.equalToSuperview().inset(20)
        }
        emailTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(44)
            $0.height.equalTo(57)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(54)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
