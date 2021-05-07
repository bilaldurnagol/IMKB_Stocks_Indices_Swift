//
//  MainVC.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 5.05.2021.
//

import UIKit
import SideMenu

class MainVC: UIViewController {
    
    private var stocks: StocksResponse
    
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
    
    var menu: SideMenuNavigationController?
    
    init(stocks: StocksResponse) {
        self.stocks = stocks
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbar()
        view.backgroundColor = .systemBackground
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        setMenu()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //navigation bar
    private func setNavbar() {
        title = "IMKB Hisse Senetleri/Endeksler"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.horizontal.3"),
            style: .plain,
            target: self,
            action: #selector(didTapMenu)
        )
    }
    
    //menu
    private func setMenu() {
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        //slide left touch
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    
    //MARK: - objc
    
    @objc private func didTapMenu() {
        present(menu!, animated: true)
    }
}

extension MainVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stock = stocks.stocks[indexPath.row]
        
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
        
        cell.configure(stock: stock)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let stock = stocks.stocks[indexPath.row]
        let id = String(stock.id)
        APICaller.shared.getDetailsStock(with: id, completion: {[weak self] result in
            switch result {
            case .failure(let error): print(error.localizedDescription)
            case .success(let stock):
                DispatchQueue.main.async {
                    let vc = DetailsVC(stock: stock)
                    vc.modalPresentationStyle = .fullScreen
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        })
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
