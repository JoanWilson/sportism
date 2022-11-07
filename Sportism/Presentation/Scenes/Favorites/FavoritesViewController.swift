import UIKit

final class FavoritesViewController: UIViewController {

    private var contentView: FavoritesView!
    var viewModel: FavoritesViewModel!

    init(viewModel: FavoritesViewModel) {
        self.contentView = FavoritesView()
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func loadView() {
        super.loadView()
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationController()
        self.contentView.sportsTableView.delegate = self
        self.contentView.sportsTableView.dataSource = self
        self.addBinders()

    }

    private func addBinders() {
        self.viewModel.favoriteSports.bind { [weak self] _ in
            guard let self else { return }
            DispatchQueue.main.async {
                self.contentView.sportsTableView.reloadData()
            }
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.contentView.sportsTableView.reloadData()
    }

    public func configureNavigationController() {
        self.title = "Favorites"
    }

}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 3
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getSportsLength()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.viewModel.makeSportsTableViewCell(tableView: tableView, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showCellDetail(index: indexPath.row)

    }

    public func showCellDetail(index: Int) {
        let sport = self.viewModel.favoriteSports.value[index]
        let sportsDetailViewModel = SportsDetailViewModel(sport: sport)
        let sportsDetailViewController = SportsDetailViewController(viewModel: sportsDetailViewModel)
        navigationController?.pushViewController(sportsDetailViewController, animated: true)
    }

}
