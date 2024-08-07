//
//  HomePresenter.swift
//  MoraView
//
//  Created by Şevval Armağan on 7.08.2024.
//

import Foundation

final class HomePresenter {
    
    // MARK: Properties
    
    weak var view: IHomeView?
    var router: IHomeRouter?
    var interactor: IHomeInteractor?
}

extension HomePresenter: IHomePresenter {
    
    func viewDidLoad() {
        view?.setupCollectionView()
    }
    
    func viewWillAppear() {
    }
    
    func getMovies() -> [MovieData] {
        interactor?.getMovies() ?? []
    }
    
    func handleImageView(imageData: Data) {
        router?.navigateToDetail()
    }
}

extension HomePresenter: IHomeInteractorToPresenter {
    
}

