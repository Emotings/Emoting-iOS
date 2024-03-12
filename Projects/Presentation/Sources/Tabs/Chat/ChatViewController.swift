import UIKit
import SnapKit
import Then
import DesignSystem

public class ChatViewController: BaseReactorViewController<ChatReactor> {

    private let titleLabel = UILabel().then {
        $0.text = "채팅 목록"
        $0.font = .pretendardFont(.semibold, size: 20)
    }
    private let chatTableView = UITableView().then {
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        $0.register(HumanTableViewCell.self, forCellReuseIdentifier: HumanTableViewCell.cellIdentifier)
    }

    public override func addView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        [
            titleLabel,
            chatTableView
        ].forEach { view.addSubview($0) }
    }
    public override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(26)
        }
        chatTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HumanTableViewCell()
        cell.setup()
        return cell
    }
}
