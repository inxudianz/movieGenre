//
//  ViewController.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class ViewController: SuperViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource:GenreResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        loadData()
    }
    
    override func setupView() {
        super.setupView()
        self.title = "Movie Genre"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func loadData() {
        Request.fetchData(urlType: .genre, containerType: GenreResult.self) { (result) in
            DispatchQueue.main.async {
                self.dataSource = result as? GenreResult
                self.tableView.reloadData()
            }
        }
    }

}

