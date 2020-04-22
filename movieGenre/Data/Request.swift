//
//  Request.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class Request {
    
    static func fetchData<T: Decodable>(urlType: URLType, containerType: T.Type, page: Int = 1, id: Int = 1, completion: @escaping (Decodable) -> Void) {
        let urlRequest:URLRequest
        
        switch urlType {
        case .genre:
            urlRequest = URLRequest(type: urlType)
        case .movie:
            urlRequest = URLRequest(type: urlType, page: String(page), id: String(id))
        case .review:
            urlRequest = URLRequest(type: urlType, page: String(page), id: String(id))
        case .video:
            urlRequest = URLRequest(type: urlType, id: String(id))
        }
        
        if let url = URL(string: urlRequest.url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        
                        let json = try jsonDecoder.decode(containerType, from: data)
                        
                        completion(json)
                    }
                    catch {
                        dump(error)
                    }
                }
            }.resume()
        }
    }
}
