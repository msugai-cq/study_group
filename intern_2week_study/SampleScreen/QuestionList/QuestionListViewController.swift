import UIKit

final class QuestionListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var items: [QuestionItem] = []
    
    override func viewDidLoad() {
        let question1ViewController = R.storyboard.question1.instantiateInitialViewController()!
        let item = QuestionItem(string: "Q1", viewController: question1ViewController)
        items.append(item)
        
        let question2ViewController = R.storyboard.question2.instantiateInitialViewController()!
        let item2 = QuestionItem(string: "Q2", viewController: question2ViewController)
        items.append(item2)
        
        tableView.register(R.nib.questionListCell)
        tableView.reloadData()
    }
}

extension QuestionListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.questionListCell, for: indexPath),
            let item = items[safe: indexPath.row] else { return UITableViewCell() }

        cell.set(item)
        return cell
    }
}

extension QuestionListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = items[safe: indexPath.row]?.viewController else { return }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
