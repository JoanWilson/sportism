import Foundation
import UIKit

public final class SportsListCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []

    public let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func start() {
        let sportsClient = SportsClient()
        let sportsListViewModel = SportsListViewModel(client: sportsClient, coordinator: self)
        let sportsListViewController = SportsListViewController(viewModel: sportsListViewModel)
        navigationController.setViewControllers([sportsListViewController], animated: false)
    }

    public func showDetail(for sport: Sport) {
        let sportsDetailViewModel = SportsDetailViewModel(sport: sport)
        let sportsDetailViewController = SportsDetailViewController(viewModel: sportsDetailViewModel)
        navigationController.pushViewController(sportsDetailViewController, animated: true)

    }

}
