import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTab()
    }

    private func setTab() {
        let sampleSearchViewController: UINavigationController = R.storyboard.sampleSearch.instantiateInitialViewController()!
        let questionListViewController: UINavigationController = R.storyboard.questionList.instantiateInitialViewController()!

        setViewControllers([sampleSearchViewController, questionListViewController], animated: false)
    }
}
