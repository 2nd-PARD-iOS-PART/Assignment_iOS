//
//  UpcomingHeaderUIView.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/03.
//

import UIKit

class UpcomingHeaderUIView: UIView {

    //Header 부분 - title
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 2
//        label.text = "Stranger \nThings"
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()

    //Header 부분 - subtitle
//    private let subTitleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "TV Shows • textTwo • TV Shows • US"
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()

    //Header 부분 image
    private let upImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named:"upcoming header")
        return imageView
    }()

    private let upImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named:"N series")
        return imageView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(upImageView)
        addSubview(upImageView2)

//        addGradient()
//        addSubview(titleLabel)
//        addSubview(subTitleLabel)
//        applyConstraints()r
    }


    // label 위치 조정
//    private func applyConstraints(){
//        let titleLabelConstraints = [
//            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200)
//        ]
//
//        let subTitleLabelConstraints = [
//            subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
//        ]
//
//        NSLayoutConstraint.activate(titleLabelConstraints)
//        NSLayoutConstraint.activate(subTitleLabelConstraints)
//    }

    override func layoutSubviews() {
        super.layoutSubviews()
        upImageView.frame = bounds
        upImageView2.frame = bounds

    }

    required init?(coder: NSCoder){
        fatalError()
    }
    

    
    
}






