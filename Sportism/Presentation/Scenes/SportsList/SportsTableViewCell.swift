import UIKit

final class SportsTableViewCell: UITableViewCell {

    static let indentifier: String = "SportsTableViewCell"
//    public var shadowColor: CGColor = UIColor.label.cgColor

    var sport: Sport? {
        didSet {
            sportsLabel.text = sport?.strSport
            guard let url = URL(string: sport!.strSportIconGreen) else {
                return
            }
            sportsIconImageView.load(url: url)
        }
    }

    public lazy var sportsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    public lazy var sportsIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.sportsIconImageView.image = UIImage()
    }

    public func setSport(with sport: Sport) {
        self.sport = sport
    }

}

extension SportsTableViewCell: ViewCoding {

    func setupView() {
    }

    func setupHierarchy() {
        self.addSubview(sportsIconImageView)
        self.addSubview(sportsLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            sportsIconImageView.heightAnchor.constraint(equalToConstant: 30),
            sportsIconImageView.widthAnchor.constraint(equalToConstant: 30),
            sportsIconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            sportsIconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            sportsLabel.leadingAnchor.constraint(equalTo: sportsIconImageView.trailingAnchor, constant: 30),
            sportsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            sportsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

    }

}
