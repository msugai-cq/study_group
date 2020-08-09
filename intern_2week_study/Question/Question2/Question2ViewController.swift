import UIKit

final class Question2ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let sampleTexts: [String] = ["りんご", "ばなな", "ぶどう"]
}

extension Question2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示する行数を指定する
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 仮のセル
        return UITableViewCell()
    }
}

extension Question2ViewController: UITableViewDelegate {
    
}
