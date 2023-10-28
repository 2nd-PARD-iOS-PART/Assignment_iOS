//
//  CollectionViewTableViewCell.swift
//  HW4
//
//  Created by 박서윤 on 2023/10/21.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {

    var models: [Model] = []
    var tableViewSection: Int = 0

    static let identifier = "CollectionInTableViewCell"

    private let collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    func configure(with section: Int, models: [Model]) {
        tableViewSection = section
        self.models = models
        collectionView.reloadData()
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            fatalError("Could not dequeue CollectionViewCell")
        }

        let model = models[indexPath.item]
        cell.configure(with: model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    // Size for each item in the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch tableViewSection {
        case 0:
            return CGSize(width: 150, height: 170)
        case 1:
            return CGSize(width: 126, height: 227)
        default:
            return CGSize(width: 125, height: 200)
        }
    }
}

