import UIKit
import SwiftUI

final class SportsDetailHeaderView: UIView {

    lazy var sportsHeaderImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.darkOverlay(alpha: 0.3)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()
    }

}

extension SportsDetailHeaderView: ViewCoding {
    func setupView() {
        self.backgroundColor = .systemGray
    }

    func setupHierarchy() {
        self.addSubview(sportsHeaderImage)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.sportsHeaderImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportsHeaderImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sportsHeaderImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.sportsHeaderImage.heightAnchor.constraint(equalToConstant: 198),
        ])
    }

}
