//
//  models.swift
//  HW4
//
//  Created by 박서윤 on 2023/10/21.
//

import Foundation


struct Model {
    var title : String
    var image : String

}

#if DEBUG

extension Model{
    static var ModelData = [
        [
            Model(title: "Previews", image: "preview1"),
            Model(title: "Previews", image: "preview2"),
            Model(title: "Previews", image: "preview3"),
            Model(title: "Previews", image: "preview4")
        ],
        [
            Model(title: "Continue watiching for Seoyoun", image: "continue1"),
            Model(title: "Continue watiching for Seoyoun", image: "continue2"),
            Model(title: "Continue watiching for Seoyoun", image: "continue3"),
            Model(title: "Continue watiching for Seoyoun", image: "continue4")
        ],
        [
            Model(title: "My list", image: "list1"),
            Model(title: "My list", image: "list2"),
            Model(title: "My list", image: "list3"),
            Model(title: "My list", image: "list4")
        ],
        [
            Model(title: "Europe movie", image: "europe1"),
            Model(title: "Europe movie", image: "europe2"),
            Model(title: "Europe movie", image: "europe3"),
            Model(title: "Europe movie", image: "europe4")
        ],
        [
            Model(title: "Romance/Drama", image: "romance1"),
            Model(title: "Romance/Drama", image: "romance2"),
            Model(title: "Romance/Drama", image: "romance3"),
            Model(title: "Romance/Drama", image: "romance4")
        ],
        [
            Model(title: "Action/Thriller", image: "action1"),
            Model(title: "Action/Thriller", image: "action2"),
            Model(title: "Action/Thriller", image: "action3"),
            Model(title: "Action/Thriller", image: "action4")
        ]
    ]
}
#endif
