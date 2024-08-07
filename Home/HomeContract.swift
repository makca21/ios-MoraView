//
//  HomeContract.swift
//  MoraView
//
//  Created by Şevval Armağan on 7.08.2024.
//

import Foundation

protocol IHomeView: AnyObject {
    func setupCollectionView() 
}

protocol IHomePresenter: AnyObject {
    
    func viewDidLoad()
    func viewWillAppear()
    func getMovies() -> [MovieData] 
    func handleImageView(imageData: Data)

}

protocol IHomeInteractor: AnyObject {
    func getMovies() -> [MovieData]? 
}

protocol IHomeInteractorToPresenter: AnyObject {

}

protocol IHomeRouter: AnyObject {
    func navigateToDetail()
}

