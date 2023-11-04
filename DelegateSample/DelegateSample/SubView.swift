//
//  SubView.swift
//  DelegateSample
//
//  Created by 이신원 on 2023/10/28.
//

import UIKit

class SubView: UIView{
    var delegate: SubViewDelegate?//상위 count 변수 값을 업데이트 해주기 위해, delegate를 사용
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        delegate?.subViewTouchDidMove()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        delegate?.subViewTouchDidEnd()
    }
}

protocol SubViewDelegate{
    func subViewTouchDidMove()
    func subViewTouchDidEnd()
}
