import UIKit

final class QuestionListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var question1: QuestionItem = {
        let questionViewController = R.storyboard.question1.instantiateInitialViewController()!
        return QuestionItem(string: "課題1: Textfield, Button, TextView等の基礎", viewController: questionViewController)
    }()
    
    private lazy var question2: QuestionItem = {
        let questionViewController = R.storyboard.question2.instantiateInitialViewController()!
        return QuestionItem(string: "課題2: TableViewとCellの実装", viewController: questionViewController)
    }()
    
    private lazy var questionItems: [QuestionItem] = {
        return [question1, question2]
    }()
    
    override func viewDidLoad() {
        tableView.register(R.nib.questionListCell)
        tableView.reloadData()
    }
}

extension QuestionListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.questionListCell, for: indexPath),
            let item = questionItems[safe: indexPath.row] else { return UITableViewCell() }

        cell.set(item)
        return cell
    }
}

extension QuestionListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = questionItems[safe: indexPath.row]?.viewController else { return }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
