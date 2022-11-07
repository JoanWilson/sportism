import Foundation
import UIKit

enum SportsDetailComponentsFactory {
    case aboutView
    case headerView
}

extension SportsDetailComponentsFactory {
    func build(viewModel: SportsDetailViewModel) -> UIView {
        switch self {
        case .aboutView:
            return buildAboutView(viewModel: viewModel)
        case .headerView:
            return buildHeadertView(viewModel: viewModel)
        }
    }
}

extension SportsDetailComponentsFactory {
    private func buildAboutView(viewModel: SportsDetailViewModel) -> UIView {

        let view = SportsDetailAboutView()
        view.sportDescriptionLabel.text = viewModel.sport.strSportDescription
        view.translatesAutoresizingMaskIntoConstraints = false
        

        return view
    }

    private func buildHeadertView(viewModel: SportsDetailViewModel) -> UIView {

        let headerView = SportsDetailHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        guard let url = URL(string: viewModel.sport.strSportThumb) else {
            return headerView
        }
        headerView.sportsHeaderImage.load(url: url)
        return headerView
    }
}
