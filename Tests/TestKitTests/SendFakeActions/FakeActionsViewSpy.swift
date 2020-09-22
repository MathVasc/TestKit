import UIKit

final class FakeActionsViewSpy: UIView {

    let button: UIButton = UIButton()
    let senderButton: UIButton = UIButton()
    let tableView: TableViewSpy = TableViewSpy()
    let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    private(set) var isButtonActionCalled: Bool = false
    private(set) var isTableViewWillSelectRowAtCalled: Bool = false
    private(set) var isTableViewDidSelectRowAtCalled: Bool = false
    private(set) var isCollectionViewDidSelectRowAtCalled: Bool = false
    private(set)  var senderReceived: UIButton?

    func setButtonAction() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        senderButton.addTarget(self, action: #selector(senderButtonAction(_:)), for: .touchUpInside)
    }

    func setTableViewDelegate() {
        tableView.delegate = self
    }

    func setCollectionViewDelegate() {
        collectionView.delegate = self
    }

    @objc private func buttonAction() {
        isButtonActionCalled = true
    }

    @objc private func senderButtonAction(_ sender: UIButton) {
        senderReceived = sender
        isButtonActionCalled = true
    }

}

extension FakeActionsViewSpy: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        isTableViewWillSelectRowAtCalled = true
        return nil
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isTableViewDidSelectRowAtCalled = true
    }

}

final class TableViewSpy: UITableView {

    private(set) var isSelectRowCalled: Bool = false

    override func selectRow(at indexPath: IndexPath?, animated: Bool, scrollPosition: UITableView.ScrollPosition) {
        isSelectRowCalled = true
    }

}

extension FakeActionsViewSpy: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isCollectionViewDidSelectRowAtCalled = true
    }

}
