////
////  UpcomingHeaderUIView.swift
////  HW5
////
////  Created by 박서윤 on 2023/11/03.
////
//
//import UIKit
//
//class UpcomingHeaderUIView: UIView {
//
//    //Header 부분 - title
////    private let titleLabel: UILabel = {
////        let label = UILabel()
////        label.numberOfLines = 2
////        label.text = "Stranger \nThings"
////        label.textAlignment = .center
////        label.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
////        label.translatesAutoresizingMaskIntoConstraints = false
////        return label
////    }()
//
//    //Header 부분 - subtitle
////    private let subTitleLabel: UILabel = {
////        let label = UILabel()
////        label.text = "TV Shows • textTwo • TV Shows • US"
////        label.textAlignment = .center
////        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
////        label.translatesAutoresizingMaskIntoConstraints = false
////        return label
////    }()
//
//    //Header 부분 image
//    private let upImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleToFill
//        imageView.clipsToBounds = true
//        imageView.image = UIImage(named:"upcoming header")
//        return imageView
//    }()
//
//    private let upImageView2: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleToFill
//        imageView.clipsToBounds = true
//        imageView.image = UIImage(named:"N series")
//        return imageView
//    }()
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addSubview(upImageView)
//        addSubview(upImageView2)
//
////        addGradient()
////        addSubview(titleLabel)
////        addSubview(subTitleLabel)
////        applyConstraints()r
//    }
//
//
//    // label 위치 조정
////    private func applyConstraints(){
////        let titleLabelConstraints = [
////            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
////            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200)
////        ]
////
////        let subTitleLabelConstraints = [
////            subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
////            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
////        ]
////
////        NSLayoutConstraint.activate(titleLabelConstraints)
////        NSLayoutConstraint.activate(subTitleLabelConstraints)
////    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        upImageView.frame = bounds
//        upImageView2.frame = bounds
//
//    }
//
//    required init?(coder: NSCoder){
//        fatalError()
//    }
//    
//
//    
//    
//}
//




import UIKit

class UpcomingHeaderUIView: UIView {

    // Header 부분 image
    private let upImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "upcoming header")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let upImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "N series")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //    //Header 부분 - subtitle
    private let TitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Selling Sunset"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let upImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "upcoming information")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    private let button = UIButton(type: .system) = {
//        button.setTitle("Find Something to Download", for: .normal)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        button.backgroundColor = .white
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
//        button.layer.cornerRadius = 6
//        button.setTitleColor(UIColor.black, for: .normal)
//        button.widthAnchor.constraint(equalToConstant: 280).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
//        button.translatesAutoresizingMaskIntoConstraints = false
//    }()

    // play button
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle(" Play", for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.addTarget(UpcomingHeaderUIView.self, action: #selector(buttonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 6
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false // Move this line to here
//        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return button
    
    }()
    
    // download button
    private let button2: UIButton = {
        let button2 = UIButton(type: .system)
        button2.backgroundColor = .black
        button2.setTitle(" Download", for: .normal)
        button2.setImage(UIImage(systemName: "download.fill"), for: .normal)
        button2.addTarget(UpcomingHeaderUIView.self, action: #selector(buttonTapped), for: .touchUpInside)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button2.layer.cornerRadius = 6
        button2.setTitleColor(UIColor.white, for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false // Move this line to here
//        button2.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        button2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return button2
    
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(upImageView)
        addSubview(upImageView2)
        addSubview(TitleLabel)
        addSubview(upImageView3)
        addSubview(button)
        addSubview(button2)


        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    private func setupConstraints() {
        // Constraints for upImageView
        NSLayoutConstraint.activate([
            upImageView.topAnchor.constraint(equalTo: topAnchor),
            upImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            upImageView.widthAnchor.constraint(equalTo: widthAnchor),
            upImageView.heightAnchor.constraint(equalTo: heightAnchor)
        ])

        // Constraints for upImageView2
        NSLayoutConstraint.activate([
            upImageView2.topAnchor.constraint(equalTo: upImageView.bottomAnchor),
            upImageView2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            upImageView2.trailingAnchor.constraint(equalTo: trailingAnchor),
            upImageView2.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1) // Adjust multiplier as needed
        ])

        // Constraints for TitleLabel
        NSLayoutConstraint.activate([
            TitleLabel.topAnchor.constraint(equalTo: upImageView2.bottomAnchor, constant: 8), // Adjust spacing as needed
            TitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8), // Adjust leading space as needed
            TitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30), // Adjust trailing space as needed
            TitleLabel.heightAnchor.constraint(equalToConstant: 35) // Adjust height as needed
        ])
        
        // Constraints for upImageView2
        NSLayoutConstraint.activate([
            upImageView3.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 8),
            upImageView3.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            upImageView3.trailingAnchor.constraint(equalTo: trailingAnchor),
            upImageView3.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08) // Adjust multiplier as neededs
        ])

       //button의 위치
       NSLayoutConstraint.activate([
        button.centerXAnchor.constraint(equalTo: upImageView3.centerXAnchor),
        button.topAnchor.constraint(equalTo: upImageView3.bottomAnchor,constant: 8),
        button.widthAnchor.constraint(equalTo: widthAnchor, constant: 359)
//            button.topAnchor.constraint(equalTo: upImageView3.bottomAnchor, constant: 8),
//            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            button.trailingAnchor.constraint(equalTo: trailingAnchor),
//            button.heightAnchor.constraint(equalTo: heightAnchor)
       ])
        
        //button2의 위치
        NSLayoutConstraint.activate([
         button2.centerXAnchor.constraint(equalTo: button.centerXAnchor),
         button2.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 8),
         button2.widthAnchor.constraint(equalTo: widthAnchor, constant: 359)
 //            button2.topAnchor.constraint(equalTo: upImageView3.bottomAnchor, constant: 8),
 //            button2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
 //            button2.trailingAnchor.constraint(equalTo: trailingAnchor),
 //            button2.heightAnchor.constraint(equalTo: heightAnchor)
        ])
}

@objc func buttonTapped() {
}

    
}



