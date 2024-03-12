import UIKit
import Then
import SnapKit
import RxSwift
import DesignSystem

public class ChatRoomViewController: BaseReactorViewController<ChatRoomReactor> {

    private let chatSendButton = UIButton().then {
        $0.setImage(UIImage.emotingImage(.sendFill), for: .normal)
        $0.sizeToFit()
    }
    private let chatTextField = UITextField().then {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .GrayScale.gray75
        $0.addLeftView()
        $0.addRightView()
    }
    private let chatCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        $0.register(
            ChatCollectionViewCell.self,
            forCellWithReuseIdentifier: ChatCollectionViewCell.identifier
        )
    }
    public override func bindAction() { }
    public override func configureNavigation() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = ""
    }

    public override func addView() {
        [
            chatCollectionView,
            chatTextField
        ].forEach { view.addSubview($0) }
        chatTextField.addSubview(chatSendButton)
    }
    public override func setLayout() {
        chatCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(chatTextField.snp.top)
        }
        chatSendButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(24)
        }
        chatTextField.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }
}

extension ChatRoomViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: chatCollectionView.frame.size.width,
            height: 108
        )
    }
}
