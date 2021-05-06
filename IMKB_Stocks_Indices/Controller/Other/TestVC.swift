//
//  TestVC.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 5.05.2021.
//

import UIKit

class TestVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        var labelArray = [UILabel]()
        let headerTitle = ["Sembol", "Fiyat", "Fark", "Hacim", "Alış", "Satış", "Değişim"]
        
        for i in 0..<7 {
            let label = UILabel()
            label.text = headerTitle[i]
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 12, weight: .medium)
            label.widthAnchor.constraint(equalToConstant: view.width).isActive = true
            label.heightAnchor.constraint(equalToConstant: view.height).isActive = true
            labelArray.append(label)
        }
        
        let stackView = UIStackView(arrangedSubviews: labelArray)
        stackView.frame = CGRect(x: 0, y: 0, width: view.width, height: 50)
        stackView.center = view.center
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        
        view.addSubview(stackView)
    }
    
    override func viewDidLayoutSubviews() {
        
    }
}
