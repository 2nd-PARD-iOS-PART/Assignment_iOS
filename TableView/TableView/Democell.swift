//
//  democell.swift
//  TableView
//
//  Created by 박서윤 on 2023/11/05.
//

//
//  Democell.swift
//  tableview_study
//
//  Created by 진세진 on 2023/07/24.
//

import UIKit

class Democell : UITableViewCell{
    let textlabel = UILabel()
    let addImage = UIImage()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        contentView.addSubview(textlabel)
        setUplabel()
    }
    
    func setUplabel(){
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textlabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textlabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15)
        ])
    }
}
