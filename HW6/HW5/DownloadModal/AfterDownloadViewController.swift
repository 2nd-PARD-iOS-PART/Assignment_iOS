//
//  AfterDownloadViewController.swift
//  HW6
//
//  Created by 박서윤 on 2023/11/13.
//
import UIKit


// modal 화면에서 추가된 데이터들을 볼 수 있음
class AfterDownloadViewController: UIViewController, UITableViewDataSource {

    var member: [Data] = []

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(tableView)
        addConstraints()

        tableView.dataSource = self

        // download button
        let downloadButton = UIButton(type: .system)
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        view.addSubview(downloadButton)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
        ])
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let data = member[indexPath.row]

        // 영화제목 보여주기
        let titleLabel = UILabel()
        titleLabel.text = data.title
        titleLabel.textColor = .black
        cell.contentView.addSubview(titleLabel)

        // 영화 줄거리 보여주기
        let summaryLabel = UILabel()
        summaryLabel.text = data.summary
        summaryLabel.textColor = .black
        cell.contentView.addSubview(summaryLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),

            summaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            summaryLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            summaryLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
        ])

        return cell
    }

    @objc func downloadButtonTapped() {
        let downloadModalViewController = DownloadModalViewController()
        downloadModalViewController.delegate = self
        let navController = UINavigationController(rootViewController: downloadModalViewController)
        self.present(navController, animated: true, completion: nil)
    }
}

extension AfterDownloadViewController: DownloadModalDelegate {
    func addData(_ data: Data) {
        member.append(data)
        tableView.reloadData()
    }
}
