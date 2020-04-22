//
//  MovieViewController.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class MovieViewController: SuperViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var genre:Genre?
    var dataSource:MovieResult?
    var movieDatas:[Movie]?
    var page = 1
    var cellID = "movieCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        super.setupView()
        self.title = (genre?.name ?? "Generic") + " Movies"
        
        let collectionViewCell = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        collectionView.register(collectionViewCell, forCellWithReuseIdentifier: cellID)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func loadData() {
        Request.fetchData(urlType: .movie, containerType: MovieResult.self, page: page , id: genre?.id ?? -1) { (result) in
            DispatchQueue.main.async {
                self.dataSource = result as? MovieResult
                self.movieDatas = self.dataSource?.results
                self.collectionView.reloadData()
            }
        }
    }
    
    func loadMoreData() {
        page += 1
        Request.fetchData(urlType: .movie, containerType: MovieResult.self, page: page, id: genre?.id ?? 1) { (result) in
            DispatchQueue.main.async {
                self.dataSource = result as? MovieResult
                self.movieDatas = self.movieDatas! + self.dataSource!.results
                self.collectionView.reloadData()
            }
        }
    }
}
