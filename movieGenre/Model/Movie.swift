//
//  Movie.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    var poster_path: String
    var adult: Bool
    var overview: String
    var release_date: String
    var genre_ids: [Int]
    var id: Int
    var original_title: String
    var original_language: String
    var title: String
    var backdrop_path: String
    var popularity: Float
    var vote_count: Int
    var video: Bool
    var vote_average: Float
}
