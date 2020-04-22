//
//  VideoResult.swift
//  movieGenre
//
//  Created by William Inx on 23/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct VideoResult: Decodable {
    var id:Int
    var results:[Video]
}
