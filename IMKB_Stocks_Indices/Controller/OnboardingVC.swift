//
//  ViewController.swift
//  IMKB_Stocks_Indices
//
//  Created by Bilal Durnagöl on 5.05.2021.
//

import UIKit

class OnboardingVC: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("IMKB Hisse Senetleri/Endeksler", for: .normal)
        button.backgroundColor = .secondaryLabel
        button.layer.cornerRadius = 4.0
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "IMKB Hisse ve Endeksler"
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(
            x: 0,
            y: 0,
            width: 250,
            height: 250
        )
        imageView.center = view.center
        
        button.frame = CGRect(
            x: 20,
            y: imageView.bottom,
            width: view.width-40,
            height: 50
        )
    }
    
    //MARK: Objc Funcs
    
    @objc private func didTapButton() {
        let vc = MainVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}

