//
//  upcomingmodel.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/03.
//

import Foundation

struct UpcomingModel {
    var title : String
    var image : String

}

#if DEBUG

extension UpcomingModel{
    static var UpcomingModelData = [
        [
            UpcomingModel(title: "New Arrival \nEl Chapo \nNov 6", image: "upcoming view1"),
            UpcomingModel(title: "New Arrival \nPeaky Blinders \nNov 6", image: "upcoming view2"),
        ]
    ]
}

#endif
