//
//  HomeViewController.swift
//  Movie
//
//  Created by Алексей Ревякин on 12.08.2023.
//

import UIKit

class HomeViewController: UIViewController {
    private var homeView = HomeView()
    private var viewModel = HomeViewModel()
    
    override func loadView() {
        super.loadView()
        view = homeView
        homeView.delegate = self
        homeView.configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
//        switch indexPath.section {
//        case 0:
//            cell.backgroundColor = .red
//        case 1:
//            cell.backgroundColor = .white
//        case 2:
//            cell.backgroundColor = .brown
//        default:
//            cell.backgroundColor = .black
//        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? HeaderSuplementaryView else {
            return UICollectionReusableView()
        }
        return header
    }
}
