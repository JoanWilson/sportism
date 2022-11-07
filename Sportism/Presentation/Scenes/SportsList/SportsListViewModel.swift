import Foundation
import UIKit

public class SportsListViewModel {
    var sports: ObservableObject<[Sport]> = ObservableObject([])
    var filteredSports: ObservableObject<[Sport]> = ObservableObject([])

    public var client: SportsClientProtocol
    public let coordinator: SportsListCoordinator

    init(client: SportsClientProtocol, coordinator: SportsListCoordinator) {
        self.client = client
        self.coordinator = coordinator
        self.downloadAllSports()
    }

    func filterSports(by searchText: String) {
        self.filteredSports.value = searchText.isEmpty ? sports.value : self.sports.value.filter {
            $0.strSport.lowercased().contains(searchText.lowercased())
        }
    }

    public func downloadAllSports() {
        client.fetchSports { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let sports):
                self.filteredSports.value = sports.sports.sorted { $0.strSport < $1.strSport }
                self.sports.value = sports.sports.sorted { $0.strSport < $1.strSport }
            case .failure(let error):
                print(error)
            }
        }
    }

    public func getSportsLength() -> Int {
        return self.filteredSports.value.count
    }

    public func getSportByIndex(index: Int) -> Sport {
        return self.filteredSports.value[index]
    }

    public func getAllSport() -> [Sport] {
        return self.sports.value
    }

    public func makeSportsTableViewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let sportsCell = tableView.dequeueReusableCell(
            withIdentifier: SportsTableViewCell.indentifier,
            for: indexPath
        ) as? SportsTableViewCell else {
            return UITableViewCell()
        }
        let sports: [Sport] = self.filteredSports.value
        sportsCell.setSport(with: sports[indexPath.row])
        sportsCell.selectionStyle = .none
        return sportsCell
    }

    public func makeViewHeaderForTableViewSection() -> UIView {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    public func showCellDetail(index: Int) {
        self.coordinator.showDetail(for: self.filteredSports.value[index])
    }

}
