//
//  DataManager.swift
//  HW6
//
//  Created by 박서윤 on 2023/11/13.
//

import Foundation

class DataManager {
    static let shared = DataManager()

    private init() {}

    var member: [Data] = []
}
