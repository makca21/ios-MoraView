//
//  HomeRouter.swift
//  MoraView
//
//  Created by Şevval Armağan on 7.08.2024.
//

import UIKit

final class HomeRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
    // MARK: Static Methods
    
    static func setupModule() -> HomeViewController {
        let viewController = HomeViewController()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        let adapter = HomeAdapter(presenter: presenter, view: viewController)
        
        viewController.presenter = presenter
        viewController.adapter = adapter
        viewController.modalPresentationStyle = .fullScreen
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

extension HomeRouter: IHomeRouter {
    
    func navigateToDetail() {
      /*  let viewController = SearchDetailRouter.setupModule()
        view?.navigationController?.pushViewController(viewController, animated: true) */
      //  Oluşturulacak yeni modül (detay sayfası) yukarıdaki gibi yönlenecektir.
    }
}

