//
//  ViewController.swift
//  DelegateSample
//
//  Created by 이신원 on 2023/10/28.
// github.com/byoth/pard

import UIKit

//instagram - @byoboyy

class ViewController: UIViewController {
//    var model: Model(
    var check: Bool = false
    var count: Int = 0 {
        didSet{
            countLabel.text = "\(count)"
        }
    }
    
    
    lazy var subView: SubView = {
        let view = SubView(frame: .init(
            origin: .init(x: 50, y: 50),
            size: .init(width: 300, height: 300)
        ))
        view.delegate = self
        view.backgroundColor = .red
        return view
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel(frame: .init(
            origin: .init(x: 50, y: 400),
            size: .init(width: 100, height: 50)
        ))
//        label.backgroundColor = .yellow
        label.tintColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(subView)
        view.addSubview(countLabel)
        
    }


}


extension ViewController: SubViewDelegate{
    func subViewTouchDidEnd() {
        check = true
    }
    
    func subViewTouchDidMove() {
        if(!check){
            count += 1
        }
    }
}


//    struct Model{
//        var count: Int
//        var isDisabled: Bool
//
//        mutating func increaseCount(){
//
//        }
//
//    }
