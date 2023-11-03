//
//  UpcomingViewControllerDelegate.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/03.
//

import Foundation


protocol UpcomingSubViewDelegate: AnyObject {
    func navigateToUpcomingSubView()
    func subViewTouchDidMove()
    func subViewTouchDidEnd()
}
