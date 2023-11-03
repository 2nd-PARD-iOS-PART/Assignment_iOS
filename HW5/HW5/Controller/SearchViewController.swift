//
//  SearchViewController.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/02.
//

import UIKit

class SearchViewController: UIViewController {
    private let SearchTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    private let searchController = UISearchController(searchResultsController: nil)

    private let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        // UISearchController settings
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a show, movie, genre, etc"
        searchController.searchBar.searchTextField.backgroundColor = UIColor.clear

        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .regular)
        searchController.searchBar.setImage(UIImage(systemName: "mic.fill", withConfiguration: imageConfig), for: .bookmark, state: .normal)
        searchController.searchBar.showsBookmarkButton = true

        // Navigation
        title = "Search"

        // search bar
        makeSearchBar()

        view.addSubview(SearchTable)
        SearchTable.delegate = self
        SearchTable.dataSource = self

        setHeader()
        setTableView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SearchTable.frame = view.bounds
    }

    // Header label
    func setHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let h_label = UILabel(frame: header.bounds)
        h_label.text = "Popular Searches"
        h_label.textAlignment = .left
        h_label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        header.addSubview(h_label)

        SearchTable.tableHeaderView = header
    }

    func setTableView() {
        // 위치
        SearchTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            SearchTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            SearchTable.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            SearchTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            SearchTable.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }

    // searchBar 구성
    func makeSearchBar() {
        searchBar.placeholder = "Search for a show, movie, genre, etc"

        // SearchBar style = minimal
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = UIColor.gray

        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .regular)
        let mic = UIBarButtonItem(image: UIImage(systemName: "mic.fill", withConfiguration: imageConfig), style: .plain, target: self, action: nil)
        mic.tintColor = .white

        // Assign the searchBar to navigationItem
        navigationItem.rightBarButtonItem = mic
        navigationItem.titleView = searchBar
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SearchModel.SearchModelData[0].count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchModel.SearchModelData[0].count
    }

    // 한 단위를 cell로 표현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // 이미지 넣기
        let model = SearchModel.SearchModelData[0][indexPath.row]
        cell.textLabel?.text = model.title
        cell.imageView?.image = UIImage(named: model.image)

        // play button
        let playButton = UIButton(type: .system)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .white
        playButton.frame = CGRect(x: cell.contentView.frame.width - 40, y: cell.contentView.frame.height / 2 - 15, width: 30, height: 30)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        cell.contentView.addSubview(playButton)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    // button 눌렀을 때
    @objc func playButtonTapped() {
        // Add the action to perform when the button is tapped
        print("Play button tapped")
    }
}
