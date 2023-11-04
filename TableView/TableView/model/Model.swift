//
//  Model.swift
//  TableView
//
//  Created by 박서윤 on 2023/11/05.
//

//
//  Model.swift
//  tableview_study
//
//  Created by 진세진 on 2023/07/24.
//

import Foundation

struct Model{
    var subtitle : String
    var title: String
}

extension Model{
    static var medeling = [
            [
                Model(subtitle: "hello", title: "section 1"),
                Model(subtitle: "hello", title: "hello"),
                Model(subtitle: "hello", title: "swift"),
                Model(subtitle: "hello", title: "pard"),
                Model(subtitle: "hello", title: "ios pard"),
            ],
            [
                Model(subtitle: "section 2", title: "section 2"),
                Model(subtitle: "section 2", title: "ios pard"),
                Model(subtitle: "section 2", title: "swift"),
                Model(subtitle: "section 2", title: "pard"),
            ]
    ]
}

