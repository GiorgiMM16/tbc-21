import UIKit

class CustomTableViewCell: UITableViewCell {
    var countryName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO-Medium", size: 14)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(countryName)

        NSLayoutConstraint.activate([
            countryName.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            countryName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            countryName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}
