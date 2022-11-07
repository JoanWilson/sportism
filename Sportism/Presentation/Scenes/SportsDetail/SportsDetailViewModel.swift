import Foundation

protocol SportsDetailViewModelDelegate: AnyObject {
    func popToRootView()
}

class SportsDetailViewModel {

    private var coreDataManager: CoreDataManager!

    weak var delegate: SportsDetailViewModelDelegate?

    public var sport: Sport

    init(sport: Sport) {
        self.sport = sport
        self.coreDataManager = CoreDataManager()
    }

    @objc func backToSportsListView() {
        delegate?.popToRootView()
    }

    public func addSportToFavorites() {
        self.coreDataManager.addFavoriteSport(sport: self.sport)
    }

    public func downloadFavoriteSports() -> [FavoriteSport] {
        let favorites = coreDataManager.fetchAllFavorites()
        return favorites
    }

    public func removeSportFromFavorites() {
        self.coreDataManager.deleteAFavoriteSport(self.sport)
    }

    public func deleteAllFavoriteSports() {
        self.coreDataManager.deleteAllFavoriteSports()
    }
}
