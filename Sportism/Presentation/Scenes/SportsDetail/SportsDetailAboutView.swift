import UIKit
import SwiftUI

final class SportsDetailAboutView: UIView {
    private var coreDataManager = CoreDataManager()

    lazy var sportDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Field hockey is a team game of the hockey family. The earliest origins."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()

    }

}

extension SportsDetailAboutView: ViewCoding {

    func setupView() {
        self.backgroundColor = .clear
    }

    func setupHierarchy() {
        self.addSubview(sportDescriptionLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

            self.sportDescriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
            self.sportDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sportDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.sportDescriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }

}
