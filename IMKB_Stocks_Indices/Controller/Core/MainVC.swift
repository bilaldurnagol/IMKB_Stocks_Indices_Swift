//
//  MainVC.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 5.05.2021.
//

import UIKit

class MainVC: UIViewController {
    
    private let searchController: UISearchController = {
        let vc = UISearchController(searchResultsController: SearchResultsVC())
        vc.searchBar.placeholder = "Ara"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        vc.searchBar.sizeToFit()
        return vc
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StocksTableViewCell.self, forCellReuseIdentifier: StocksTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "IMKB Hisse Senetleri/Endeksler"
        view.backgroundColor = .systemBackground
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension MainVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: StocksTableViewCell.identifier,
            for: indexPath
        ) as? StocksTableViewCell
        else {
            return UITableViewCell()
        }
        
        if indexPath.row%2 == 0 {
            cell.backgroundColor = .systemBackground
        } else {
            cell.backgroundColor = .secondarySystemBackground
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = DetailsVC()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var labelArray = [UILabel]()
        let headerTitle = ["Sembol", "Fiyat", "Fark", "Hacim", "Alış", "Satış", "Değişim"]
        
        for i in 0..<7 {
            let label = UILabel()
            label.text = headerTitle[i]
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 12, weight: .regular)
            label.widthAnchor.constraint(equalToConstant: view.width).isActive = true
            label.heightAnchor.constraint(equalToConstant: 50).isActive = true
            labelArray.append(label)
        }
        
        let stackView = UIStackView(arrangedSubviews: labelArray)
        stackView.frame = CGRect(x: 0, y: 0, width: view.width, height: 50)
        stackView.center = view.center
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        stackView.backgroundColor = .secondarySystemBackground
        
        return stackView
    }
    
}

extension MainVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
