//
//  ThirdViewController.swift
//  ram_Navi_code
//
//  Created by 김하람 on 2023/07/23.
//

import UIKit

class ThirdViewControllerr: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setUI()
    }
    
    func setUI(){
        let label = UILabel()
        label.text = "🤍 LOVE 🤍"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
