//
//  MovieDetail.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct Review: Decodable {
    var id:String
    var author:String
    var content:String
    var url:String
}
