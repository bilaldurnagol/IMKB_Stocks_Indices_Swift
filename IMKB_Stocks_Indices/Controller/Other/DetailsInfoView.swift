//
//  DetailsInfoView.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 5.05.2021.
//

import UIKit

final class DetailsInfoView: UIView {
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.text = "HALKB"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "2.4"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let differenceLabel: UILabel = {
        let label = UILabel()
        label.text = "0.02"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let volumeLabel: UILabel = {
        let label = UILabel()
        label.text = "580"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let sellLabel: UILabel = {
        let label = UILabel()
        label.text = "0.51"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let buyLabel: UILabel = {
        let label = UILabel()
        label.text = "0.54"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let changeLabel: UILabel = {
        let label = UILabel()
        label.text = ">"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let dailyHighLabel: UILabel = {
        let label = UILabel()
        label.text = "2.7"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let dailyLowLabel: UILabel = {
        let label = UILabel()
        label.text = "2.9"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "116"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let highLabel: UILabel = {
        let label = UILabel()
        label.text = "2.45"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let lowLabel: UILabel = {
        let label = UILabel()
        label.text = "2.50"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    private let rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        addSubview(leftStackView)
        addSubview(rightStackView)
        
        leftStackView.addArrangedSubview(symbolLabel)
        leftStackView.addArrangedSubview(priceLabel)
        leftStackView.addArrangedSubview(differenceLabel)
        leftStackView.addArrangedSubview(volumeLabel)
        leftStackView.addArrangedSubview(buyLabel)
        leftStackView.addArrangedSubview(sellLabel)
        
        rightStackView.addArrangedSubview(dailyLowLabel)
        rightStackView.addArrangedSubview(dailyHighLabel)
        rightStackView.addArrangedSubview(totalLabel)
        rightStackView.addArrangedSubview(highLabel)
        rightStackView.addArrangedSubview(lowLabel)
        rightStackView.addArrangedSubview(changeLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        leftStackView.frame = CGRect(
            x: 10,
            y: 0,
            width: width/2-10,
            height: height
        )
        
        rightStackView.frame = CGRect(
            x: leftStackView.right,
            y: 0,
            width: width/2-10,
            height: height
        )
    }
}
