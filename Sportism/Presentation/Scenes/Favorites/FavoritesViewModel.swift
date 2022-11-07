// swiftlint:disable line_length
import Foundation
import UIKit

final class FavoritesViewModel {

    var favoriteSports: ObservableObject<[Sport]> = ObservableObject([])
    var coreDataManager = CoreDataManager()

    init() {
        self.downloadFavoriteSports()
    }

    public func downloadFavoriteSports() {
        let favorites = coreDataManager.fetchAllFavorites()
        for index in favorites {
            let newFavorite = Sport(idSport: index.idSport!, strSport: index.strSport!, strFormat: StrFormat(rawValue: index.strFormat!)!, strSportThumb: index.strSportThumb!, strSportIconGreen: index.strSportIconGreen!, strSportDescription: index.strSportDescription!)
            self.favoriteSports.value.append(newFavorite)
        }
    }

    public func makeSportsTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let sportsCell = tableView.dequeueReusableCell(
            withIdentifier: SportsTableViewCell.indentifier,
            for: indexPath
        ) as? SportsTableViewCell else {
            return UITableViewCell()
        }
        let sports: [Sport] = self.favoriteSports.value
        sportsCell.setSport(with: sports[indexPath.row])
        sportsCell.selectionStyle = .none
        return sportsCell
    }

    public func getSportsLength() -> Int {
        return self.favoriteSports.value.count
    }

    public func makeViewHeaderForTableViewSection() -> UIView {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

}
