//
//  GenrePresenter.swift
//  movieGenre
//
//  Created by William Inx on 25/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class GenrePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    var dataSource:GenreResult?
    
    func updateView() {
        interactor?.fetchGenre()
    }
    
    func displayMovieList(index: Int) {
        let originView = view?.showOrigin()
        router?.showMovieList(genre: dataSource!, index: index, view: originView!)
    }
    
    func getDataSource() -> GenreResult {
        return dataSource ?? GenreResult(genres: [])
    }
    
    func setDataSource(dataSource: GenreResult) {
        self.dataSource = dataSource
    }
}

extension GenrePresenter: InteractorToPresenterProtocol {
    func genreFetched(genre: GenreResult) {
        view?.showGenre(genre: genre)
    } 
}
