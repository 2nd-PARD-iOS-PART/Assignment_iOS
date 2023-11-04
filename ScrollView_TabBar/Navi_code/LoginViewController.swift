//
//  ViewController.swift
//  Navi_code
//
//  Created by 김하람 on 2023/07/23.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI();
    }

    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue //
        button.tintColor = .white
        button.setTitle("JOIN US", for: .normal) //
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
        let vc3 = ThirdViewControllerr()
        
        //
        vc1.title = "iOS"
        vc2.title = "PARD"
        vc3.title = "LOVE"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: true)
        tabBarVC.modalPresentationStyle = .formSheet //
        tabBarVC.tabBar.backgroundColor = .black //
        
        // 아이템이 있으면 아이템을, 없으면 else문을 반환한다.
        guard let items = tabBarVC.tabBar.items else { return }
        // tabBarVC에 있는 배열에 순서대로 접근하여 각 아이템에 접근
        items[0].image = UIImage(systemName: "apple.logo")//
        items[1].image = UIImage(systemName: "figure.surfing")?.withTintColor(.white) //
        items[2].image = UIImage(systemName: "heart.fill")?.withTintColor(.white) //
        tabBarVC.tabBar.tintColor = UIColor.red
        present(tabBarVC, animated: true, completion: nil)
    }
}
