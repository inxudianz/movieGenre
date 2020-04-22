//
//  ReviewViewController.swift
//  movieGenre
//
//  Created by William Inx on 22/04/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class ReviewViewController: SuperViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource:ReviewResult?
    var reviewDatas:[Review]?
    var cellID = "reviewCell"
    var movie:Movie?
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        super.setupView()
        
        self.title = "Reviews"
        
        let tableViewCell = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        tableView.register(tableViewCell, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    override func loadData() {
        Request.fetchData(urlType: .review, containerType: ReviewResult.self, page: page, id: movie?.id ?? 0) { (result) in
            DispatchQueue.main.async {
                self.dataSource = result as? ReviewResult
                self.reviewDatas = self.dataSource?.results
                if self.reviewDatas?.count == 0 {
                    self.tableView.isHidden = true
                }
                else {
                    self.tableView.isHidden = false
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func loadMoreData() {
        page += 1
        Request.fetchData(urlType: .review, containerType: ReviewResult.self, page: page, id: movie?.id ?? -1) { (result) in
            DispatchQueue.main.async {
                self.dataSource = result as? ReviewResult
                self.reviewDatas = self.reviewDatas! + self.dataSource!.results
                self.tableView.reloadData()
            }
        }
    }
}
