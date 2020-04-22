//
//  MovieDetailViewController.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class MovieDetailViewController: SuperViewController {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var popularityValue: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var releaseDateValue: UILabel!
    
    @IBOutlet weak var movieOverview: UILabel!
    
    var movieData:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func setupView() {
        super.setupView()
        
        self.title = "Movie Detail"
        
        let imageURL = URL(string: URLPath.posterPath + (movieData?.poster_path ?? ""))
        do {
            if let imageURL = imageURL {
                let imageData = try Data(contentsOf: imageURL)
                movieImage.image = UIImage(data: imageData)
            }
        }
        catch {
            print("An error has occured: Image not Found!")
        }
        
        movieTitle.text = movieData?.title
        popularityValue.text = movieData?.popularity.description
        releaseDateValue.text = movieData?.release_date
        
        movieOverview.text = movieData?.overview
        
    }
    
    @IBAction func onClickReviewButton(_ sender: Any) {
        let reviewViewController = ReviewViewController(nibName: "ReviewViewController", bundle: nil)
        reviewViewController.movie = movieData
        self.present(reviewViewController, animated: true)
        
    }
    @IBAction func onClickTrailerButton(_ sender: Any) {
        if let movie = movieData {
            let trailerPlayer = TrailerPlayer(movie: movie)
            trailerPlayer.getVideo()
        }
    }
    
}
