//
//  Data.swift
//  HW6
//
//  Created by 박서윤 on 2023/11/13.
//

import UIKit
import RealmSwift

class Data: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var summary: String = ""
}
