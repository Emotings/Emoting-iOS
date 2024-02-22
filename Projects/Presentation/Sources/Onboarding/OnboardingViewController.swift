import UIKit
import SnapKit
import Then
import DesignSystem
import RxCocoa
import RxSwift

public class OnboardingViewController: BaseReactorViewController<OnboardingReactor> {
    private let titleLabel = UILabel().then {
        $0.text = "Emoting"
        $0.textColor = .white
        $0.font = .pretendardFont(.extrabold, size: 40)
    }

    public override func configureViewController() {
        self.view.backgroundColor = .Main.main500
    }
    public override func bindAction() {
        viewWillAppearPublisher.asObservable()
            .map { OnboardingReactor.Action.viewDidAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }

    public override func addView() {
        self.view.addSubview(titleLabel)
    }

    public override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
