//
//  ViewController.swift
//  TableView
//
//  Created by 박서윤 on 2023/11/05.
//


//
//  ViewController.swift
//  tableview_study
//
//  Created by 진세진 on 2023/07/24.
//
// -------------------- tableView -----------------------------------

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    // tableview 만들기 -> flutter에서는 listview라고 하는 위젯이랑 같은 맥락이다. scollview의 하위 자식으로.,,,
    // code로 구현하기 위해서는 taableview 객체 선언 이후 필요한 프로토콜 작성 delegate 패턴 사용 하면 됩니다!!!
    // cell또한 custom 해주면 됩니다!!!
    // 말로는 간단한데.. 생각보다 많은 걸 요구함.. start!!!
    
    private let tableView = UITableView();
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        // 이게 필수 임니당 tableview를 이용하기 위해 프로토콜 UITableViewDataSource와 UITableViewDelegate를 채택하고
        // 해당 함수를 구현하는 view컨트롤러를 self로 이 뷰컨트롤러에서 구현해준다는 선언을 한 것 이다.
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        setTableview()
        setHeader()
    }
    func setHeader(){
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let headerlabel = UILabel(frame: header.bounds)
        headerlabel.text = "first section"
        headerlabel.textColor = .black
        headerlabel.textAlignment = .center
        headerlabel.font = UIFont.monospacedSystemFont(ofSize: 30, weight: .bold)
        header.addSubview(headerlabel)
        
        tableView.tableHeaderView = header
    }
    func setTableview(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
        tableView.register(Democell.self, forCellReuseIdentifier: "cell")
    }
}

@available(iOS 13.0, *)
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    //section의 header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        customView.backgroundColor = .gray
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.width - 10, height: 30))
        label.text = "information header"
        label.textAlignment =  .center
        label.textColor = .white
        customView.addSubview(label)
        return customView
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    //section의 footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        customView.backgroundColor = .gray
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.width - 10, height: 30))
        label.text = "wellcome to tableView footer"
        label.textAlignment = .center
        label.textColor = .white
        customView.addSubview(label)
        return customView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    //몇개의 section이 들어 갈 것인가요?!!
    func numberOfSections(in tableView: UITableView) -> Int {
        return Model.medeling.count
    }
    // cell의 갯수 item!! // 필수함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.medeling[section].count
    }
    // tableView의 cell에 어떤 데이터가 들어갈지 코드로 만들어 주었다. //필수함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Democell
            else{
                print("fail to damocell")
                return UITableViewCell()
        }
        let data =  Model.medeling[indexPath.section][indexPath.item]
        
        cell.textlabel.text = data.title
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.secondaryLabel.cgColor
        

        return cell
    }
}

