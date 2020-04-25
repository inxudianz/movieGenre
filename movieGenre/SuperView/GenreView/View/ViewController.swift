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
    
    var presenter:ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        presenter?.updateView()
    }
    
    override func setupView() {
        super.setupView()
        self.title = "Movie Genre"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: PresenterToViewProtocol {
    func showOrigin() -> UIViewController {
        return self
    }
    
    func showGenre(genre: GenreResult) {
        presenter?.setDataSource(dataSource: genre)
        self.tableView.reloadData()
    }
}

