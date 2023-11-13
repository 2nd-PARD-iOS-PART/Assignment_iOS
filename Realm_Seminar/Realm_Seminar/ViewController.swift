//
//  ViewController.swift
//  Realm_Seminar
//
//  Created by 김하람 on 2023/11/05.
//

import UIKit
import RealmSwift

let realm = try! Realm()

class ViewController: UIViewController {
    // 만들어둔 Data를 해당 클래스 내에서 사용하기 위한 변수 선언
    var member: [Data] = []
    
    // MARK: - ui 초기 설정
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
        // 각 버튼에 대한 함수 연결하기
        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editData), for: .touchUpInside)
        
        // viewDidLoad에서 loadMemberList함수를 호출함으로써 앱 실행과 동시에 데이터를 가져올 수 있습니다.
        loadMemberList()
        
        // realm 주소 출력을 위한 코드. xcode내부 세팅을 타고 realm에 접근할 수도 있습ㄴ다.
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    // MARK: - 제약 조건 설정하기
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
    
    // MARK: - add 버튼 클릭 시 실행될 함수 : 텍스트필드, alert, realm.add
    @objc func add() {
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
    
    // edit 버튼을 눌렀을 때 실행되는 함수
    @objc func editData() {
        print("edit button Pressed")
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell 만들기.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        // 각 셀 index에 맞게 member 데이터 가져와서 members라는 변수에 저장해두기
        let members = member[indexPath.row]
        // 가져온 데이터를 다음 형식에 맞게 cell에 보여주기
        cell.textLabel?.text = "[ \(members.part) ] \(members.name)"
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
    }
   
}
