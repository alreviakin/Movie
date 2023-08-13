//
//  HomeView.swift
//  Movie
//
//  Created by Алексей Ревякин on 12.08.2023.
//

import UIKit
import SnapKit

class HomeView: UIView {
    weak var delegate: HomeViewDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = delegate
        collection.bounces = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = UIColor(red: 45/255, green: 40/255, blue: 51/255, alpha: 1)
        collection.register(CollectionCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(HeaderSuplementaryView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: "Header")
        return collection
    }()
    
    func configure() {
        didLoad()
        layout()
    }
    
    private func didLoad() {
        addSubview(collectionView)
    }
    
    private func layout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func createSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize:
                    .init(
                        widthDimension: .fractionalWidth(0.4),
                        heightDimension: .fractionalHeight(0.3)
                    ),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.boundarySupplementaryItems = [suplemantaryHeadarItem()]
        return section
    }
    
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(section: createSection())
    }
    
    private func suplemantaryHeadarItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        return .init(
            layoutSize:
                    .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(50)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
    }
}
