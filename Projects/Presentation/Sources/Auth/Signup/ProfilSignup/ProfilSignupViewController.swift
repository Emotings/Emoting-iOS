import UIKit
import SnapKit
import Then
import DesignSystem
import RxSwift
import RxCocoa

public class ProfilSignupViewController: BaseReactorViewController<ProfilSignupReactor> {
    private let titleLabel = UILabel().then {
        $0.text = "프로필을 등록해주세요"
        $0.textColor = .black
        $0.font = .pretendardFont(.semibold, size: 26)
    }
    private let afterButton = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = UIColor.Main.main500.cgColor
        $0.layer.borderWidth = 1
        $0.setTitle("나중에 하기", for: .normal)
        $0.setTitleColor(.Main.main500, for: .normal)
        $0.titleLabel?.font = .pretendardFont(.semibold, size: 18)
    }
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
            .map { ProfilSignupReactor.Action.nextButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }

    public override func addView() {
        [
            titleLabel,
            afterButton,
            nextButton
        ].forEach(view.addSubview(_:))
    }

    public override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.topMargin.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }
        afterButton.snp.makeConstraints {
            $0.bottom.equalTo(nextButton.snp.top).offset(-20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
