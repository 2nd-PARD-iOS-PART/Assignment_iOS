//
//  SecondViewController.swift
//  ram_Navi_code
//
//  Created by 김하람 on 2023/07/23.
//

import UIKit

class SecondViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setUi()
    }
    
    func setUi(){
        let label = UILabel()
        label.text = "🌊 PARD 🌊"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
//            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20)
        ])
        
    }
    
    
}
