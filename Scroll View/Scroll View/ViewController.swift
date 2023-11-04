//
//  ViewController.swift
//  Scroll View
//
//  Created by 박서윤 on 2023/11/04.
//


// NotificationCenter:
// 1:N의 이벤트나 데이터를 전달하고 처리할 때 사용된다.
// (하나에서 여러개로 데이터를 전달할 때 사용)

import UIKit

// 1. 이름 지정하기
extension Notification.Name {
    static let myNotification = Notification.Name("myNotification")
}

class ViewController: UIViewController {
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "버튼을 눌러보세요"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.frame = CGRect(x: 100, y: 200, width: 200, height: 40)
        return lbl
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 40))
        btn.setTitle("Button", for: .normal)
        btn.backgroundColor = .black
        
        // button을 클릭했을 때 할 target을 추가
        // selector와 @objc은 필연!!
        
        
        // buttonPressed 함수를 call
//        btn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        // openNavigation 함수를 call
//        btn.addTarget(self, action: #selector(openNavigation), for: .touchUpInside)
        
        // openModal 함수를 call
        btn.addTarget(self, action: #selector(openModal), for: .touchUpInside)

        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(label)
        view.addSubview(button)
        
        // Observer 추가 (myNotification에 관해서 추가하겠다)
        // 3. addObserver로 알림 수신하기
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: .myNotification, object: nil)
    }
    

    // 버튼을 누르면
    @objc func buttonPressed() {
        // 2. notificationCenter.default.post로 알림 보내기
        NotificationCenter.default.post(name: .myNotification, object: nil)
        print("🌸")
    }
    
    // 관찰자로 등록할 때 실행되는 함수
    @objc func handleNotification() {
        label.text = "Notification 받았다"
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // 화면전환을 하고 싶어서 만든 함수 (SecondViewController 로 이동)
//    @objc func openNavigation() {
//        let secondVC = SecondViewController()
//        self.navigationController?.pushViewController(secondVC, animated: true)
//    }
    
    
    // present를 이용해서 띄우고 dismiss를 통해 없앨 수 있음, present를 이용해서 modal를 보여줌
    @objc func openModal() {
        let secondVC = SecondViewController()
        let navController = UINavigationController(rootViewController: secondVC)
        self.present(navController, animated: true, completion: nil)
    }

}


