//
//  soonViewController.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/02.
//

import UIKit

class UpcomingViewController: UIViewController {

    // delegate로 UpcomingSubViewDelegate 연결
    var memo: UpcomingModel?
    weak var delegate: UpcomingSubViewDelegate?
    
    // tableview 사용, 한 단위: cell
    private let UpcomingTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let UpcomingController = UISearchController(searchResultsController: nil)
    
    // searchBar
    private let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbar()
        view.backgroundColor = .systemBackground
        view.addSubview(UpcomingTable)
        UpcomingTable.delegate = self
        UpcomingTable.dataSource = self
        setTableView()
    }
    
    func setTableView() {
        // 위치
        UpcomingTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            UpcomingTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            UpcomingTable.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            UpcomingTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            UpcomingTable.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    // Navigation Bar
    private func configureNavbar() {
        let item1Font = UIFont.systemFont(ofSize: 20, weight: .bold)
        let logoImage = UIImage(named: "bell logo")?.withRenderingMode(.alwaysOriginal)
        let logo = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: nil)
        let item1 = UIBarButtonItem(title: "Notifications", style: .plain, target: self, action: #selector(barButtonPressed))
        item1.setTitleTextAttributes([NSAttributedString.Key.font: item1Font, NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        navigationItem.leftBarButtonItems = [logo, item1]
    }
        
    // button 눌렀을 때
    @objc private func barButtonPressed() {
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        UpcomingTable.frame = view.bounds
    }
    
    func navigateToUpcomingSubView() {
            let upcomingSubViewController = UpcomingSubViewController()
            navigationController?.pushViewController(upcomingSubViewController, animated: true)
        }
    
    // button 눌렀을 때
    @objc func playButtonTapped() {
        navigateToUpcomingSubView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)

            let detailViewController = DetailViewController()
            
            detailViewController.memo = UpcomingModel.UpcomingModelData[0][indexPath.row]
            
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    
    func subViewTouchDidMove() {
        
    }
    
    func subViewTouchDidEnd() {
        
    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
     //  Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return UpcomingModel.UpcomingModelData[0].count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UpcomingModel.UpcomingModelData[0].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let model = UpcomingModel.UpcomingModelData[0][indexPath.row]

        let attributedText = NSMutableAttributedString(string: model.title)

        // Nov 6 의 글자크기 작게 만들기
        if let range = model.title.range(of: "Nov 6") {
            let nsRange = NSRange(range, in: model.title)
            attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: nsRange)
        }

        cell.textLabel?.attributedText = attributedText
        cell.textLabel?.numberOfLines = 3
        cell.textLabel?.lineBreakMode = .byWordWrapping

        // image 크기
        if let image = UIImage(named: model.image) {
            let imageSize = CGSize(width: 113, height: 55)
            cell.imageView?.frame = CGRect(x: 10, y: 10, width: imageSize.width, height: imageSize.height)
            cell.imageView?.image = image
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension UIImage {
    func resized(to newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}
