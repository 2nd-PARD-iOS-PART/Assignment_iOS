//
//  ViewController.swift
//  Tapbar
//
//  Created by 박서윤 on 2023/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .black
        button.tintColor = .white
        button.setTitle("LOGIN", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for:  .touchUpInside)
        return button
    }()
    
    
    func makeUI(){
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 140),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonPressed(){
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        
        vc1.title = "hi"
        vc2.title = "nice"
        vc3.title = "happy"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .lightGray
        
        
    }
    
    
}

