//
//  MenuListController.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 6.05.2021.
//

import UIKit

class MenuListController: UITableViewController {
    private let items = [
        "Hisse ve Endeksler",
        "Yükselenler",
        "Düşenler",
        "Hacme Göre - 30",
        "Hacme Göre - 50",
        "Hacme Göre - 100"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.sectionHeaderHeight = 200
        tableView.separatorStyle = .none
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: .zero)
        headerView.backgroundColor = .systemBackground
        
        let imageView = UIImageView(
            frame: CGRect(
                x: 20,
                y: 20,
                width: 100,
                height: 100
            )
        )
        
        imageView.image = UIImage(named: "logo_minimal")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel(
            frame: CGRect(
                x: 20,
                y: imageView.bottom,
                width: 200,
                height: 80
            )
        )
        label.text = "VERİPARK\nIMKB Hisse Senetleri/Endeksler"
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 13, weight: .regular)
        
        headerView.addSubview(imageView)
        headerView.addSubview(label)
        
        return headerView
    }
    
}

