//
//  GenreInteractor.swift
//  movieGenre
//
//  Created by William Inx on 25/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class GenreInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchGenre() {
        Request.fetchData(urlType: .genre, containerType: GenreResult.self) { (result) in
            DispatchQueue.main.async {
                let dataSource = result as! GenreResult
                self.presenter?.genreFetched(genre: dataSource)
            }
        }
    }
    
    
}
