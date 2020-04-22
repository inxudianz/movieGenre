//
//  Video.swift
//  movieGenre
//
//  Created by William Inx on 23/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct Video: Decodable {
    var id:String
    var iso_639_1:String
    var iso_3166_1:String
    var key:String
    var name:String
    var site:String
    var size:Int
    var type:String
}
