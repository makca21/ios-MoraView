//
//  HomeInteractor.swift
//  MoraView
//
//  Created by Şevval Armağan on 7.08.2024.
//

import Foundation

final class HomeInteractor {
    
    // MARK: Properties
    
    private var movieResponse: MovieResponse?
    
    private var task: URLSessionDataTask?
    
    weak var output: IHomeInteractorToPresenter?
    
    func fetchMovies() {
        // api request çağırılıp movieResponse doldurulacak
    }

}

extension HomeInteractor: IHomeInteractor {

    func getMovies() -> [MovieData]? {
        movieResponse?.results
    }
}

