//
//  MainTabBarViewController.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/02.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        // NavigationController(TabBarController)
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: UpcomingViewController())
        let vc4 = UINavigationController(rootViewController: DownloadViewController())
        let vc5 = UINavigationController(rootViewController: ListViewController())
        
        //tabBar logo
        vc1.tabBarItem.image = UIImage(named: "home")
        vc2.tabBarItem.image = UIImage(named: "search")
        vc3.tabBarItem.image = UIImage(named: "coming")
        vc4.tabBarItem.image = UIImage(named: "download")
        vc5.tabBarItem.image = UIImage(named: "more")
        
        //tabBar title
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Coming soon"
        vc4.title = "Downloads"
        vc5.title = "More"
        
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }

}

extension MainTabBarViewController {
    @objc func injected() {
        viewDidLoad()
    }
}
