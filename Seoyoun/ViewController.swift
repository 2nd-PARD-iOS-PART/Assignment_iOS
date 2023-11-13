//
//  ViewController.swift
//  Seoyoun
//
//  Created by 박서윤 on 2023/11/09.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    var member: [Data] = []
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    let homeTitle: UILabel = {
        let label = UILabel()
        label.text = "🏄‍♀️ PARD 타는 사람들 🏄🏻‍♂️"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.systemCyan, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(addButton)
        view.addSubview(editButton)
        view.addSubview(homeTitle)
        addConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editData), for: .touchUpInside)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: homeTitle.topAnchor, constant: 100),
            tableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            editButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            homeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            homeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    @objc func add() {
        print("buttonPRessed")
    }
    
    @objc func editData() {
        print("edit button Pressed")
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let members = member[indexPath.row]
        cell.textLabel?.text = "hi"
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
    }
   
}


