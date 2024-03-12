import UIKit
import SnapKit
import Then
import DesignSystem

public class ChatCollectionViewCell: BaseCollectionViewCell<Chat> {

    static let identifier: String = "ChatCollectionViewCell"
    let senderChatView = SenderChatView()
    let reciveChatView = RecivedChatView()

    public override func adapt(model: Chat) {
        if model.isMine {
            senderChatView.isHidden = false
            reciveChatView.isHidden = true
        } else {
            senderChatView.isHidden = true
            reciveChatView.isHidden = false
        }
    }

    public override func addView() {
        [
            senderChatView,
            reciveChatView
        ].forEach { addSubview($0) }
    }
    public override func setLayout() {
        senderChatView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        reciveChatView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
}
