//
//  searchmodel.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/02.
//

import Foundation


struct SearchModel {
    var title : String
    var image : String

}

#if DEBUG

extension SearchModel{
    static var SearchModelData = [
        [
            SearchModel(title: "어바웃 타임", image: "search1"),
            SearchModel(title: "미드 나잇 선", image: "search2"),
            SearchModel(title: "노트북", image: "search3"),
            SearchModel(title: "해리포터", image: "search4"),
            SearchModel(title: "로스쿨", image: "search5"),
            SearchModel(title: "너의 시간 속으로", image: "search6"),
            SearchModel(title: "발레리나", image: "search7"),
            SearchModel(title: "사냥개들", image: "search8"),
            SearchModel(title: "보이스", image: "search9"),
            SearchModel(title: "동백꽃 필 무렵", image: "search10")
        ]
    ]
}

#endif
