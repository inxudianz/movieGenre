//
//  MovieResult.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct MovieResult: Decodable {
    var page: Int
    var results:[Movie]
    var total_results: Int
    var total_pages: Int
    
}
