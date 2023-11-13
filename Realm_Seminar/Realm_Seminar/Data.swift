//
//  Data.swift
//  Realm_Seminar
//
//  Created by 김하람 on 2023/11/05.
//

import UIKit
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var part: String = ""
}
