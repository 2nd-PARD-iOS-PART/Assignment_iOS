//
//  DownloadViewController.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/02.
//

import UIKit

class DownloadViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // downloadIcon
        let downloadIconImageView = UIImageView()
        let downloadIconImage = UIImage(named: "downloadicon")
        downloadIconImageView.image = downloadIconImage
        view.addSubview(downloadIconImageView)
        downloadIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // download label
        let label = UILabel()
        label.text = "Movies and TV shows that you\ndownload appear here."
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // download button
        let button = UIButton(type: .system)
        button.setTitle("Find Something to Download", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 6
        button.setTitleColor(UIColor.black, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 280).isActive = true
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        //downloadIconImage의 위치
        NSLayoutConstraint.activate([
            downloadIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadIconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 248),
            downloadIconImageView.widthAnchor.constraint(equalToConstant: 194),
            downloadIconImageView.heightAnchor.constraint(equalToConstant: 194)
        ])
        
        //label의 위치
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 474),
        ])
        
        //button의 위치
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 704),
        ])
    }
    
    @objc func buttonTapped() {
    }
}


