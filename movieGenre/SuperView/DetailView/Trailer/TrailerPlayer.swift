//
//  TrailerPlayer.swift
//  movieGenre
//
//  Created by William Inx on 23/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class TrailerPlayer {
    var movie:Movie?
    var video:Video?
    var dataSource:VideoResult?
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    private func playVideo() {
        if let dataSource = self.dataSource {
            for result in dataSource.results {
                if result.site.lowercased() == "youtube" {
                    if result.type.lowercased() == "trailer" {
                        self.video = result
                        print("VIDEO")
                        openVideoPlayer()
                    }
                }
            }
        }
    }
    
    private func openVideoPlayer() {
        let videoID = video?.key
        if let videoID = videoID {
            var url = URL(string: URLPath.deepLinkYoutubePath + videoID)!
            if !UIApplication.shared.canOpenURL(url) {
                url = URL(string: URLPath.videoPath + videoID)!
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    func getVideo() {
        Request.fetchData(urlType: .video, containerType: VideoResult.self, id: movie?.id ?? -1) { (result) in
            DispatchQueue.main.async {
                self.dataSource = result as? VideoResult
                self.playVideo()
            }
        }
    }
}
