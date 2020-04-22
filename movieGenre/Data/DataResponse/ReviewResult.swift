//
//  ReviewResult.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct ReviewResult: Decodable {
    var id:Int
    var page:Int
    var results:[Review]
    var total_pages:Int
    var total_results:Int
}
