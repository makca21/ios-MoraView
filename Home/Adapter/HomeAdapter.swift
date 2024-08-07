//
//  HomeAdapter.swift
//  MoraView
//
//  Created by Şevval Armağan on 7.08.2024.
//

import UIKit

final class HomeAdapter: NSObject{
    
    // MARK: Properties
    
    private let presenter: IHomePresenter
    private let view: IHomeView
    
    // MARK: Lifecycle
    
    init(presenter: IHomePresenter, view: IHomeView) {
        self.presenter = presenter
        self.view = view
    }
}

// MARK: - UICollectionViewDataSource

extension HomeAdapter: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getMovies().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HomeCell
        
       let movie = presenter.getMovies()[indexPath.item]
            cell.set(
                name: movie.title ?? "n/a",
                imageUrls: [],
                delegate: self
            )
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension HomeAdapter: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 250)
    }
}

// MARK: - HomeCellDelegate

extension HomeAdapter: HomeCellDelegate {
    
    func handleImageView(imageData: Data) {
        presenter.handleImageView(imageData: imageData)
    }
}

