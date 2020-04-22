//
//  MovieViewController+CollectionView.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieDatas?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                let imageURL = URL(string: URLPath.posterPath + (self.movieDatas?[indexPath.row].poster_path ?? ""))
                do {
                    cell.movieTitle.text = self.movieDatas?[indexPath.row].title
                    if let imageURL = imageURL {
                        let imageData = try Data(contentsOf: imageURL)
                        cell.movieImage.image = UIImage(data: imageData)
                    }
                }
                catch {
                    print("An error has occured: Image not Found! using default image")
                    cell.movieImage.image = UIImage(systemName: "play.rectangle")
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (movieDatas?.count ?? 1) - 1 {
            if !(page > dataSource!.page) {
                loadMoreData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetail = MovieDetailViewController(nibName: "MovieDetailViewController", bundle: nil)
        movieDetail.movieData = movieDatas?[indexPath.row]
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
    
}
