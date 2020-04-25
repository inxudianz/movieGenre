//
//  GenreProtocol.swift
//  movieGenre
//
//  Created by William Inx on 25/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

protocol PresenterToViewProtocol: class {
    func showGenre(genre: GenreResult)
    func showOrigin() -> UIViewController
}

protocol InteractorToPresenterProtocol: class {
    func genreFetched(genre: GenreResult)
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchGenre()
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    
    func updateView()
    func displayMovieList(index: Int)
    
    func getDataSource() -> GenreResult
    func setDataSource(dataSource: GenreResult)
    
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
    func showMovieList(genre: GenreResult, index: Int, view:UIViewController)
}
