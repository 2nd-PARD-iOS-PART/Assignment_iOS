//
//  HomeViewController.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/02.
//

import UIKit

class DetailViewController: UIViewController {
    
    var memo: UpcomingModel?
    weak var delegate: DetailViewControllerDelegate?
    
    func sendDataBackToUpcoming() {
            if let memo = memo {
                delegate?.didUpdateData(memo)
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
         
        //가장 상단에 나오는 부분
        let headerView = UpcomingHeaderUIView(frame: CGRect(x: 0, y: 0, width: 375, height: 210))
        homeFeedTable.tableHeaderView = headerView
    }
    
    
    private let upImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named:"upcoming header")
        return imageView
    }()
    
    
     //section 구분
    let sectionTitles : [String] = ["Previews", "Continue Watching for Seoyoun", "My List", "Europe movie", "Romance/Drama", "Action/Thriller"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    
    @objc private func barButtonPressed(){
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

}

protocol DetailViewControllerDelegate: AnyObject {
    func didUpdateData(_ memo: UpcomingModel)
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }

    //각 section에 이미지 넣기 (model과 연결)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
                return UITableViewCell()
            }
        //사용할 데이터를 결정할 섹션 번호 설정
        cell.configure(with: indexPath.section, models: Model.ModelData[indexPath.section])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{return}
        header.textLabel?.font = .systemFont(ofSize: 19, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return sectionTitles[section]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {//to stick the navigationbar to the top
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
    }
}
