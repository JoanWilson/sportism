import UIKit

final class SportsDetailViewController: UIViewController {

    private var viewModel: SportsDetailViewModel
    private var contentView: SportsDetailView

    init(viewModel: SportsDetailViewModel) {
        self.viewModel = viewModel
        self.contentView = SportsDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func loadView() {
        super.loadView()
        self.view = contentView
        self.contentView.viewModel.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = viewModel.sport.strSport
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

}

extension SportsDetailViewController: SportsDetailViewModelDelegate {
    func popToRootView() {
        self.navigationController?.popViewController(animated: true)
    }
}
