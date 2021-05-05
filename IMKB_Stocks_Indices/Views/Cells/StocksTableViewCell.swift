//
//  StocksTableViewCell.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 5.05.2021.
//

import UIKit

class StocksTableViewCell: UITableViewCell {
    
    static let identifier = "StocksTableViewCell"
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.text = "HALKB"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "2.4"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let differenceLabel: UILabel = {
        let label = UILabel()
        label.text = "0.02"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let volumeLabel: UILabel = {
        let label = UILabel()
        label.text = "580"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let changeLabel: UILabel = {
        let label = UILabel()
        label.text = ">"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let sellLabel: UILabel = {
        let label = UILabel()
        label.text = "0.51"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let buyLabel: UILabel = {
        let label = UILabel()
        label.text = "0.54"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(symbolLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(differenceLabel)
        stackView.addArrangedSubview(volumeLabel)
        stackView.addArrangedSubview(sellLabel)
        stackView.addArrangedSubview(buyLabel)
        stackView.addArrangedSubview(changeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = contentView.bounds
    }
    
    func configure() {
        
    }
    
}
