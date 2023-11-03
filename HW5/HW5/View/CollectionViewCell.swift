//
//  CollectionViewCell.swift
//  HW5
//
//  Created by 박서윤 on 2023/11/02.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(imageView)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Model) {
        label.text = model.title
        imageView.image = UIImage(named: model.image)
    }
}
