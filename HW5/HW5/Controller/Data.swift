//
//  Data.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/13.
//

import UIKit
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var part: String = ""
}
