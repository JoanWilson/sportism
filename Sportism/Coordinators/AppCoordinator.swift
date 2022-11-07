import Foundation
import UIKit

public final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    public func start() {
        let navigationController = UINavigationController()
        let sportsListCoordinator = SportsListCoordinator(navigationController: navigationController)

        sportsListCoordinator.start()
        self.childCoordinators.append(sportsListCoordinator)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}
