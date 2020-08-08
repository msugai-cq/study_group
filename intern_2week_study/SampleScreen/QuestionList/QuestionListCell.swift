import UIKit

struct QuestionItem {
    var string: String
    var viewController: UIViewController
}

final class QuestionListCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewController: UIViewController?
    
    func set(_ item: QuestionItem) {
        titleLabel.text = item.string
        self.viewController = item.viewController
    }
}
