import UIKit

class HomePageViewController: UIViewController {
    var tableView = UITableView()
    var viewModel = HomePageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchDataAndUpdateUI()
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

    func fetchDataAndUpdateUI() {
        viewModel.fetchData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.countryName.text = viewModel.info?.list[indexPath.row].name
        cell.countryName.textColor = UIColor.purple
        cell.backgroundColor = UIColor.red
        cell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cell.topAnchor.constraint(equalTo: tableView.topAnchor),
            cell.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            cell.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            cell.leadingAnchor.constraint(equalTo: tableView.leadingAnchor)
        ])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.info?.countryNames.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
