//
//  DownloadViewController.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/02.
//

import UIKit
import RealmSwift

let realm = try! Realm()

class DownloadViewController: UIViewController {
    
    var member: [Data] = []
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    
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
//            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 704),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 280),
        ])
        
        
        
        loadMemberList()

    }
    
    @objc func buttonTapped() {
        // MARK: - add 버튼 클릭 시 실행될 함수 : 텍스트필드, alert, realm.add
            // alert 설정하기
            let alert = UIAlertController(title: "데이터를 추가하시겠습니까?", message: "message", preferredStyle: .alert)
            // alert 창 내부에 텍스트필드 생성하기
            alert.addTextField{ text in
                text.placeholder = "이름을 입력하세요."
            }
            alert.addTextField { text in
                text.placeholder = "나이를 입력하세요."
            }
            alert.addTextField { text in
                text.placeholder = "파트를 입력하세요."
            }
            // alert 창 하단에 '확인' 버튼 생성하기
            alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
                // 확인 버튼 클릭 시 임시 변수에 각 필드 데이터 저장해두기
                guard
                    let name = alert.textFields?[0].text, !name.isEmpty,
                    let ageString = alert.textFields?[1].text, let age = Int(ageString),
                    let part = alert.textFields?[2].text, !part.isEmpty
                        
                else {
                    print("텍스트 입력에 오류가 발생했습니다.")
                    return
                }
                // 안전하게 옮겨 둔 필드 데이터를 Data 각 변수 안에 넣기
                let newMember = Data()
                newMember.name = name
                newMember.age = age
                newMember.part = part
                
                // realm.write를 통해 realm에 추가한 데이터 add 하기
                do {
                    try realm.write {
                        realm.add(newMember)
                        // 데이터 추가 후, 다시 리스트 load 하기
                        self.loadMemberList()
                    }
                } catch let error {
                    print("Error saving to Realm: \(error)")
                }
            })
            // alert를 보여주기 위해 필요한 코드. 만들어둔 alert를 present 방식으로 보여주기
            self.present(alert, animated: true)
        }
    
    
    // realm에 저장돼 있는 데이터를 다시 불러오는 함수
    func loadMemberList(){
        // realm에서 가져온 데이터를 member라는 변수에 저장하기.
        let member = realm.objects(Data.self)
        // self.member에 넣어주기 위해 Array로 타입 변환하여 저장하기
        self.member = Array(member)
        // tableView 다시 로드하기. reloadData()는 내장함수입니다.
        tableView.reloadData()
    }
}


