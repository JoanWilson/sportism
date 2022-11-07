import UIKit

final class SportsListView: UIView {

    lazy var progressView: UIActivityIndicatorView = {
        let progressView = UIActivityIndicatorView()
        progressView.startAnimating()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.isHidden = false

        return progressView
    }()

    lazy var sportsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(SportsTableViewCell.self, forCellReuseIdentifier: SportsTableViewCell.indentifier)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true

        return tableView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.buildLayout()
    }

}

extension SportsListView: ViewCoding {

    func setupView() {
        self.backgroundColor = .white

    }

    func setupHierarchy() {
        self.addSubview(self.sportsTableView)
        self.addSubview(self.progressView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.sportsTableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.sportsTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.sportsTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            self.progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.progressView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
