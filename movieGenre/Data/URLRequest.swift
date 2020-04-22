//
//  URLRequest.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct URLRequest {
    let apiKey = "42804c42740e86e52a3b4ab2c1248ed9"
    var url:String = ""
    var genreID = ""
    var movieID = ""
    var page = ""
    
    init(type: URLType, page: String = "", id: String = "") {
        self.page = page
        self.genreID = id
        self.movieID = id
        updateURL(type: type)
    }
    
    mutating func updateURL(type: URLType) {
        if type == .genre {
            self.url = "https://api.themoviedb.org/3/genre/movie/list?api_key=" + apiKey + "&language=en-US"
        }
        else if type == .movie {
            self.url = "https://api.themoviedb.org/3/discover/movie?api_key=" + apiKey + "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=" + page + "&with_genres=" + genreID
        }
        else if type == .review {
            self.url = "https://api.themoviedb.org/3/movie/" + movieID + "/reviews?api_key=" + apiKey + "&language=en-US&page=" + page
        }
        else if type == .video {
            self.url = "https://api.themoviedb.org/3/movie/" + movieID + "/videos?api_key=" + apiKey + "&language=en-US"
        }
    }
}

enum URLType: String {
    case genre = "genre"
    case movie = "movie"
    case review = "review"
    case video = "video"
}
