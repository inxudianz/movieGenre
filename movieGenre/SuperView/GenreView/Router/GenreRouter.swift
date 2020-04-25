//
//  GenreRouter.swift
//  movieGenre
//
//  Created by William Inx on 25/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class GenreRouter: PresenterToRouterProtocol {
    
    func showMovieList(genre: GenreResult, index: Int, view: UIViewController) {
        let movieView = MovieViewController(nibName: "MovieViewController", bundle: nil)
        movieView.genre = genre.genres[index]
        
        view.navigationController?.pushViewController(movieView, animated: true)
    }
    
    static var genreStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createModule() -> UIViewController {
        let navbar = genreStoryboard.instantiateViewController(withIdentifier: "genreNavigation")
        
        if let view = navbar.children.first as? ViewController {
            let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = GenrePresenter()
            let interactor: PresenterToInteractorProtocol = GenreInteractor()
            let router: PresenterToRouterProtocol = GenreRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter
            return navbar
        }
        return UIViewController()
    }
    
    
}
