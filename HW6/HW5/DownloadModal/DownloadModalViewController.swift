//////
//////  DownloadModalViewController.swift
//////  HW6
//////
//////  Created by 박서윤 on 2023/11/13.
//////
//
//import UIKit
//import RealmSwift
//
//
//class DownloadModalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    lazy var tableView: UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
//
//    lazy var addButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Download", for: .normal)
//        button.setTitleColor(.systemBlue, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//
//        view.addSubview(tableView)
//        view.addSubview(addButton)
//        addConstraints()
//
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
//    }
//
//    func addConstraints() {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor),
//
//            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
//        ])
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return DataManager.shared.member.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let data = DataManager.shared.member[indexPath.row]
//
//        cell.textLabel?.text = "[\(data.title)] \(data.summary)"
//        cell.textLabel?.textColor = .black
//        cell.backgroundColor = .white
//
//        return cell
//    }
//
//    @objc func add() {
//        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) else {
//            return
//        }
//
//        if let titleTextField = cell.contentView.subviews.compactMap({ $0 as? UITextField }).first,
//           let summaryTextField = cell.contentView.subviews.compactMap({ $0 as? UITextField }).first,
//           let title = titleTextField.text, !title.isEmpty,
//           let summary = summaryTextField.text, !summary.isEmpty {
//
//            let newMember = Data()
//            newMember.title = title
//            newMember.summary = summary
//
//            DataManager.shared.member.append(newMember)
//            tableView.reloadData()
//        } else {
//            print("Text input error.")
//        }
//    }
//}


import UIKit

protocol DownloadModalDelegate: AnyObject {
    func addData(_ data: Data)
}

class DownloadModalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    weak var delegate: DownloadModalDelegate?

    var member: [Data] = []

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(tableView)
        view.addSubview(addButton)
        addConstraints()

        tableView.dataSource = self
        tableView.delegate = self

        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let titleTextField = UITextField()
        titleTextField.placeholder = "Title"
        titleTextField.borderStyle = .roundedRect
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(titleTextField)

        let summaryTextField = UITextField()
        summaryTextField.placeholder = "Summary"
        summaryTextField.borderStyle = .roundedRect
        summaryTextField.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(summaryTextField)

        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
            titleTextField.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),

            summaryTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 8),
            summaryTextField.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            summaryTextField.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
        ])

        return cell
    }

    @objc func add() {
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) else {
            return
        }

        if let titleTextField = cell.contentView.subviews.compactMap({ $0 as? UITextField }).first,
            let summaryTextField = cell.contentView.subviews.compactMap({ $0 as? UITextField }).first,
            let title = titleTextField.text, !title.isEmpty,
            let summary = summaryTextField.text, !summary.isEmpty {

            let newMember = Data()
            newMember.title = title
            newMember.summary = summary

            delegate?.addData(newMember)
            tableView.reloadData()
        } else {
            print("Text input error.")
        }
    }
}
